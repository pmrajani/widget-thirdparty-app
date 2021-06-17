# json_to_widget

A new Flutter application.

## Getting Started

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> data = {};
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Offers"),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
          future: readJson(),
          builder: (context, snapshot) {
            if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return JsonToWidget(jsonData: snapshot.data);
          },
        ));
  }

  Future<Map<String, dynamic>> readJson() async {
    final String response = await rootBundle.loadString('assets/offer_data.json');
    final data = await json.decode(response);
    return data;
  }
}
