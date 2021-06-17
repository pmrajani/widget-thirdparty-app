import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:json_to_widget/modal/offer_model.dart';
import 'package:json_to_widget/src/style_data.dart';

class CategoryList extends StatelessWidget {
  final List<Category> category;
  CategoryList({this.category});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Category", style: StyleData.header),
        ),
        for (int i = 0; i < category.length; i++)
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Color(int.parse(category[i].color)),
            child: Container(
              height: 100,
              width: double.infinity,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Text(category[i].title,
                        style: StyleData.header.copyWith(color: Colors.white)),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CachedNetworkImage(imageUrl: category[i].image),
                      )),
                  Positioned(
                    right: -8,
                    top: 5,
                    bottom: 5,
                    child: Icon(Icons.chevron_right,
                        size: 50, color: Colors.white),
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}
