import 'package:flutter/material.dart';
import 'package:json_to_widget/modal/offer_model.dart';
import 'package:json_to_widget/src/carded_list.dart';
import 'category_list.dart';
import 'square_container.dart';
import 'square_banner.dart';
import 'rectangle_banner.dart';
import 'square_card.dart';

class JsonToWidget extends StatefulWidget {
  final Map<String, dynamic> jsonData;
  JsonToWidget({this.jsonData});
  @override
  _JsonToWidgetState createState() => _JsonToWidgetState();
}

class _JsonToWidgetState extends State<JsonToWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OfferModel>(
      future: JsonToModel(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RectangleBanner(rectAngleBanner: snapshot.data.topBanner),
                CardedList(list: snapshot.data.list),
                RectangleBanner(rectAngleBanner: snapshot.data.middleBanner),
                SquareCard(cardData: snapshot.data.newRelease),
                SquareBanner(cardData: snapshot.data.bestOffer),
                SquareContainer(cardData: snapshot.data.discover),
                CategoryList(category: snapshot.data.category)
              ],
            ),
          ),
        );
      },
    );
  }

  Future<OfferModel> JsonToModel() async {
    return OfferModel.fromJson(widget.jsonData);
  }
}
