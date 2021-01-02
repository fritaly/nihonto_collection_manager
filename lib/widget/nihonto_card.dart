import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/model/nihonto.dart';

enum Action { view, edit, delete }

/// Material card used for representing a Nihonto
class NihontoCard extends Card {

  NihontoCard(Nihonto nihonto, { VoidCallback onView, VoidCallback onEdit, VoidCallback onDelete }): super(child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      ListTile(
        // leading: Icon(Icons.album),
        title: Text("${nihonto.referenceNumber} ${nihonto.signature.romaji}", style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(nihonto.description),
          trailing: PopupMenuButton<Action>(
            onSelected: (Action result) {
              switch (result) {
                case Action.view:
                  onView.call();
                  break;
                case Action.edit:
                  onEdit.call();
                  break;
                case Action.delete:
                  onDelete.call();
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
      ),
    ],
  ), elevation: 8, margin: EdgeInsets.all(0));
}