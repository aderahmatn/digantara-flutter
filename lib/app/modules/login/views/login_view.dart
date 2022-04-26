import 'package:digantara/app/Widgets/ButtonPrimary.dart';
import 'package:digantara/app/Widgets/LoadingIndicator.dart';
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
      body: Obx(() {
        if (controller.isLoading.value) {
          return LoadingIndicator();
        } else {
          return Column(
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
                        padding: EdgeInsets.only(
                          top: 30,
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextInputIcon(
                              onChanged: controller.emailValidation,
                              type: TextInputType.emailAddress,
                              action: TextInputAction.next,
                              controller: controller.email,
                              hint: 'Email',
                              icon: FontAwesomeIcons.solidEnvelope,
                              errorText: controller.emailError.value,
                            ),
                            SizedBox(height: 10),
                            PasswordInputIcon(
                              errorText: controller.passwordError.value,
                              onChanged: controller.passwordValidation,
                              controller: controller.password,
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      }),
      bottomNavigationBar: Obx(() {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(bottom: 10),
          height: Get.height / 15,
          child: ButtonPrimary(
            isDisable: !controller.isComplete.value,
            title: 'Masuk',
            action: controller.submitLogin,
          ),
          color: Colors.transparent,
          width: 0,
        );
      }),
    );
  }
}
