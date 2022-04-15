import 'package:digantara/app/Widgets/CategoryItem.dart';
import 'package:digantara/app/Widgets/NewsItem.dart';
import 'package:digantara/app/Widgets/ShimmerWidget.dart';
import 'package:digantara/app/Widgets/TopBanner.dart';
import 'package:digantara/app/modules/news/views/detail_news_view.dart';
import 'package:digantara/app/routes/app_pages.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  final newsC = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/brand.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: RefreshIndicator(
        color: dPrimaryColor,
        onRefresh: newsC.refreshNews,
        child: SingleChildScrollView(
          physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  height: size.height * 0.3,
                  child: Stack(
                    children: [
                      Container(
                        height: size.height * 0.3 - 27,
                        decoration: BoxDecoration(
                          color: dPrimaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 54,
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                // offset: Offset(0, 0),
                                blurRadius: 15,
                                color: dPrimaryColor.withOpacity(0.3),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.LOGIN);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.account_circle_outlined,
                                      color: dPrimaryColor,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Masuk Akun',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: VerticalDivider(
                                  color: dPrimaryColor.withOpacity(0.5),
                                  thickness: 1.4,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.REGISTER);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.post_add_rounded,
                                      color: dPrimaryColor,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Daftar',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(() {
                        return Container(
                          padding: EdgeInsets.only(top: 15),
                          height: size.height * 0.20,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: NewsController.bannerList.length,
                            itemBuilder: (context, index) {
                              return TopBanner(NewsController
                                  .bannerList[index].gambarBanner);
                            },
                          ),
                        );
                      })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 15, bottom: 10),
                  child: Text(
                    'Berita Nasional',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 35,
                  child: Obx(() {
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: NewsController.categoryList.length,
                        itemBuilder: (context, index) {
                          return index == 0
                              ? Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: CategoryItem(
                                      'Semua',
                                      NewsController.catNews.value.toString() ==
                                              ''
                                          ? true
                                          : false,
                                      ''),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(
                                      left: index == 0 ? 15 : 0),
                                  child: CategoryItem(
                                      NewsController.categoryList[index - 1]
                                          .kategoriBerita,
                                      NewsController.catNews.value.toString() ==
                                              NewsController
                                                  .categoryList[index - 1].id
                                                  .toString()
                                          ? true
                                          : false,
                                      NewsController.categoryList[index - 1].id
                                          .toString()),
                                );
                        });
                  }),
                ),
                SizedBox(height: 15),
                Obx(() {
                  if (NewsController.isLoading.value == true) {
                    return Column(
                      children: [
                        newsItemShimmer(),
                        newsItemShimmer(),
                        newsItemShimmer(),
                      ],
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: NewsController.newsList.length,
                      itemBuilder: (context, index) {
                        return NewsItem(
                            title: NewsController.newsList[index].judulBerita
                                .toUpperCase(),
                            category:
                                NewsController.newsList[index].kategoriBerita,
                            views: NewsController.newsList[index].viewCounter
                                .toString(),
                            date: NewsController.newsList[index].createdAt
                                .toString(),
                            image: NewsController.newsList[index].gambar,
                            like: NewsController.newsList[index].likeCounter
                                .toString(),
                            idNews:
                                NewsController.newsList[index].id.toString(),
                            action: () {
                              Get.to(() => DetailNewsView(), arguments: index);
                            });
                      },
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class newsItemShimmer extends StatelessWidget {
  const newsItemShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dDefaultPadding, vertical: 7),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 90,
            width: 100,
            child: ShimmerWidget.rectangular(height: 90),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.rectangular(
                  height: 10,
                  width: 70,
                ),
                SizedBox(height: 5),
                ShimmerWidget.rectangular(height: 30),
                SizedBox(height: 5),
                ShimmerWidget.rectangular(height: 15, width: 100),
                SizedBox(height: 5),
                ShimmerWidget.rectangular(height: 10, width: 150),
              ],
            ),
          )
        ],
      ),
    );
  }
}
