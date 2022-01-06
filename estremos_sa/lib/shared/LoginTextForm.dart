import 'package:flutter/material.dart';

class LoginTextForm extends StatelessWidget {
  final String placeholder;

  const LoginTextForm({Key key, this.placeholder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize;
    screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 10),
      width: (screenSize.width * .8) * .7,
      height: (screenSize.height * .4) * .15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 5, bottom: 10),
          labelText: this.placeholder,
          isCollapsed: false,
          labelStyle: TextStyle(fontFamily: 'Verdana'),
        ),
      ),
    );
  }
}
