import 'package:digantara/app/modules/shop/providers/shop_provider.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  static RxBool isLoading = true.obs;
  static RxList categoryShopList = [].obs;
  static RxString catShop = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getCategoryShop();
    super.onReady();
  }

  @override
  void onClose() {}

  void getCategoryShop() async {
    isLoading(true);
    try {
      print('running get category shop');
      var category = await ShopProvider.fetchCategoryShop();
      if (category != null) {
        categoryShopList.assignAll(category);
        print('runi shop');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> refreshShop() async {
    print('on refresh');
    getCategoryShop();
  }
}
