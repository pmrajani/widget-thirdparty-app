import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:json_to_widget/modal/offer_model.dart';
import 'package:json_to_widget/src/style_data.dart';

class SquareCard extends StatelessWidget {
  final List<DetailCard> cardData;
  SquareCard({this.cardData});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("New Release",style: StyleData.header),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            itemCount: cardData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Card(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 105,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            CachedNetworkImageProvider(cardData[index].logo),
                      ),
                      SizedBox(height: 3),
                      Text(cardData[index].title,
                          style: StyleData.titleSmall, textAlign: TextAlign.center),
                      SizedBox(height: 3),
                      Text(cardData[index].subtitle,
                          style: StyleData.subtitleSmall,
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
