import 'package:digantara/app/Widgets/CardProduct.dart';
import 'package:digantara/app/Widgets/ItemIconCategoryShop.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../controllers/shop_controller.dart';

class ShopView extends GetView<ShopController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          title: Theme(
            data: ThemeData(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: dPrimaryColor,
                  ),
            ),
            child: TextField(
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: 'Cari Barang',
                prefixIcon: Icon(Icons.search_rounded),
                contentPadding: EdgeInsets.all(10),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: dPrimaryColor.withOpacity(0.6), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: dPrimaryColor.withOpacity(0.5), width: 1),
                ),
              ),
            ),
          ),
          toolbarHeight: size.height * 0.1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: dDefaultPadding,
                ),
                child: Text(
                  'Kategori Barang',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    ItemIconCategoryShop(
                        CupertinoIcons.cube_box, 'Semua', true),
                    ItemIconCategoryShop(
                        CupertinoIcons.bed_double, 'Furniture', false),
                    ItemIconCategoryShop(
                        CupertinoIcons.guitars, 'Alat Musik', false),
                    ItemIconCategoryShop(CupertinoIcons.camera_on_rectangle,
                        'Elektronik', false),
                    ItemIconCategoryShop(
                        CupertinoIcons.arrow_up_bin, 'Hasil Tani', false),
                    ItemIconCategoryShop(
                        CupertinoIcons.circle_grid_hex, 'Kecantikan', false),
                    ItemIconCategoryShop(
                        CupertinoIcons.car_detailed, 'Kendaraan', false),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: dDefaultPadding),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Provinsi',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: Theme(
                              data: ThemeData(
                                primaryColor: Colors.amber,
                                textTheme: TextTheme(
                                  // subtitle1: TextStyle(color: Colors.black),
                                  subtitle2: TextStyle(color: Colors.amber),
                                ),
                              ),
                              child: DropdownSearch<String>(
                                mode: Mode.BOTTOM_SHEET,
                                showSelectedItems: true,
                                showSearchBox: true,
                                items: [
                                  "Semua",
                                  "Jawa Barat",
                                  "Jawa Tengah",
                                  "Jawa Timur",
                                  'DKI Jakarta'
                                ],
                                popupItemDisabled: (String s) =>
                                    s.startsWith('I'),
                                onChanged: print,
                                selectedItem: "Semua",
                                dropdownSearchDecoration: InputDecoration(
                                  filled: true,
                                  fillColor: dPrimaryColorForm,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kabupaten',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: Theme(
                              data: ThemeData(
                                primaryColor: Colors.amber,
                                textTheme: TextTheme(
                                  // subtitle1: TextStyle(color: Colors.black),
                                  subtitle2: TextStyle(color: Colors.amber),
                                ),
                              ),
                              child: DropdownSearch<String>(
                                enabled: false,
                                mode: Mode.BOTTOM_SHEET,
                                showSelectedItems: true,
                                showSearchBox: true,
                                items: [
                                  "Semua",
                                  "Bogor",
                                  "Majalengka",
                                  "Bandung",
                                  'Sumedang'
                                ],
                                popupItemDisabled: (String s) =>
                                    s.startsWith('I'),
                                onChanged: print,
                                selectedItem: "Semua",
                                dropdownSearchDecoration: InputDecoration(
                                  filled: true,
                                  fillColor: dPrimaryColorForm,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Icon(
                          Icons.filter_alt_outlined,
                          color: dPrimaryColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: dDefaultPadding),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kecamatan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: Theme(
                              data: ThemeData(
                                primaryColor: Colors.amber,
                                textTheme: TextTheme(
                                  // subtitle1: TextStyle(color: Colors.black),
                                  subtitle2: TextStyle(color: Colors.amber),
                                ),
                              ),
                              child: DropdownSearch<String>(
                                mode: Mode.BOTTOM_SHEET,
                                showSelectedItems: true,
                                showSearchBox: true,
                                items: [
                                  "Semua",
                                  "Jawa Barat",
                                  "Jawa Tengah",
                                  "Jawa Timur",
                                  'DKI Jakarta'
                                ],
                                popupItemDisabled: (String s) =>
                                    s.startsWith('I'),
                                onChanged: print,
                                selectedItem: "Semua",
                                dropdownSearchDecoration: InputDecoration(
                                  filled: true,
                                  fillColor: dPrimaryColorForm,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Desa',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: Theme(
                              data: ThemeData(
                                primaryColor: Colors.amber,
                                textTheme: TextTheme(
                                  // subtitle1: TextStyle(color: Colors.black),
                                  subtitle2: TextStyle(color: Colors.amber),
                                ),
                              ),
                              child: DropdownSearch<String>(
                                enabled: false,
                                mode: Mode.BOTTOM_SHEET,
                                showSelectedItems: true,
                                showSearchBox: true,
                                items: [
                                  "Semua",
                                  "Bogor",
                                  "Majalengka",
                                  "Bandung",
                                  'Sumedang'
                                ],
                                popupItemDisabled: (String s) =>
                                    s.startsWith('I'),
                                onChanged: print,
                                selectedItem: "Semua",
                                dropdownSearchDecoration: InputDecoration(
                                  filled: true,
                                  fillColor: dPrimaryColorForm,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(width: 1),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: GridView.count(
                  childAspectRatio: 1 / 1.5,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  physics: ScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    CardProduct(),
                    CardProduct(),
                    CardProduct(),
                    CardProduct(),
                    CardProduct(),
                    CardProduct(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
