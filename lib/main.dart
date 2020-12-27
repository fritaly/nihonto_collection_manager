import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/NihontoCollection.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nihonto Collection Manager',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: NihontoCollection(),
    );
  }
}