import 'dart:io';

import 'package:digantara/app/Widgets/ButtonOutlineIcon.dart';
import 'package:digantara/app/Widgets/ButtonPrimary.dart';
import 'package:digantara/app/Widgets/PasswordInput.dart';
import 'package:digantara/app/Widgets/TextInput.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Daftar Akun'),
          backgroundColor: dPrimaryColor,
          centerTitle: true,
        ),
        body: Obx(() {
          if (RegisterController.isLoading.value == true) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: dPrimaryColor,
              color: Colors.white,
              strokeWidth: 5,
            ));
          } else {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(primary: dPrimaryColor),
              ),
              child: Container(
                // margin: EdgeInsets.only(bottom: 50),
                child: Obx(
                  () => Stepper(
                      elevation: 0,
                      currentStep: controller.index.value,
                      onStepContinue: () {
                        if (controller.index.value >= 0) {
                          controller.index.value += 1;
                        }
                      },
                      onStepTapped: (int i) {
                        controller.index.value = i;
                      },
                      onStepCancel: () {
                        if (controller.index.value > 0) {
                          controller.index.value -= 1;
                        }
                      },
                      type: StepperType.horizontal,
                      physics: ScrollPhysics(),
                      controlsBuilder: (context, details) {
                        return Row(
                          children: [
                            if (controller.index.value != 0)
                              Container(
                                child: Expanded(
                                    child: ButtonPrimary(
                                        title: 'Kembali',
                                        action: details.onStepCancel)),
                              ),
                            if (controller.index.value > 0) SizedBox(width: 15),
                            Container(
                              child: Expanded(
                                child: Obx(() {
                                  return ButtonPrimary(
                                    isDisable:
                                        RegisterController.isDisable.value,
                                    title: controller.index.value != 2
                                        ? 'Lanjutkan'
                                        : 'Selesai',
                                    action: controller.index.value == 2
                                        ? RegisterController.submitRegitrasi
                                        : details.onStepContinue,
                                  );
                                }),
                              ),
                            ),
                          ],
                        );
                      },
                      steps: [
                        Step(
                          state: controller.index.value > 0
                              ? StepState.complete
                              : StepState.indexed,
                          title: Text(''),
                          isActive: controller.index.value >= 0,
                          content: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Langkah 1 - Pengecekan NIK',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text.rich(
                                  TextSpan(
                                      text:
                                          'Sebelum registrasi, pastikan NIK anda sudah terdaftar di desa tempat anad tinggal. Hubungi kantor desa anda untuk memastikan.',
                                      style: TextStyle(fontSize: 15)),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  'Masukan NIK Anda',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Obx(() {
                                  return TextInput(
                                    onChanged: RegisterController.nikValidation,
                                    action: () {
                                      RegisterController.checkNik(
                                          RegisterController.nik.value.text);
                                    },
                                    hint: 'NIK KTP',
                                    controller: RegisterController.nik,
                                    isDisable: false,
                                    type: TextInputType.number,
                                    errorText:
                                        RegisterController.nikError.value,
                                  );
                                }),
                                SizedBox(height: 10),
                                Divider(),
                                SizedBox(height: 30),
                                Text(
                                  'Nama Lengkap',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextInput(
                                    hint: RegisterController.penduduk.isEmpty
                                        ? 'Nama lengkap otomatis terisi'
                                        : RegisterController.penduduk[0]
                                                ['namaLengkap']
                                            .toString()
                                            .toUpperCase(),
                                    isDisable: true),
                                SizedBox(height: 20),
                                Text(
                                  'Desa Terdaftar',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextInput(
                                    hint: RegisterController.penduduk.isEmpty
                                        ? 'Desa terdaftar otomatis terisi'
                                        : RegisterController.penduduk[0]
                                                ['namaDesa']
                                            .toString()
                                            .toUpperCase(),
                                    isDisable: true),
                                SizedBox(height: 60),
                              ],
                            ),
                          ),
                        ),
                        Step(
                          state: controller.index.value > 1
                              ? StepState.complete
                              : StepState.indexed,
                          title: const Text(''),
                          isActive: controller.index.value >= 1,
                          content: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Langkah 2 - Informasi Khusus',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Divider(),
                                SizedBox(height: 15),
                                Text(
                                  'Nama Lengkap',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextInput(
                                    hint: RegisterController.penduduk.isEmpty
                                        ? 'Nama lengkap otomatis terisi'
                                        : RegisterController.penduduk[0]
                                                ['namaLengkap']
                                            .toString()
                                            .toUpperCase(),
                                    isDisable: true),
                                SizedBox(height: 15),
                                Text(
                                  'Nama Panggilan  / Username',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Obx(() {
                                  return TextInput(
                                    onChanged:
                                        RegisterController.usernameValidation,
                                    errorText:
                                        RegisterController.usernameError.value,
                                    controller: RegisterController.username,
                                    hint: 'Username',
                                    isDisable: false,
                                    textInputAction: TextInputAction.next,
                                  );
                                }),
                                SizedBox(height: 15),
                                Text(
                                  'Nomor Telepon',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Obx(() {
                                  return TextInput(
                                    onChanged:
                                        RegisterController.phoneValidation,
                                    errorText:
                                        RegisterController.phoneError.value,
                                    controller: RegisterController.phone,
                                    hint: 'Nomor telepon',
                                    isDisable: false,
                                    type: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                  );
                                }),
                                SizedBox(height: 15),
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Obx(() {
                                  return TextInput(
                                    onChanged:
                                        RegisterController.emailValidation,
                                    errorText:
                                        RegisterController.emailError.value,
                                    controller: RegisterController.email,
                                    hint: 'Alamat email',
                                    isDisable: false,
                                    type: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                  );
                                }),
                                SizedBox(height: 15),
                                Text(
                                  'Kata Sandi (Minimal 6 karater)',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Obx(() {
                                  return PasswordInput(
                                    controller: RegisterController.password,
                                    onChanged:
                                        RegisterController.passwordValidation,
                                    errorText:
                                        RegisterController.passwordError.value,
                                    hint: 'Kata sandi',
                                    textInputAction: TextInputAction.next,
                                  );
                                }),
                                SizedBox(height: 15),
                                Text(
                                  'Ulangi Kata Sandi ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Obx(() {
                                  return PasswordInput(
                                    controller: RegisterController.cpassword,
                                    onChanged:
                                        RegisterController.cPasswordValidation,
                                    errorText:
                                        RegisterController.cPasswordError.value,
                                    hint: 'Ulangi kata sandi',
                                    textInputAction: TextInputAction.done,
                                  );
                                }),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                        Step(
                          state: controller.index.value > 2
                              ? StepState.complete
                              : StepState.indexed,
                          title: Text(''),
                          isActive: controller.index.value >= 2,
                          content: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Langkah 3 - Unggah Dokumen',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text.rich(
                                  TextSpan(
                                      text:
                                          'Guna memastikan bahwa akun ini adalah milik anda, silahkan lakukan pengunggahan dokumen ',
                                      children: [
                                        TextSpan(
                                          text: 'KTP ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(text: 'dan '),
                                        TextSpan(
                                          text: 'Swafoto dengan KTP',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                      style: TextStyle(fontSize: 16)),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: dPrimaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  margin: EdgeInsets.only(bottom: 20),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Petunjuk Unggah Dokumen',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(
                                            FontAwesomeIcons.questionCircle,
                                            size: 15,
                                            color: dPrimaryColor,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.check,
                                              size: 14,
                                              color: Colors.green,
                                            ),
                                            SizedBox(width: 7),
                                            Flexible(
                                              child: Text(
                                                'Foto e-KTP asli (bukan salinan / copy)',
                                                maxLines: 3,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.check,
                                              size: 14,
                                              color: Colors.green,
                                            ),
                                            SizedBox(width: 7),
                                            Flexible(
                                              child: Text(
                                                'Informasi pada e-KTP harus terlihat jelas dan tidak ada yang terpotong atau buram',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                                softWrap: true,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.check,
                                              size: 14,
                                              color: Colors.green,
                                            ),
                                            SizedBox(width: 7),
                                            Flexible(
                                              child: Text(
                                                'Tidak ada pantulan cahaya dan bayangan pada foto e-ktp',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                softWrap: true,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.check,
                                              size: 14,
                                              color: Colors.green,
                                            ),
                                            SizedBox(width: 7),
                                            Flexible(
                                              child: Text(
                                                'Foto memenuhi area dari frame (close up)',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                softWrap: true,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: AspectRatio(
                                        aspectRatio: 2 / 1.3,
                                        child: Container(
                                          margin: EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1, color: dPrimaryColor),
                                          ),
                                          child: Obx(() {
                                            return RegisterController
                                                        .ktpBasename.value !=
                                                    ''
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9),
                                                    child: Image.file(
                                                      File(RegisterController
                                                          .ktpBasename.value),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                : Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.image_outlined,
                                                        color: Colors.grey[300],
                                                        size: 50,
                                                      ),
                                                      SizedBox(height: 10),
                                                      Text(
                                                        'Foto KTP',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors
                                                                .grey[400]),
                                                      ),
                                                    ],
                                                  );
                                          }),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: AspectRatio(
                                        aspectRatio: 2 / 1.3,
                                        child: Container(
                                          margin: EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1, color: dPrimaryColor),
                                          ),
                                          child: Obx(() {
                                            return RegisterController
                                                        .selfieBasename.value !=
                                                    ''
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9),
                                                    child: Image.file(
                                                      File(RegisterController
                                                          .selfieBasename
                                                          .value),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                : Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.image_outlined,
                                                        color: Colors.grey[300],
                                                        size: 50,
                                                      ),
                                                      SizedBox(height: 10),
                                                      Text(
                                                        'Foto Selfie dengan KTP',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors
                                                                .grey[400]),
                                                      ),
                                                    ],
                                                  );
                                          }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                ButtonOutlineIcon(
                                  title: 'Unggah foto e-KTP anda',
                                  action: () {
                                    Get.bottomSheet(
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                // contentPadding: EdgeInsets.all(0),
                                                minLeadingWidth: 0.1,
                                                minVerticalPadding: 0.1,
                                                onTap: RegisterController
                                                    .pickImageKtpFromGallery,
                                                leading: Icon(
                                                  FontAwesomeIcons.photoVideo,
                                                  size: 15,
                                                ),
                                                title: Text(
                                                  'Pilih dari galeri',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                              ListTile(
                                                // contentPadding: EdgeInsets.all(0),
                                                minLeadingWidth: 0.1,
                                                minVerticalPadding: 0.1,
                                                onTap: RegisterController
                                                    .pickImageKtpFromCamera,
                                                leading: Icon(
                                                  FontAwesomeIcons.camera,
                                                  size: 15,
                                                ),
                                                title: Text(
                                                  'Ambil gambar',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          )),
                                      isDismissible: true,
                                      enableDrag: true,
                                    );
                                  },
                                ),
                                SizedBox(height: 20),
                                ButtonOutlineIcon(
                                  title: 'Unggah foto diri dan e-KTP',
                                  action: () {
                                    Get.bottomSheet(
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                // contentPadding: EdgeInsets.all(0),
                                                minLeadingWidth: 0.1,
                                                minVerticalPadding: 0.1,
                                                onTap: RegisterController
                                                    .pickImageSelfieFromGallery,
                                                leading: Icon(
                                                  FontAwesomeIcons.photoVideo,
                                                  size: 15,
                                                ),
                                                title: Text(
                                                  'Pilih dari galeri',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                              ListTile(
                                                // contentPadding: EdgeInsets.all(0),
                                                minLeadingWidth: 0.1,
                                                minVerticalPadding: 0.1,
                                                onTap: RegisterController
                                                    .pickImageSelfieFromCamera,
                                                leading: Icon(
                                                  FontAwesomeIcons.camera,
                                                  size: 15,
                                                ),
                                                title: Text(
                                                  'Ambil gambar',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          )),
                                      isDismissible: true,
                                      enableDrag: true,
                                    );
                                  },
                                ),
                                SizedBox(height: 35)
                              ],
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            );
          }
        }));
  }
}
