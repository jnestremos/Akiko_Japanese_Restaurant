import 'package:flutter/material.dart';

class ItemDetailTypeOfInfo extends StatelessWidget {
  @override
  final String placeholder;
  final Orientation orientation;

  const ItemDetailTypeOfInfo({Key key, this.placeholder, this.orientation})
      : super(key: key);
  Widget build(BuildContext context) {
    Size screenSize;
    screenSize = MediaQuery.of(context).size;
    if (orientation == Orientation.portrait) {
      return Container(
        width: screenSize.width * .35,
        height: screenSize.height * .05,
        decoration: BoxDecoration(
          color: Color(0xFFFEDE00),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            this.placeholder,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                fontFamily: 'Bahnschrift'),
          ),
        ),
      );
    } else {
      return Container(
        width: screenSize.width * .20,
        height: screenSize.height * .1,
        decoration: BoxDecoration(
          color: Color(0xFFFEDE00),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            this.placeholder,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                fontFamily: 'Bahnschrift'),
          ),
        ),
      );
    }
  }
}
