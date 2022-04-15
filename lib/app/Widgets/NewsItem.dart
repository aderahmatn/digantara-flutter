import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../utils/StringExtention.dart';

class NewsItem extends StatelessWidget {
  final String title;
  final String category;
  final String views;
  final String like;
  final String date;
  final String image;
  final String idNews;
  final void Function() action;

  NewsItem(
      {required this.title,
      required this.category,
      required this.views,
      required this.date,
      required this.image,
      required this.like,
      required this.idNews,
      required this.action});

  @override
  Widget build(BuildContext context) {
    print(timeago.format(DateTime.parse(date)));
    return InkWell(
      onTap: action,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: dDefaultPadding, vertical: 7),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage('${imageNewsUrl}${image}'),
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
                    category.capitalize(),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                  ),
                  SizedBox(height: 5),
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          size: 15,
                          color: dPrimaryColor,
                        ),
                      ),
                      Text(
                        views,
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        color: Colors.amber,
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          size: 15,
                          color: dPrimaryColor,
                        ),
                      ),
                      Text(
                        like,
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  Text(
                    timeago.format(DateTime.parse(date)).toString(),
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
