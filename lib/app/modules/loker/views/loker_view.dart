import 'dart:async';

import 'package:digantara/app/Widgets/CategoryItem.dart';
import 'package:digantara/app/Widgets/TextInput.dart';
import 'package:digantara/app/modules/loker/views/jobstreet_view.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/loker_controller.dart';

class LokerView extends GetView<LokerController> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: dPrimaryColor,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Lokal',
              ),
              Tab(
                text: 'Nasional',
              ),
            ],
          ),
          title: const Text('Loker Desa'),
          centerTitle: false,
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        // CategoryItem('Semua', true),
                        // CategoryItem('Kategori 1', false),
                        // CategoryItem('Kategori 2', false),
                        // CategoryItem('Kategori 3', false),
                        // CategoryItem('Kategori 4', false),
                        // CategoryItem('Kategori 5', false),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: dDefaultPadding),
                  child: Column(
                    children: [
                      TextInput(
                          hint: 'Cari lowongan pekerjaan..', isDisable: false),
                      SizedBox(height: 10),
                      Card(
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            // color: Colors.amber,
                            child: FlutterLogo(),
                          ),
                          title: Text('Kasir Toko Baju'),
                          subtitle: Text('UD Berkah Jaya '),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            WebView(
              initialUrl: "https://www.jobstreet.co.id",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            ),
          ],
        ),
      ),
    );
  }
}
