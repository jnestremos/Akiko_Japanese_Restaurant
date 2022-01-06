import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RightDrawerPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize;
    screenSize = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Image(
              image: AssetImage(
                'assets/right_drawer_pic.jpg',
              ),
              height: 150,
              width: 150,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFFEDE00),
            ),
            width: (screenSize.width * .7) * .9,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Joshua Estremos",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                FaIcon(
                  FontAwesomeIcons.pencilAlt,
                  size: 18,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFEDE00),
                ),
                width: (screenSize.width * .7) * .9,
                height: 75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: Text(
                        'Email',
                        style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'estremosjoshua@gmail.com',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                top: 13,
                child: FaIcon(
                  FontAwesomeIcons.pencilAlt,
                  size: 18,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFEDE00),
                ),
                width: (screenSize.width * .7) * .9,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: Text(
                        'Address',
                        style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'S.I.R. Matina, Davao City',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                top: 13,
                child: FaIcon(
                  FontAwesomeIcons.pencilAlt,
                  size: 18,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFFEDE00),
            ),
            width: (screenSize.width * .7) * .9,
            height: 110,
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Mobile Number',
                    style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                  ),
                  Text('+639452041874',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins")),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blueGrey[50],
                    ),
                    width: ((screenSize.width * .7) * .9) * .33,
                    height: 25,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        FaIcon(FontAwesomeIcons.check,
                            size: 15, color: Colors.green),
                        Text(
                          ' Verified',
                          style: TextStyle(
                              fontFamily: 'Poppins', color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 150,
          )
        ],
      ),
    );
  }
}
