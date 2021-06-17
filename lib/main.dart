import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'json_to_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Offerscreen(),
    );
  }
}

class Offerscreen extends StatefulWidget {
  @override
  _OfferscreenState createState() => _OfferscreenState();
}

class _OfferscreenState extends State<Offerscreen> {
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Offers"),),
        body: FutureBuilder<Map<String, dynamic>>(
          future: readJson(), builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return JsonToWidget(jsonData: snapshot.data);
        },));
  }

  Future<Map<String, dynamic>> readJson() async {
    final String response = await rootBundle.loadString(
        'assets/offer_data.json');
    final data = await json.decode(response);
    return data;
  }
}

