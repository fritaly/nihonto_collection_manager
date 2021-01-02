import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/extensions.dart';
import 'package:nihonto_collection_manager/model/organization.dart';
import 'package:nihonto_collection_manager/model/origami.dart';
import 'package:nihonto_collection_manager/utils.dart';

class OrigamiWidget extends StatefulWidget {

  // Can be null
  Origami _origami;

  OrigamiWidget({Key key, Origami origami}) : super(key: key) {
    _origami = origami;
  }

  @override
  OrigamiWidgetState createState() => OrigamiWidgetState(_origami);
}

class OrigamiWidgetState extends State<OrigamiWidget> {

  Origami _origami;

  OrigamiWidgetState([ Origami origami ]) {
    if (origami != null) {
      _origami = origami;
    } else {
      _origami = Origami.DEFAULT;
    }
  }

  Origami get origami => _origami;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      DropdownButtonFormField(
          decoration: InputDecoration(labelText: 'Organization', border: OutlineInputBorder()),
          value: _origami.issuer,
          key: Key('Origami-Issuer-${_origami.issuer}'),
          items: Utils.getDropDownMenuItems(Organization.values),
          onChanged: (value) {
            setState(() {
              _origami = _origami.copyWith(issuer: value);
            });
          }),

      SizedBox(height: 8),

      TextFormField(
        decoration: InputDecoration(labelText: 'Type', border: OutlineInputBorder()),
        initialValue: "${_origami.type}",
        key: Key('Origami-Type-${_origami.type}'),
        onChanged: (value) {
          setState(() {
            _origami = _origami.copyWith(type: value);
          });
        },
      ),

      SizedBox(height: 8),

      TextFormField(
        decoration: InputDecoration(labelText: 'Type', border: OutlineInputBorder()),
        initialValue: "${_origami.type}",
        key: Key('Origami-Type-${_origami.type}'),
        onChanged: (value) {
          setState(() {
            _origami = _origami.copyWith(type: value);
          });
        },
      ),
    ]).pad();
  }
}
