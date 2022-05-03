import 'dart:convert';

import 'package:digantara/app/modules/shop/product_model.dart';
import 'package:digantara/app/modules/shop/providers/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  static RxBool isLoading = true.obs;
  static RxList categoryShopList = [].obs;
  static RxList productList = [].obs;
  static RxString catShop = ''.obs;
  TextEditingController cari = TextEditingController();

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

  getProduct() async {
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

  searchProduct(String query) {
    if (productList.isEmpty || query.isEmpty) {
      print('tidak ada');
      getProduct();
    } else {
      var result = productList
          .where((product) =>
              product.namaProduct.toLowerCase().contains(query.toLowerCase()))
          .toList();
      productList.assignAll(result);
      catShop.value = '';
      var hasilcari = json.encode(productList);
      print(hasilcari);
    }
  }

  filterCategoryProduct(String category) async {
    await getProduct();
    if (productList.isEmpty || category.isEmpty) {
      print('tidak ada');
      await getProduct();
    } else {
      var result = productList
          .where((product) => product.kategoriProduct
              .toLowerCase()
              .contains(category.toLowerCase()))
          .toList();
      productList.assignAll(result);
      var hasilcari = json.encode(productList);
      print(hasilcari);
    }
  }

  Future<void> refreshShop() async {
    print('on refresh');
    getCategoryShop();
    getProduct();
  }
}
