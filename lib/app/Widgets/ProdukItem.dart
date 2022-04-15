import 'package:digantara/app/modules/produk_saya/views/detail_produk_saya_view.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class produkItem extends StatelessWidget {
  const produkItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        elevation: 1,
        margin: EdgeInsets.all(0),
        child: InkWell(
          onTap: () {
            Get.to(DetailProdukSayaView());
          },
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: dDefaultPadding, vertical: 7),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/banner5.png'),
                        fit: BoxFit.cover),
                  ),
                  height: 90,
                  width: 100,
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HP SAMSUNG S17 - RAM 80Gb ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: dPrimaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Rp4500.000',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '2 Hari yang lalu',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
