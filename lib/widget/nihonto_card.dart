import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/model/nihonto.dart';
import 'package:nihonto_collection_manager/utils.dart';

enum Action { view, edit, delete }

/// Material card used for representing a Nihonto
class NihontoCard extends Card {

  NihontoCard(Nihonto nihonto, { VoidCallback onView, VoidCallback onEdit, VoidCallback onDelete }): super(child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      // Open the item in read-only mode if the user clicks on the image
      Expanded(child: FlatButton(child: CachedNetworkImage(
          imageUrl: nihonto.imageUri?.toString()
      ), onPressed: onView,)),
      Divider(),
      ListTile(
        // leading: Icon(Icons.album),
        title: Text("${nihonto.referenceNumber}", style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text("${nihonto.type.label} by ${nihonto.signature.romaji}"),
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