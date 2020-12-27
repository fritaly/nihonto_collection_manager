import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/Nihonto.dart';
import 'package:nihonto_collection_manager/NihontoForm.dart';

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

// ========================== //
// === Nihonto collection === //
// ========================== //

class NihontoCollection extends StatefulWidget {
  @override
  _NihontoCollectionState createState() => _NihontoCollectionState();
}

class _NihontoCollectionState extends State<NihontoCollection> {
  final _collection = List<Nihonto>();

  Widget _buildWidget() {
    // Generate a ListView listing the swords in the collection
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return Divider();
          }

          // Compute the index of the entry in the collection (0, 0, 1, 1, 2, 2...)
          var index = i ~/ 2;

          if (index >= _collection.length) {
            return null;
          }

          print("Collection = ${_collection}");

          return _buildRow(_collection[index]);
        });
  }

  Widget _buildRow(Nihonto nihonto) {
    assert (nihonto != null);

    return ListTile(
      title: Text(
        nihonto.signature,
      ),
      onTap: () {
        // Display the nihonto form
        _pushShow(nihonto);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nihonto Collection'),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: _pushAdd),
        ],
      ),
      body: _buildWidget(),
    );
  }

  void _pushAdd() async {
    var route = MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Add a new nihonto'),
              actions: [],
            ),
            body: NihontoForm(null), // TODO Use a no-arg constructor
          );
        },
      );

    final data = await Navigator.of(context).push(route) as Nihonto;

    print("Data = ${data}");

    if (data != null) {
      // Add the entry to the collection
      _collection.add(data);
    }
  }

  void _pushShow(Nihonto nihonto) {
    assert (nihonto != null);

    var route = MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Nihonto information'),
            actions: [],
          ),
          body: NihontoForm(nihonto),
        );
      },
    );

    Navigator.of(context).push(route);
  }
}