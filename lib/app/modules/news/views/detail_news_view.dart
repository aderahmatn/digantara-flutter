import 'package:digantara/app/modules/news/controllers/news_controller.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailNewsView extends GetView {
  final newsC = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    final idNews = Get.arguments;
    print(idNews);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        elevation: 0,
        title: Text('Berita'),
        centerTitle: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(dDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // margin: EdgeInsets.all(8),
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      image: NetworkImage(
                          'http://192.168.1.6:8000/image-berita/${NewsController.newsList[idNews].gambar}'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 20),
              Text(
                NewsController.newsList[idNews].kategoriBerita,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              SizedBox(height: 5),
              Text(
                NewsController.newsList[idNews].judulBerita,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 15),
              Text.rich(
                TextSpan(
                  text: NewsController.newsList[idNews].isiBerita,
                  style:
                      TextStyle(color: Colors.black, height: 1.5, fontSize: 14),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      NewsController.newsList[idNews].createdAt.toString(),
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.remove_red_eye_outlined,
                            size: 15,
                            color: dPrimaryColor,
                          ),
                        ),
                        Text(
                          NewsController.newsList[idNews].viewCounter,
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          color: Colors.amber,
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            size: 15,
                            color: dPrimaryColor,
                          ),
                        ),
                        Text(
                          NewsController.newsList[idNews].likeCounter,
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
