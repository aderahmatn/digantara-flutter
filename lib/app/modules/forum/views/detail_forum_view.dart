import 'package:digantara/app/Widgets/TextInput.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DetailForumView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: dPrimaryColor,
          elevation: 0,
          title: Text('Forum Warga'),
          centerTitle: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
        ),
        body: Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: EdgeInsets.all(dDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300,
                    child: TextInput(
                      hint: 'Komentar anda..',
                      isDisable: false,
                    ),
                  ),
                  Container(
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                      color: dPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      FontAwesomeIcons.paperPlane,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(dDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // margin: EdgeInsets.all(8),
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                              image: AssetImage('assets/images/banner5.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Kesehatan',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: dPrimaryColor),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Penanganan COVID-19 Di Desa',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Ade Rahmat Nurdiyana',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      SizedBox(height: 15),
                      Text.rich(
                        TextSpan(
                          text:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                          style: TextStyle(
                              color: Colors.black, height: 1.5, fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.grey.withOpacity(0.1),
                  child: Padding(
                    padding: EdgeInsets.all(dDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Komentar (12) :',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ChatBubble(),
                        ChatBubble(),
                        ChatBubble(),
                        ChatBubble(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: dPrimaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Maman Sutrisna',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 5),
          Text(
            'Hayu kita adakan penyuluhan tentang bahaya covid, biar kita tau seberapa bahayanya.',
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: double.infinity,
            child: Text(
              '21/01/2022 - 07.42',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
