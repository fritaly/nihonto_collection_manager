import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final Widget title;

  Separator(Widget this.title) : assert(title != null);

  Separator.text(String title)
      : this(Text(title, style: TextStyle(fontWeight: FontWeight.bold)));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(children: [
        Expanded(child: Divider(thickness: 2,)),
        Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: title,),
        Expanded(child: Divider(thickness: 2,))
      ]),
    );
  }
}
