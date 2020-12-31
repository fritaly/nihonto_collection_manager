import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/widget/section.dart';

class ExpansibleTile extends ExpansionTile {

  ExpansibleTile({ @required String text, @required List<Widget> children })
      : super(
            title: Section.text(text),
            initiallyExpanded: true,
            tilePadding: EdgeInsets.all(8),
            childrenPadding: EdgeInsets.all(8),
            children: children);
}
