import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/model/nihonto.dart';

enum _Action { view, edit, delete }

/// Material card used for representing a Nihonto
class NihontoCard extends Card {
  NihontoCard(Nihonto nihonto,
      {VoidCallback onView, VoidCallback onEdit, VoidCallback onDelete})
      : super(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Open the item in read-only mode if the user clicks on the image
                Expanded(
                    child: FlatButton(
                        child: CachedNetworkImage(
                            imageUrl: nihonto.imageUri?.toString()),
                        onPressed: onView,
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8))),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                  height: 1,
                ),
                ListTile(
                  title: Text(
                    "${nihonto.referenceNumber}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      "${nihonto.type.label} by ${nihonto.signature.romaji}"),
                  trailing: PopupMenuButton<_Action>(
                    onSelected: (_Action result) {
                      switch (result) {
                        case _Action.view:
                          onView.call();
                          break;
                        case _Action.edit:
                          onEdit.call();
                          break;
                        case _Action.delete:
                          onDelete.call();
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<_Action>>[
                      const PopupMenuItem<_Action>(
                        value: _Action.view,
                        child: const Text('View'),
                      ),
                      const PopupMenuItem<_Action>(
                        value: _Action.edit,
                        child: const Text('Edit'),
                      ),
                      const PopupMenuItem<_Action>(
                        value: _Action.delete,
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            elevation: 8,
            margin: EdgeInsets.all(0));
}
