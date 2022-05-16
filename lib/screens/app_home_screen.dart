import 'package:appointment_app/screens/login.dart';
import 'package:appointment_app/screens/signup.dart';
import 'package:flutter/material.dart';

class AppHomeScreen extends StatelessWidget {
  const AppHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Container(height: MediaQuery.of(context).size.height * 0.1),
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/1.png'), fit: BoxFit.fitHeight)),
          child: Image.asset('images/screen-0.png'),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Row(
            children: <Widget>[
              Container(width: MediaQuery.of(context).size.width * 0.1),
              Container(
                height: 50,
                padding: EdgeInsets.only(right: 5),
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LogInScreen.routeName);
                  },
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              side: BorderSide(color: Colors.black))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                ),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.only(left: 5),
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SignUpScreen.routeName);
                  },
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              side: BorderSide(color: Colors.black))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black)),
                ),
              ),
              Container(width: MediaQuery.of(context).size.width * 0.1),
            ],
          ),
        ),
      ]),
    );
  }
}
