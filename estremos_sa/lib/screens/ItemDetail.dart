import 'dart:convert';

import 'package:estremos_sa/shared/ItemDetailTypeOfInfo.dart';
import 'package:estremos_sa/shared/ItemTags.dart';
import 'package:estremos_sa/shared/RightDrawer(Test).dart';
import 'package:estremos_sa/shared/RightDrawerLandscape.dart';
import 'package:estremos_sa/shared/RightDrawerPortrait.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

class ItemDetail extends StatefulWidget {
  final String id;
  final String name;
  final Orientation orientation;

  const ItemDetail({Key key, this.id, this.name, this.orientation})
      : super(key: key);
  @override
  _ItemDetailState createState() =>
      _ItemDetailState(this.id, this.name, this.orientation);
}

class _ItemDetailState extends State<ItemDetail> {
  final String id;
  final String name;
  final Orientation orientation;
  _ItemDetailState(this.id, this.name, this.orientation);

  void initState() {
    // TODO: implement initState
    super.initState();
    getData().then((value) {
      Map data = jsonDecode(value.body);

      setState(() {
        meal = data['meals'];
      });
    }); //SAVE DATA TO MEAL
  }

  Future<Response> getData() async {
    String url =
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=' + this.id;
    Response response = await get(url);
    return response; //FETCH API
  }

  List<dynamic> meal;
  var orient;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var ingredMeasure = [];
    String measure;
    String ingredient;

    Size screenSize;
    screenSize = MediaQuery.of(context).size;
    if (meal != null) {
      for (var i = 1; i <= 20; i++) {
        if (meal[0]['strIngredient' + i.toString()] != '' &&
            meal[0]['strMeasure' + i.toString()] != '') {
          ingredient = meal[0]['strIngredient' + i.toString()];
          measure = meal[0]['strMeasure' + i.toString()];
          ingredMeasure.add(measure + ' of ' + ingredient);
        } else {
          break;
        } //PROPER FORMAT SA INGREDIENTS
      }
      return OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          orient = orientation; //PORTRAIT LAYOUT
          return Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            endDrawer: RightDrawerPortrait(),
            appBar: AppBar(
              toolbarHeight: 70,
              backgroundColor: Color(0xFFFEDE00),
              title: Text(
                " " + this.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 25),
              ),
              actions: [
                Container(
                  width: screenSize.width * .15,
                  child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.userCircle,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState
                          .openEndDrawer(); // PANG TOGGLE SA RIGHT DRAWER
                    },
                  ),
                ),
              ],
            ),
            key: _scaffoldKey,
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.white,
                      width: screenSize.width,
                      height: screenSize.height * .4,
                      child: Center(
                        child: Image(
                          image: NetworkImage(this.meal[0]['strMealThumb']),
                          height: 250,
                          width: 250,
                        ),
                      ),
                    ),
                    Container(
                      width: screenSize.width,
                      padding: EdgeInsets.only(
                          left: 40, right: 40, top: 40, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        color: Colors.black,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ItemDetailTypeOfInfo(
                                placeholder: "Drink Alternate:",
                                orientation: orient,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                this.meal[0]['strDrinkAlternate'] == null
                                    ? 'None'
                                    : this.meal[0]['strDrinkAlternate'],
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'Bahnschrift'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ItemDetailTypeOfInfo(
                                placeholder: "Food Category:",
                                orientation: orient,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                this.meal[0]['strCategory'],
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'Bahnschrift'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ItemDetailTypeOfInfo(
                                placeholder: "Instructions:",
                                orientation: orient,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            this.meal[0]['strInstructions'],
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: 'Bahnschrift'),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (this.meal[0]['strTags'] != null)
                            Row(
                              children: [
                                Text(
                                  'Tags: ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                for (var i = 0;
                                    i <
                                        this
                                            .meal[0]['strTags']
                                            .split(',')
                                            .length;
                                    i++)
                                  ItemTags(
                                      orientation: orient,
                                      tag: this
                                          .meal[0]['strTags']
                                          .split(',')[i]),
                              ],
                            ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  //EXPANDED PARA MAG NEW LINE SIYA SA BABA IF MAG SOBRA ANG SENTENCES
                                  child: RichText(
                                //RICHTEXT INSTEAD OF DALAWANG TEXT WIDGET PARA 1 ELEMENT LANG ANG LAMAN
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                    text: 'Ingredients:  ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'Bahnschrift'),
                                    children: [
                                      TextSpan(
                                          text: ingredMeasure.join(', '),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontFamily: 'Bahnschrift'))
                                    ]),
                              ))
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          // LAYOUT FOR LANDSCAPE ITEM DETAIL
          orient = orientation;
          return Scaffold(
              resizeToAvoidBottomInset: false,
              resizeToAvoidBottomPadding: false,
              endDrawer: RightDrawerLandscape(),
              appBar: AppBar(
                backgroundColor: Color(0xFFFEDE00),
                title: Text(
                  " " + this.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 25),
                ),
                actions: [
                  Container(
                    width: screenSize.width * .15,
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.userCircle,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState.openEndDrawer();
                      },
                    ),
                  ),
                ],
              ),
              key: _scaffoldKey,
              body: Row(
                children: [
                  Container(
                    color: Colors.white,
                    height: screenSize.height,
                    width: screenSize.width * .45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: NetworkImage(this.meal[0]['strMealThumb']),
                          height: 200,
                          width: 200,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: 'Area: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: "Bahnschrift"),
                                    children: [
                                      TextSpan(
                                          text: this.meal[0]['strArea'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.grey))
                                    ]))
                          ],
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      color: Colors.black,
                      width: screenSize.width * .55,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ItemDetailTypeOfInfo(
                                placeholder: "Drink Alternate:",
                                orientation: orient,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                this.meal[0]['strDrinkAlternate'] == null
                                    ? 'None'
                                    : this.meal[0]['strDrinkAlternate'],
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'Bahnschrift'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ItemDetailTypeOfInfo(
                                placeholder: "Food Category:",
                                orientation: orient,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                this.meal[0]['strCategory'],
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'Bahnschrift'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ItemDetailTypeOfInfo(
                                placeholder: "Instructions:",
                                orientation: orient,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            this.meal[0]['strInstructions'],
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: 'Bahnschrift'),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (this.meal[0]['strTags'] != null)
                            Row(
                              children: [
                                Text(
                                  'Tags: ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                for (var i = 0;
                                    i <
                                        this
                                            .meal[0]['strTags']
                                            .split(',')
                                            .length;
                                    i++)
                                  ItemTags(
                                      orientation: orient,
                                      tag: this
                                          .meal[0]['strTags']
                                          .split(',')[i]),
                              ],
                            ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                    text: 'Ingredients:  ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'Bahnschrift'),
                                    children: [
                                      TextSpan(
                                          text: ingredMeasure.join(', '),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontFamily: 'Bahnschrift'))
                                    ]),
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        }
      });
    } else {
      return Container(
        color: Colors.white,
        child: Center(
          child: SpinKitFadingCube(
            color: Color(0xFFFEDE00),
          ),
        ),
      );
    }
  }
}
