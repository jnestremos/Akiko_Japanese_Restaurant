import 'package:estremos_sa/screens/ItemDetail.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  @override
  final String thumbnail;
  final String area;
  final String mealName;
  final String price;
  final String id;
  final int focusedIndex;
  final int index;
  final Orientation orientation;
  const CustomListItem(
      {Key key,
      this.thumbnail,
      this.area,
      this.mealName,
      this.price,
      this.id,
      this.orientation,
      this.focusedIndex,
      this.index})
      : super(key: key);

  Widget build(BuildContext context) {
    Size screenSize;
    screenSize = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(bottom: 7),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        height: this.orientation == Orientation.landscape
            ? screenSize.height * .20
            : screenSize.height * .32,
        width: this.orientation == Orientation.landscape
            ? screenSize.width * .32
            : screenSize.width * .47,
        child: Padding(
            padding: EdgeInsets.only(top: 15, left: 10, right: 10),
            child: orientation == Orientation.landscape
                ? Column(
                    children: [
                      focusedIndex == index
                          ? Column(children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ItemDetail(
                                        id: this.id,
                                        name: mealName,
                                        orientation: this.orientation,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      this.mealName,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Bahnschrift',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      this.area,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontFamily: 'Bahnschrift',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Image(
                                      image: NetworkImage(this.thumbnail),
                                      height: 130,
                                      width: 130,
                                      alignment: Alignment.center,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Php ' + this.price,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Bahnschrift',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 29,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Buy',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          onPrimary: Color(0xFFFEDE00),
                                          primary: Color(0xFFFEDE00),
                                          onSurface: Color(0xFFFEDE00)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 80,
                                    height: 29,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Cart',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          onPrimary: Colors.black,
                                          primary: Colors.black,
                                          onSurface: Colors.black),
                                    ),
                                  )
                                ],
                              )
                            ])
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  this.mealName,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Bahnschrift',
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  this.area,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontFamily: 'Bahnschrift',
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Image(
                                  image: NetworkImage(this.thumbnail),
                                  height: 130,
                                  width: 130,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Php ' + this.price,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Bahnschrift',
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 29,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Buy',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            onPrimary: Color(0xFFFEDE00),
                                            primary: Color(0xFFFEDE00),
                                            onSurface: Color(0xFFFEDE00)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 29,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Cart',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            onPrimary: Colors.black,
                                            primary: Colors.black,
                                            onSurface: Colors.black),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                    ],
                  )
                : Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemDetail(
                                id: this.id,
                                name: mealName,
                                orientation: this.orientation,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image(
                                image: NetworkImage(this.thumbnail),
                                height: 115,
                                width: 115,
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              this.mealName,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Bahnschrift',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('Php ' + this.price,
                                style: TextStyle(
                                    fontSize: 13.5, fontFamily: 'Bahnschrift')),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 29,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Buy',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  onPrimary: Color(0xFFFEDE00),
                                  primary: Color(0xFFFEDE00),
                                  onSurface: Color(0xFFFEDE00)),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 80,
                            height: 29,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Cart',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  onPrimary: Colors.black,
                                  primary: Colors.black,
                                  onSurface: Colors.black),
                            ),
                          )
                        ],
                      )
                    ],
                  )));
  }
}
