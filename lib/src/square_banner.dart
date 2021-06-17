import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:json_to_widget/modal/offer_model.dart';
import 'package:json_to_widget/src/style_data.dart';

class SquareBanner extends StatelessWidget {
  final List<RectAngleBanner> cardData;
  SquareBanner({this.cardData});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Best Offers", style: StyleData.header),
        ),
        Container(
          height: MediaQuery.of(context).size.width / 1.3,
          child: ListView.builder(
            itemCount: cardData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width / 1.3,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: RaisedButton(
                    onPressed: () {},
                    elevation: 2,
                    color: Colors.white,
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      height: MediaQuery.of(context).size.width / 1.3,
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: CachedNetworkImage(
                        imageUrl: cardData[index].image,
                        fit: BoxFit.fill,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                      ),
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
