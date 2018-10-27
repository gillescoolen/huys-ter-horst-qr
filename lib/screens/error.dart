import 'package:flutter/material.dart';
import 'package:huys_ter_horst/screens/home.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 81.0),
              child: Center(
                child: Text(
                  'Er is iets misgegaan!',
                  style: TextStyle(fontSize: 20.0),
                ),
              )),
          RaisedButton(
            color: Colors.orange,
            child: Text(
              'Klik om terug te gaan.',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                  ModalRoute.withName(Navigator.defaultRouteName));
              /* Navigator.popUntil(
                  context, ModalRoute.withName(Navigator.defaultRouteName)); */
            },
          )
        ],
      ),
    );
  }
}
