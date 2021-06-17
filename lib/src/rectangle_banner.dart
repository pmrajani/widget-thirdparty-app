import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:json_to_widget/modal/offer_model.dart';

class RectangleBanner extends StatelessWidget {
  final List<RectAngleBanner> rectAngleBanner;
  RectangleBanner({@required this.rectAngleBanner});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 3,
      child: Swiper.children(
        autoplay: true,
        pagination: SwiperPagination(builder: DotSwiperPaginationBuilder(
          size: 6
        )),
        children: rectAngleBanner.map(
          (data) => rectangleCard(image: data.image),
        ).toList(),
      ),
    );
  }

  Widget rectangleCard({String image}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.fill,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CupertinoActivityIndicator(),
      ),
    );
  }
}
