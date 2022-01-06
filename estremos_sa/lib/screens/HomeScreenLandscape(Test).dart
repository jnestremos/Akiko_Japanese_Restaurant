import 'dart:convert';

import 'package:estremos_sa/shared/CustomListItem.dart';
import 'package:estremos_sa/shared/RightDrawer(Test).dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomeScreenLandscape extends StatefulWidget {
  @override
  _HomeScreenLandscapeState createState() => _HomeScreenLandscapeState();
}

class _HomeScreenLandscapeState extends State<HomeScreenLandscape> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  void initState() {
    // TODO: implement initState
    super.initState();
    getData().then((value) {
      Map data = jsonDecode(value.body);

      setState(() {
        meals = data['meals'];
      });
    });
  }

  Future<Response> getData() async {
    String url =
        'https://www.themealdb.com/api/json/v1/1/filter.php?a=Japanese';
    Response response = await get(url);
    return response;
  }

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
    if (index == meals.length) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return CustomListItem(
      id: meals[index]['idMeal'],
      thumbnail: meals[index]['strMealThumb'],
      mealName: meals[index]['strMeal'],
      price: prices[index],
      orientation: orient,
    );
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
            //g, r, c, p
          }
        }
        var mealName = mealNameArray.join(' ');
        meals[i]['strMeal'] = mealName;
      }
    }

    Size screenSize;
    screenSize = MediaQuery.of(context).size;

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        orient = orientation;
        return Scaffold(
          endDrawer: RightDrawer(),
          appBar: AppBar(
            elevation: 0,
            title: Row(
              children: [
                FaIcon((FontAwesomeIcons.utensils)),
                Text(
                  "  Akiko Japanese Restaurant",
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
            color: Colors.yellow[700],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ScrollSnapList(
                    onItemFocus: (index) {
                      setState(() {
                        _focusedIndex = index;
                        print(_focusedIndex);
                      });
                    },
                    itemBuilder: _buildItemList,
                    itemSize: 220,
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
                  width: screenSize.width * .15,
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var i = 0; i < meals.length; i++)
                        Container(
                          width: 9,
                          height: 9,
                          decoration: BoxDecoration(
                            color: _focusedIndex == i
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
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
        return Container(
          color: Colors.black,
        );
      }
    });
  }
}
