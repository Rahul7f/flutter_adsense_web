
import 'package:flutter/material.dart';
import 'package:flutter_adsense_web/flutter_adsense.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Adsense web Example"),),
        body: Center(
          child: AdsenseBanner(
            adModel: AdModel(
              slotId: '/6355419/Travel/Europe/France/Paris',
              width: 300,
              height: 250,
              divId: 'example-ad',
            ),
          ),
        ),
      ),
    );
  }
}