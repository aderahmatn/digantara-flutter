import 'package:digantara/app/Widgets/ButtonPrimary.dart';
import 'package:digantara/app/Widgets/PasswordInputIcon.dart';
import 'package:digantara/app/Widgets/TextInputIcon.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        elevation: 0,
        toolbarHeight: 30,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: dPrimaryColor,
                image: DecorationImage(
                  image: AssetImage('assets/images/brand.jpeg'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  color: dPrimaryColor,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextInputIcon(
                          action: TextInputAction.next,
                          controller: controller.email,
                          hint: 'Email',
                          icon: FontAwesomeIcons.solidEnvelope,
                        ),
                        SizedBox(height: 15),
                        PasswordInputIcon(
                          controller: controller.password,
                        ),
                        SizedBox(height: 25),
                        Obx(() {
                          return ButtonPrimary(
                            isDisable: !controller.isComplete.value,
                            title: 'Masuk',
                            action: () {
                              print(controller.email.value.text);
                              print(controller.password.value.text);
                            },
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
