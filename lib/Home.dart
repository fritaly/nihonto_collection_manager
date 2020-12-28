import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/Nihonto.dart';
import 'package:nihonto_collection_manager/BrowseCollection.dart';

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
      body: Column(
        children: [
          ElevatedButton(onPressed: _pushBrowse, child: Text('Browse collection'))
        ]
      ),
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
}