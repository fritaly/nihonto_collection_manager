// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
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
      home: RandomWords(),
    );
  }
}

// ==================== //
// === Random words === //
// ==================== //

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nihonto Collection Manager'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
          IconButton(icon: Icon(Icons.add), onPressed: _pushAdd),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );

          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
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
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Tachi"),
                  value: 2,
                ),
                DropdownMenuItem(child: Text("Wakizashi"), value: 3),
                DropdownMenuItem(child: Text("Tanto"), value: 4),
                DropdownMenuItem(child: Text("Naginata"), value: 5),
                DropdownMenuItem(
                  child: Text("Unknown"),
                  value: 0,
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
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Shobu zukuri"),
                  value: 2,
                ),
                DropdownMenuItem(child: Text("Hira zukuri"), value: 3),
                DropdownMenuItem(
                  child: Text("Unknown"),
                  value: 0,
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
