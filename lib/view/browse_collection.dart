import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/model/nihonto.dart';
import 'package:nihonto_collection_manager/view/nihonto_form.dart';
import 'package:nihonto_collection_manager/widget/nihonto_card.dart';

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

  static const Duration TWO_SECONDS = Duration(seconds: 2);

  List<Nihonto> _collection;

  _BrowseCollectionState(List<Nihonto> collection) {
    assert(collection != null);

    _collection = collection;
  }

  Widget _buildWidget() {
    if (false) {
      // Generate a ListView listing the swords in the collection
      return ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemBuilder: (context, i) {
            if (i.isOdd) {
              return SizedBox(height: 8);
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

    return GridView.count(padding: EdgeInsets.all(8),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      crossAxisCount: 1,
      children: _collection.map((e) => _buildRow(e)).toList()
    );
  }

  void _showDeleteDialog(Nihonto nihonto) {
    assert (nihonto != null);

    final AlertDialog dialog = AlertDialog(
      title: Text('Delete the entry ?'),
      content:
      Text("You're about to delete an entry from your collection."),
      actions: [
        FlatButton(
          textColor: Color(0xFF6200EE),
          onPressed: () => { Navigator.pop(context) },
          child: Text('CANCEL'),
        ),
        FlatButton(
          textColor: Color(0xFF6200EE),
          onPressed: () { Navigator.pop(context); _delete(nihonto); },
          child: Text('ACCEPT'),
        ),
      ],
    );

    showDialog<void>(context: context, builder: (context) => dialog);
  }

  void _delete(Nihonto nihonto) {
    assert (nihonto != null);

    setState(() {
      _collection.remove(nihonto);
    });

    // Display the message for 2 seconds to let the end user revert the deletion if necessary
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Entry deleted', textAlign: TextAlign.center), duration: TWO_SECONDS));
  }

  Widget _buildRow(Nihonto nihonto) {
    assert(nihonto != null);

    return NihontoCard(
      nihonto,
      onView: () { _pushView(nihonto); },
      onEdit: () { _pushEdit(nihonto); },
      onDelete: () { _showDeleteDialog(nihonto); },
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
        return NihontoForm(Mode.WRITE, Nihonto.DEFAULT);
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