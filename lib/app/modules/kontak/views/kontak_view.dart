import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kontak_controller.dart';

class KontakView extends GetView<KontakController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KontakView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'KontakView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
