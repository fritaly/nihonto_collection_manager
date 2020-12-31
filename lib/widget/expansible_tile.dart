import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/widget/section.dart';

class ExpansibleTile extends ExpansionTile {

  ExpansibleTile({ @required String text, @required List<Widget> children, bool initiallyExpanded = false })
      : super(
            title: Section.text(text),
            initiallyExpanded: initiallyExpanded,
            tilePadding: EdgeInsets.all(8),
            childrenPadding: EdgeInsets.all(8),
            children: children);
}
