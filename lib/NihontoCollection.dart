import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/Nihonto.dart';
import 'package:nihonto_collection_manager/NihontoForm.dart';

class NihontoCollection extends StatefulWidget {
  List<Nihonto> _collection;

  NihontoCollection(List<Nihonto> collection) {
    assert(collection != null);

    _collection = collection;
  }

  @override
  _NihontoCollectionState createState() => _NihontoCollectionState(_collection);
}

class _NihontoCollectionState extends State<NihontoCollection> {
  List<Nihonto> _collection;

  _NihontoCollectionState(List<Nihonto> collection) {
    assert(collection != null);

    _collection = collection;
  }

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
    assert(nihonto != null);

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
        body: _buildWidget(),
        floatingActionButton: FloatingActionButton(
            onPressed: _pushAdd,
            child: Icon(Icons.add),
            backgroundColor: Colors.green));
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
    assert(nihonto != null);

    var route = MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Nihonto information'),
              actions: [],
            ),
            body: NihontoForm(nihonto));
      },
    );

    Navigator.of(context).push(route);
  }
}
