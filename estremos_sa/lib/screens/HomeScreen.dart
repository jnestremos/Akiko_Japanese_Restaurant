import 'dart:async';
import 'dart:convert';

import 'package:estremos_sa/shared/CustomListItem.dart';
import 'package:estremos_sa/shared/RightDrawer(Test).dart';
import 'package:estremos_sa/shared/RightDrawerLandscape.dart';
import 'package:estremos_sa/shared/RightDrawerPortrait.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _scrollSnapListKey = new GlobalKey<ScrollSnapListState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData().then((value) {
      Map data = jsonDecode(value.body);

      setState(() {
        meals = data['meals'];
      });
    });
  } // PANG SAVE DATA MEALS VARIABLE

  String url = 'https://www.themealdb.com/api/json/v1/1/filter.php?a=Japanese';
  Future<Response> getData() async {
    Response response = await get(url);
    return response;
  } // PANG FETCH API

  List<dynamic> meals;
  List<String> prices = [
    '199',
    '299',
    '89',
    '209',
    '249',
    '189',
    '239',
    '179',
    '139',
    '269',
    '189',
    '349',
    '399',
    '129',
    '219',
    '259',
    '289',
    '179',
    '149',
    '99',
    '109',
    '189',
    '69',
    '129',
    '259',
    '139',
    '349',
    '89'
  ];
  int _focusedIndex;
  var orient;
  List<String> mealNameArray;
  Widget _buildItemList(BuildContext context, int index) {
    return CustomListItem(
      id: meals[index]['idMeal'],
      thumbnail: meals[index]['strMealThumb'],
      mealName: meals[index]['strMeal'],
      price: prices[index],
      orientation: orient,
      focusedIndex: _focusedIndex,
      index: index,
      area: url.split('a=')[1],
    ); //PARA NI SA LANDSCAPE SCROLLSNAPLIST BUILDER
  }

  @override
  Widget build(BuildContext context) {
    if (meals != null) {
      // SINCE ASYNC ANG API FETCH, NULL ANG FIRST RUN. IF WALA NI, MAG ERROR MUGAWAS SI RED
      for (var i = 0; i < meals.length; i++) {
        mealNameArray = meals[i]['strMeal'].split(" ");
        if (mealNameArray.length >= 2) {
          for (var ii = 0; ii < mealNameArray.length; ii++) {
            if (mealNameArray[ii].split('')[0] ==
                mealNameArray[ii].split('')[0].toLowerCase()) {
              var nameArray = mealNameArray[ii].split('');
              var letter = nameArray[0].toUpperCase();
              nameArray.removeAt(0);
              nameArray.insert(0, letter);
              mealNameArray.removeAt(ii);
              mealNameArray.insert(ii, nameArray.join(''));
            }
          }
        }
        var mealName = mealNameArray.join(' ');
        meals[i]['strMeal'] = mealName;
      } // PANG CONVERT LANG SA MGA FIRST LETTER IN EACH WORD TO CAPS (KAY NAAY UBAN NAAY UBAN FOOD NAKA LOWERCASE NA OC KO HAHA)
    }
    Size screenSize;
    screenSize = MediaQuery.of(context).size;
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        //PANG LANDSCAPE LAYOUT
        if (_focusedIndex == null) {
          _focusedIndex = 0;
        }
        orient = orientation;
        return Scaffold(
          endDrawer: RightDrawerLandscape(),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              children: [
                FaIcon((FontAwesomeIcons.utensils)),
                Text(
                  "  Akiko " + url.split('a=')[1] + " Restaurant",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 19),
                ),
              ],
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
          body: Container(
            color: meals != null
                ? Color(0xFFFEDE00)
                : Colors
                    .white, //IF FETCHING PA SI API, WHITE SCREEN, OTHERWISE, PAKITA CONTENT
            child: meals == null //SAME CONCEPT NAKABALE LANG ANG CONDITION
                ? Center(
                    child: Container(
                      child: SpinKitFadingCube(color: Color(0xFFFEDE00)),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ScrollSnapList(
                          //CUSTOM WIDGET GALING PUB.DEV (SNAPPING EFFECT SA LIST PARA MA FOCUS UG TARONG ANG ITEM)
                          key:
                              _scrollSnapListKey, //PARA MAGAMIT LATER SA PAGE CLICK NA MGA CIRCLES
                          onItemFocus: (index) {
                            setState(() {
                              //MA SAVE ANG ITEM EVERY FOCUS
                              _focusedIndex = index;
                            });
                          },
                          itemBuilder:
                              _buildItemList, //BUILD LIST REFER LINE 78
                          itemSize: 219,
                          itemCount: meals.length,
                          scrollDirection: Axis.horizontal,
                          background: Colors.black,
                          dynamicItemSize: true,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: meals.length >= 12
                            ? screenSize.width * .25
                            : screenSize.width * .20,
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (var i = 0; i < meals.length; i++)
                              GestureDetector(
                                onTap: () {
                                  _scrollSnapListKey.currentState.focusToItem(
                                      i); //KAILANGAN ANG KEY GALING SA SCROLLSNAPLIST (LINE 173)
                                },
                                child: Container(
                                  width: 9,
                                  height: 9,
                                  decoration: BoxDecoration(
                                    color: _focusedIndex == i
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
          ),
        );
      } else {
        //PANG PORTRAIT LAYOUT
        _focusedIndex = 0;
        orient = orientation;
        return Scaffold(
            endDrawer: RightDrawerPortrait(),
            appBar: AppBar(
              elevation: 0,
              title: Row(
                children: [
                  FaIcon((FontAwesomeIcons.utensils)),
                  Text(
                    "  Akiko " + url.split('a=')[1] + " Restaurant",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 19),
                  ),
                ],
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
                          .openEndDrawer(); //PANG TOGGLE SA RIGHT DRAWER
                    },
                  ),
                ),
              ],
            ),
            key: _scaffoldKey,
            body: Stack(
              children: [
                Container(
                  color: meals != null
                      ? Color(0xFFFEDE00)
                      : Colors.white, // IF LOADING, WHITE BG, ELSE COLOR YELLOW
                  width: screenSize.width,
                  height: screenSize.height,
                  child: meals != null
                      ? Padding(
                          // MAG SHOW IF NAA
                          padding: const EdgeInsets.only(left: 7, top: 10),
                          child: SingleChildScrollView(
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 5,
                              direction: Axis.horizontal,
                              children: [
                                for (var i = 0; i < meals.length; i++)
                                  CustomListItem(
                                    id: meals[i]['idMeal'],
                                    thumbnail: meals[i]['strMealThumb'],
                                    mealName: meals[i]['strMeal'],
                                    price: prices[i],
                                  ),
                              ],
                            ),
                          ))
                      : SpinKitFadingCube(
                          // LOADING PAG NULL
                          color: Color(0xFFFEDE00),
                        ),
                )
              ],
            ));
      }
    });
  }
}
