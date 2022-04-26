import 'package:digantara/app/Widgets/BannerItemsShimmer.dart';
import 'package:digantara/app/Widgets/ButtonOutlineIcon.dart';
import 'package:digantara/app/Widgets/CategoryItem.dart';
import 'package:digantara/app/Widgets/NewsItem.dart';
import 'package:digantara/app/Widgets/ShimmerWidget.dart';
import 'package:digantara/app/Widgets/TopBanner.dart';
import 'package:digantara/app/Widgets/UsernameCard.dart';
import 'package:digantara/app/Widgets/newsItemShimmer.dart';
import 'package:digantara/app/modules/home/controllers/home_controller.dart';
import 'package:digantara/app/modules/login/controllers/login_controller.dart';
import 'package:digantara/app/modules/news/views/detail_news_view.dart';
import 'package:digantara/app/routes/app_pages.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  final newsC = Get.put(NewsController());
  final LoginC = Get.put(LoginController());
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
                          child: Obx(() {
                            if (LoginC.isLogin.value == false) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                              );
                            } else {
                              return UsernameCard(
                                name:
                                    GetStorage().read('namaLengkap').toString(),
                              );
                            }
                          }),
                        ),
                      ),
                      Obx(() {
                        if (NewsController.isLoadingBanner.value == true) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: ScrollPhysics(),
                            child: Row(
                              children: [
                                BannerItemShimmer(size: size),
                                BannerItemShimmer(size: size),
                              ],
                            ),
                          );
                        } else {
                          if (NewsController.bannerList.length == 0) {
                            return Container(
                                padding: EdgeInsets.only(top: 15),
                                height: size.height * 0.20,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  height: 145,
                                  // width: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Gagal Memuat Data'),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 60, vertical: 10),
                                          child: ButtonOutlineIcon(
                                            title: 'Muat Ulang',
                                            action: () {
                                              NewsController().getBanner();
                                            },
                                            icon: Icons.refresh_rounded,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          } else {
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
                          }
                        }
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
                    if (NewsController.isLoading.value == true) {
                      return SingleChildScrollView(
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            categoryNewsItemShimmer(),
                            categoryNewsItemShimmer(),
                            categoryNewsItemShimmer(),
                            categoryNewsItemShimmer(),
                            categoryNewsItemShimmer(),
                          ],
                        ),
                      );
                    } else {
                      return ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: NewsController.categoryList.length + 1,
                          itemBuilder: (context, index) {
                            return index == 0
                                ? Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: CategoryItem(
                                        'Semua',
                                        NewsController.catNews.value
                                                    .toString() ==
                                                ''
                                            ? true
                                            : false,
                                        '', () {
                                      NewsController.catNews.value = '';
                                      NewsController().getNews();
                                      NewsController().getCategoryNewsClicked();
                                    }),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(
                                        left: index == 0 ? 15 : 0),
                                    child: CategoryItem(
                                        NewsController.categoryList[index - 1]
                                            .kategoriBerita,
                                        NewsController.catNews.value
                                                    .toString() ==
                                                NewsController
                                                    .categoryList[index - 1].id
                                                    .toString()
                                            ? true
                                            : false,
                                        NewsController
                                            .categoryList[index - 1].id
                                            .toString(), () {
                                      NewsController.catNews.value =
                                          NewsController
                                              .categoryList[index - 1].id
                                              .toString();
                                      NewsController().getNews();
                                      NewsController().getCategoryNewsClicked();
                                    }),
                                  );
                          });
                    }
                  }),
                ),
                SizedBox(height: 15),
                Obx(() {
                  if (NewsController.isLoadingNews.value == true) {
                    return Column(
                      children: [
                        newsItemShimmer(),
                        newsItemShimmer(),
                        newsItemShimmer(),
                      ],
                    );
                  } else {
                    if (NewsController.newsList.length == 0) {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                            child: Column(
                          children: [
                            Text('Tidak Ada Berita..'),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 70),
                              child: ButtonOutlineIcon(
                                title: 'Muat Ulang',
                                action: () {
                                  NewsController().getNews();
                                },
                                icon: Icons.refresh_rounded,
                              ),
                            ),
                          ],
                        )),
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
                                Get.to(() => DetailNewsView(),
                                    arguments: index);
                              });
                        },
                      );
                    }
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

class categoryNewsItemShimmer extends StatelessWidget {
  const categoryNewsItemShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      height: 50,
      width: 100,
      child: ShimmerWidget.rectangular(height: 50),
    );
  }
}
