import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/model/nihonto.dart';
import 'package:nihonto_collection_manager/widget/nihonto_form.dart';

class BrowseCollection extends StatefulWidget {
  List<Nihonto> _collection;

  BrowseCollection(List<Nihonto> collection) {
    assert(collection != null);

    _collection = collection;
  }

  @override
  _BrowseCollectionState createState() => _BrowseCollectionState(_collection);
}

class _BrowseCollectionState extends State<BrowseCollection> {
  List<Nihonto> _collection;

  _BrowseCollectionState(List<Nihonto> collection) {
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
          body: NihontoForm(),
        );
      },
    );

    final data = await Navigator.of(context).push(route) as Nihonto;

    print("Nihonto added: ${data}");

    if (data != null) {
      setState(() {
        // Update the collection from setState() to refresh the UI
        _collection.add(data);
      });
    }
  }

  void _pushShow(Nihonto nihonto) async {
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

    final result = await Navigator.of(context).push(route) as Nihonto;

    if (result != null) {
      print("Nihonto updated: ${result}");

      setState(() {
        // Replace the nihonto in the collection
        final index = _collection.indexOf(nihonto);

        _collection.replaceRange(index, index+1, [ result ]);
      });
    }
  }
}