import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/Nihonto.dart';

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

          var index = i ~/ 2;

          if (index >= _collection.length) {
            return null;
          }

          return _buildRow(_collection[index]);
        });
  }

  Widget _buildRow(Nihonto nihonto) {
    return ListTile(
      title: Text(
        nihonto.signature,
      ),
      onTap: () {
        // TODO Display the nihonto form
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

  void _pushAdd() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Add a new nihonto'),
              actions: [],
            ),
            body: NihontoForm(),
          );
        },
      ),
    );
  }
}

// ==================== //
// === Nihonto form === //
// ==================== //

class NihontoForm extends StatefulWidget {
  @override
  NihontoFormState createState() => NihontoFormState();
}

class NihontoFormState extends State<NihontoForm> {
  // Create a global key that uniquely identifies the Form widget and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<NihontoFormState>.
  final _formKey = GlobalKey<FormState>();

  String _type;

  String _geometry;

  String _signature;

  Nihonto getAsObject() {
    Nihonto(_type, _geometry, _signature);
  }

  void setFrom(Nihonto source) {
    _type = source.type;
    _geometry = source.geometry;
    _signature = source.signature;
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Select the type'),
              value: _type,
              items: [
                DropdownMenuItem(
                  child: Text("Katana"),
                  value: "KATANA",
                ),
                DropdownMenuItem(
                  child: Text("Tachi"),
                  value: "TACHI",
                ),
                DropdownMenuItem(child: Text("Wakizashi"), value: "WAKIZASHI"),
                DropdownMenuItem(child: Text("Tanto"), value: "TANTO"),
                DropdownMenuItem(child: Text("Naginata"), value: "NAGINATA"),
                DropdownMenuItem(
                  child: Text("Unknown"),
                  value: "UNKNOWN",
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _type = value;
                });
              }),
          DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Select the geometry'),
              value: _geometry,
              items: [
                DropdownMenuItem(
                  child: Text("Shinogi zukuri"),
                  value: "SHINOGI_ZUKURI",
                ),
                DropdownMenuItem(
                  child: Text("Shobu zukuri"),
                  value: "SHOBU_ZUKURI",
                ),
                DropdownMenuItem(child: Text("Hira zukuri"), value: "HIRA_ZUKURI"),
                DropdownMenuItem(
                  child: Text("Unknown"),
                  value: "UNKNOWN",
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _geometry = value;
                });
              }),
          TextFormField(
            decoration: InputDecoration(labelText: 'Signature'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter the signature';
              }

              return null;
            },
            onChanged: (value) {
              setState(() {
                _signature = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState.reset();
                },
                child: Text('Reset'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.

                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('Save'),
              )
            ],
          )
        ]));
  }
}
