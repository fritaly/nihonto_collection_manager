import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Widget title;

  Section(Widget this.title) : assert(title != null);

  Section.text(String title)
      : this(Text(title, style: TextStyle(fontWeight: FontWeight.bold)));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: title,),
        Expanded(child: Divider(thickness: 2,))
      ]),
    );
  }
}
