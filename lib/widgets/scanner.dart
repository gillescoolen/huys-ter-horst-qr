import 'package:qr_mobile_vision/qr_mobile_vision.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:flutter/material.dart';

class Scanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: QrCamera(
          formats: List<BarcodeFormats>.filled(1, BarcodeFormats.QR_CODE),
          qrCodeCallback: (code) {
            print(code);
            if (code != "") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(code: code),
                ),
              );
            }
          },
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2.0)),
                ),
                Text(
                  'Scan a code!',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String code;

  SecondScreen({Key key, @required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Text(code),
    );
  }
}
