import 'package:flutter/material.dart';
import 'package:spotify/home_page.dart';
import 'package:spotify/pdata.dart';

void main() {
  runApp(Spotify());
}

class Spotify extends StatelessWidget {
  Spotify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify',
      theme: ThemeData(
        primarySwatch: PData.blackColor,
      ),
      home: HomePage(),
    );
  }
}
