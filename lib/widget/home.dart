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
        actions: [
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(onPressed: _pushBrowse, child: Text('Browse collection')),
            ElevatedButton(onPressed: _pushConverter, child: Text('Unit converter')),
            ElevatedButton(onPressed: null, child: Text('Date converter')),
            ElevatedButton(onPressed: null, child: Text('Wish list')),
          ]
      ),),
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