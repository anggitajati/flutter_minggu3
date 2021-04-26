import 'package:flutter/material.dart';
import 'input.dart';
import 'convert.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etCelcius = new TextEditingController();

  double nCelcius = 0;
  var item = ["Kelvin", "Reamur"];
  String _newValue = "Kelvin";
  double _result = 0;
  List<String> listViewItem = [];

  void _konversiSuhu() {
    setState(() {
      nCelcius = double.parse(etCelcius.text);
      if (_newValue == "Kelvin")
        _result = nCelcius + 273;
      else
        _result = (4 / 5) * nCelcius;
      addItemToList();
    });
  }

  void addItemToList() {
    setState(() {
      String value = _newValue + " : " + _result.toStringAsFixed(1);
      listViewItem.insert(0, value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Input(etCelcius: etCelcius),
              Result(result: _result),
              Convert(konvertHandler: _konversiSuhu),
            ],
          ),
        ),
      ),
    );
  }
}
