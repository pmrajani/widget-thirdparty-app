class OfferModel {
  OfferModel(
      {this.topBanner,
      this.middleBanner,
      this.newRelease,
      this.bestOffer,
      this.discover,
      this.category,
      this.list});
  List<RectAngleBanner> topBanner = [];
  List<RectAngleBanner> middleBanner = [];
  List<DetailCard> newRelease = [];
  List<RectAngleBanner> bestOffer = [];
  List<DetailCard> discover = [];
  List<Category> category = [];
  List<ListData> list = [];
  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        topBanner: json["top_banner"] == null
            ? []
            : List<RectAngleBanner>.from(
                json["top_banner"].map((x) => RectAngleBanner.fromJson(x))),
        middleBanner: json["middle_banner"] == null
            ? []
            : List<RectAngleBanner>.from(
                json["middle_banner"].map((x) => RectAngleBanner.fromJson(x))),
        list: json["trending"] == null
            ? []
            : List<ListData>.from(
                json["trending"].map((x) => ListData.fromJson(x))),
        newRelease: json["new_release"] == null
            ? []
            : List<DetailCard>.from(
                json["new_release"].map((x) => DetailCard.fromJson(x))),
        bestOffer: json["best_offers"] == null
            ? []
            : List<RectAngleBanner>.from(
                json["best_offers"].map((x) => RectAngleBanner.fromJson(x))),
        discover: json["discover"] == null
            ? []
            : List<DetailCard>.from(
                json["discover"].map((x) => DetailCard.fromJson(x))),
        category: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
      );
}

class ListData {
  ListData({this.logo, this.title, this.subtitle, this.offer});
  String title;
  String subtitle;
  String logo;
  String offer;
  factory ListData.fromJson(Map<String, dynamic> json) => ListData(
      title: json["title"],
      subtitle: json["subtitle"],
      logo: json["image"],
      offer: json['offer']);
}

class RectAngleBanner {
  RectAngleBanner({this.image});
  String image;
  factory RectAngleBanner.fromJson(Map<String, dynamic> json) =>
      RectAngleBanner(image: json["image"]);
}

class DetailCard {
  DetailCard({this.logo, this.title, this.subtitle});
  String title;
  String subtitle;
  String logo;

  factory DetailCard.fromJson(Map<String, dynamic> json) => DetailCard(
      title: json["title"], subtitle: json["subtitle"], logo: json["image"]);
}

class Category {
  Category({this.title, this.image, this.color});
  String title;
  String image;
  String color;
  factory Category.fromJson(Map<String, dynamic> json) => Category(
      title: json["title"],
      color: json["color"].replaceAll('#', '0xff'),
      image: json["image"]);
}
