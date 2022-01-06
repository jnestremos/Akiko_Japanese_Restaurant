import 'package:flutter/material.dart';

class ItemTags extends StatelessWidget {
  @override
  final String tag;
  final Orientation orientation;
  const ItemTags({Key key, this.tag, this.orientation}) : super(key: key);
  Widget build(BuildContext context) {
    Size screenSize;
    screenSize = MediaQuery.of(context).size;
    if (orientation == Orientation.portrait) {
      return Container(
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.all(9),
        height: screenSize.height * .05,
        decoration: BoxDecoration(
          color: Color(0xFFFEDE00),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          this.tag,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: 'Bahnschrift'),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.all(8),
        height: screenSize.height * .08,
        decoration: BoxDecoration(
          color: Color(0xFFFEDE00),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          this.tag,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: 'Bahnschrift'),
        ),
      );
    }
  }
}
