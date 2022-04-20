import 'package:digantara/app/modules/shop/providers/shop_provider.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  static RxBool isLoading = true.obs;
  static RxList categoryShopList = [].obs;
  static RxList productList = [].obs;
  static RxString catShop = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getCategoryShop();
    getProduct();
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
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void getProduct() async {
    isLoading(true);
    try {
      print('running get product');
      var product = await ShopProvider.fetchProduct();
      if (product != null) {
        productList.assignAll(product);
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
    getProduct();
  }
}
