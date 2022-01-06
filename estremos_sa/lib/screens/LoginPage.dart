import 'package:estremos_sa/screens/HomeScreen.dart';
import 'package:estremos_sa/shared/LoginTextForm.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Size screenSize;
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          color: Color(0xFFFEDE00),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: screenSize.width * .8,
                  height: screenSize.height * .4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      LoginTextForm(
                        placeholder: 'Username',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LoginTextForm(
                        placeholder: 'Password',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Forgot your password?',
                        style: TextStyle(
                          fontFamily: 'Verdana',
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: (screenSize.width * .8) * .4,
                        height: (screenSize.height * .4) * .15,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFEDE00),
                            onPrimary: Color(0xFFFEDE00),
                            onSurface: Color(0xFFFEDE00),
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
