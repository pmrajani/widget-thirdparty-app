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
          height: MediaQuery.of(context).size.width / 2.5,
          child: ListView.builder(
            itemCount: cardData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width / 3,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: RaisedButton(
                  onPressed: () {},
                  elevation: 0.5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
