import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/model/nihonto.dart';
import 'package:nihonto_collection_manager/view/nihonto_form.dart';

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

  static const Duration ONE_SECOND = Duration(seconds: 1);

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

  void _delete(Nihonto nihonto) {
    assert (nihonto != null);

    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Not implemented yet !', textAlign: TextAlign.center), duration: ONE_SECOND));
  }

  Widget _buildRow(Nihonto nihonto) {
    assert(nihonto != null);

    return ListTile(
      title: Text(
        nihonto.signature.romaji,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: PopupMenuButton<Action>(
        onSelected: (Action result) {
          switch (result) {
            case Action.view:
              _pushView(nihonto);
              break;
            case Action.edit:
              _pushEdit(nihonto);
              break;
            case Action.delete:
              _delete(nihonto);
              break;
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Action>>[
          const PopupMenuItem<Action>(
            value: Action.view,
            child: const Text('View'),
          ),
          const PopupMenuItem<Action>(
            value: Action.edit,
            child: const Text('Edit'),
          ),
          const PopupMenuItem<Action>(
            value: Action.delete,
            child: const Text('Delete'),
          ),
        ],
      ),
      subtitle: Text("${nihonto.description}"),
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
    var route = MaterialPageRoute<Nihonto>(
      builder: (BuildContext context) {
        return NihontoForm(Mode.WRITE);
      },
    );

    final data = await Navigator.of(context).push(route);

    print("Nihonto added: ${data}");

    if (data != null) {
      setState(() {
        // Update the collection from setState() to refresh the UI
        _collection.add(data);

        final snackBar = SnackBar(content: Text('Saved changes', textAlign: TextAlign.center), duration: ONE_SECOND);

        Scaffold.of(context).showSnackBar(snackBar);
      });
    }
  }

  void _pushEdit(Nihonto nihonto) async {
    assert(nihonto != null);

    var route = MaterialPageRoute<Nihonto>(
      builder: (BuildContext context) {
        return NihontoForm(Mode.WRITE, nihonto);
      }
    );

    final result = await Navigator.of(context).push(route);

    if (result != null) {
      print("Nihonto updated: ${result}");

      setState(() {
        // Replace the nihonto in the collection
        final index = _collection.indexOf(nihonto);

        _collection.replaceRange(index, index+1, [ result ]);

        final snackBar = SnackBar(content: Text('Saved changes', textAlign: TextAlign.center), duration: ONE_SECOND);

        Scaffold.of(context).showSnackBar(snackBar);
      });
    }
  }

  void _pushView(Nihonto nihonto) async {
    assert(nihonto != null);

    var route = MaterialPageRoute<Nihonto>(
        builder: (BuildContext context) {
          return NihontoForm(Mode.READ, nihonto);
        }
    );

    await Navigator.of(context).push(route);
  }
}

enum Action { view, edit, delete }