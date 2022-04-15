import 'package:digantara/app/Widgets/CategoryItem.dart';
import 'package:digantara/app/modules/news/news_category_model.dart';
import 'package:digantara/app/modules/news/providers/banner_provider.dart';
import 'package:digantara/app/modules/news/providers/news_provider.dart';
import 'package:digantara/app/modules/news/banner_model.dart';
import 'package:get/get.dart';

import '../news_model.dart';

class NewsController extends GetxController {
  static RxList newsList = <NewsModel>[].obs;
  static RxList bannerList = <BannerModel>[].obs;
  static RxList categoryList = <NewsCategoryModel>[].obs;
  static RxBool isLoading = true.obs;
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
    try {
      print('running get category news');
      isLoading(true);
      var category = await NewsProvider.fetchNewsCategory();
      if (category != null) {
        categoryList.assignAll(category);
      }
    } catch (e) {
      print(e);
    } finally {
      print('success get category news');
      isLoading(false);
    }
  }

  void getBanner() async {
    try {
      print('running get banner');
      isLoading(true);
      var banner = await BannerProvider.fetchBanner();
      if (banner != null) {
        bannerList.assignAll(banner);
      }
    } catch (e) {
      print(e);
    } finally {
      print('success get banner');
      isLoading(false);
    }
  }

  void getNews() async {
    try {
      print('running get news');
      isLoading(true);
      var news = await NewsProvider.fetchNews(catNews: catNews.value);
      if (news != null) {
        newsList.assignAll(news);
      }
    } catch (e) {
      print('eror get news');
    } finally {
      print('success get news');
      isLoading(false);
    }
  }

  Future<void> refreshNews() async {
    print('on refresh');
    getNews();
    getBanner();
    getCategoryNews();
  }
}
