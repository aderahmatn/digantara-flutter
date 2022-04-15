import 'dart:async';

import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/profil_desa_controller.dart';

class ProfilDesaView extends GetView<ProfilDesaController> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Desa Saya'),
        backgroundColor: dPrimaryColor,
        centerTitle: false,
      ),
      body: WebView(
        initialUrl: "https://kliknusantara.digital",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
