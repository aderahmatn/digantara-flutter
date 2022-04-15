import 'package:digantara/app/Widgets/ButtonOutlineIcon.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sos_controller.dart';

class SosView extends GetView<SosController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/brand.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        color: dPrimaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(size.height * 0.35 / 2),
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: Center(
                    child: Material(
                      borderRadius:
                          BorderRadius.circular(size.height * 0.35 / 2),
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        splashColor: Colors.red[100],
                        borderRadius:
                            BorderRadius.circular(size.height * 0.35 / 2),
                        child: Container(
                          width: size.height * 0.35,
                          height: size.height * 0.35,
                          child: Center(
                            child: Text(
                              'SOS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 75,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(0),
                  width: size.height * 0.32,
                  height: size.height * 0.32,
                  decoration: BoxDecoration(
                    color: dPrimaryColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(size.height * 0.35 / 2),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Klik pada tulisan SOS untuk mendapatkan bantuan dari seluruh warga desa',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: ButtonOutlineIcon(title: 'Bantu Warga', action: () {}),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
