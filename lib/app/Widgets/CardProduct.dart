import 'package:digantara/app/modules/shop/views/detail_shop_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(DetailShopView());
      },
      child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // margin: EdgeInsets.all(8),
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/images/banner5.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Rexus mouse wirelles xierra 20 armagedon',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Rp530.000',
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                      Text(
                        'MAJALENGKA',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )),
            ],
          )),
    );
  }
}
