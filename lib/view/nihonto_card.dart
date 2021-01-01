import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/model/nihonto.dart';

/// Material card used for representing a Nihonto
class NihontoCard extends Card {

  NihontoCard(Nihonto nihonto, { VoidCallback onView, VoidCallback onEdit, VoidCallback onDelete }): super(child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      ListTile(
        // leading: Icon(Icons.album),
        title: Text(nihonto.signature.romaji, style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(nihonto.description),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            child: const Text('VIEW'),
            onPressed: onView,
          ),
          TextButton(
            child: const Text('EDIT'),
            onPressed: onEdit,
          ),
          TextButton(
            child: const Text('DELETE'),
            onPressed: onDelete,
          ),
        ],
      ),
    ],
  ),);
}