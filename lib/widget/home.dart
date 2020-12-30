import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/model/nihonto.dart';
import 'package:nihonto_collection_manager/widget/browse_collection.dart';
import 'package:nihonto_collection_manager/widget/unit_converter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _collection = List<Nihonto>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nihonto Collection'),
        actions: [],
      ),
      body: Padding(
          padding: EdgeInsets.all(8),
          child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(8),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                Tile(text: 'Manage your\ncollection', onPressed: _pushBrowse),
                Tile(text: 'Length\nconverter'),
                Tile(text: 'Date\nconverter'),
                Tile(text: 'Manage your\nwish list')
              ])),
    );
  }

  void _pushBrowse() {
    var route = MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Browse collection'),
            actions: [],
          ),
          body: BrowseCollection(_collection),
        );
      },
    );

    Navigator.of(context).push(route);
  }

  void _pushConverter() {
    var route = MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Unit converter'),
            actions: [],
          ),
          body: UnitConverter(),
        );
      },
    );

    Navigator.of(context).push(route);
  }
}

class Tile extends ElevatedButton {
  Tile({String text, VoidCallback onPressed})
      : super(
            child: Text(text,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
            onPressed: onPressed);
}
