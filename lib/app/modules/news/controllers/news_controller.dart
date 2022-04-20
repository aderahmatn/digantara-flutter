import 'dart:io';

import 'package:digantara/app/Widgets/ButtonOutlineIcon.dart';
import 'package:digantara/app/Widgets/ButtonPrimary.dart';
import 'package:digantara/app/Widgets/ButtonText.dart';
import 'package:digantara/app/Widgets/CategoryItem.dart';
import 'package:digantara/app/modules/news/news_category_model.dart';
import 'package:digantara/app/modules/news/providers/banner_provider.dart';
import 'package:digantara/app/modules/news/providers/news_provider.dart';
import 'package:digantara/app/modules/news/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../news_model.dart';

class NewsController extends GetxController {
  static RxList newsList = <NewsModel>[].obs;
  static RxList bannerList = <BannerModel>[].obs;
  static RxList categoryList = <NewsCategoryModel>[].obs;
  static RxBool isLoading = true.obs;
  static RxBool isLoadingNews = true.obs;
  static RxBool isLoadingCategory = true.obs;
  static RxBool isLoadingBanner = true.obs;
  static RxString catNews = ''.obs;

  @override
  void onInit() {
    getNews();
    getBanner();
    getCategoryNews();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getCategoryNews() async {
    isLoading(true);
    try {
      print('running get category news');
      var category = await NewsProvider.fetchNewsCategory();
      if (category != null) {
        categoryList.assignAll(category);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void getCategoryNewsClicked() async {
    try {
      print('running get category news');
      var category = await NewsProvider.fetchNewsCategory();
      if (category != null) {
        categoryList.assignAll(category);
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  void getBanner() async {
    try {
      print('running get banner');
      isLoadingBanner(true);
      var banner = await BannerProvider.fetchBanner();
      if (banner != null) {
        bannerList.assignAll(banner);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoadingBanner(false);
    }
  }

  void getNews() async {
    try {
      print('running get news');
      isLoadingNews(true);
      var news = await NewsProvider.fetchNews(catNews: catNews.value);
      if (news != null) {
        newsList.assignAll(news);
      } else {
        newsList.clear();
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'Koneksi Gagal',
        content: Center(
          child: ButtonOutlineIcon(
            title: 'Muat Ulang',
            action: () {
              refreshNews();
              Get.back();
            },
            icon: Icons.refresh,
          ),
        ),
      );
    } finally {
      isLoadingNews(false);
    }
  }

  Future<void> refreshNews() async {
    print('on refresh');
    getNews();
    getBanner();
    getCategoryNews();
  }
}
