import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:json_to_widget/modal/offer_model.dart';
import 'package:json_to_widget/src/style_data.dart';

class CardedList extends StatelessWidget {
  final List<ListData> list;
  CardedList({this.list});
  @override
  Widget build(BuildContext context) {
    List<List<ListData>> data = splitList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Trending",style: StyleData.header),
        ),
        Container(
          height: 280,
          child: ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              List<ListData> temp = data[index];
              return Container(
                width: MediaQuery.of(context).size.width / 1.25,
                child: Card(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        itemCount: temp.length,
                        itemBuilder: (context, sub) {
                          return ListTile(
                              onTap: () {},
                              isThreeLine: true,
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 30,
                                backgroundImage:
                                    CachedNetworkImageProvider(temp[sub].logo),
                              ),
                              title: Text(temp[sub].title),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    temp[sub].subtitle,
                                  ),
                                  Text(
                                    temp[sub].offer,
                                    style: StyleData.subtitle
                                        .copyWith(color: Colors.green),
                                  ),
                                ],
                              ));
                        })),
              );
            },
          ),
        ),
      ],
    );
  }

  List<List<ListData>> splitList() {
    List<List<ListData>> chunks = [];
    for (var i = 0; i < list.length; i += 3) {
      chunks.add(list.sublist(i, i + 3 > list.length ? list.length : i + 3));
    }
    return chunks;
  }
}
