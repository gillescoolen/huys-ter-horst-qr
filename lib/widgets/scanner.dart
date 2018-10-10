import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octoscan/screens/item.dart';

final String icon = 'lib/assets/icon.svg';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => new _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String code = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 150.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                icon,
                width: 150.0,
                height: 150.0,
              ),
              Text(
                'Welcome to Huys Castle',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),
              Text(
                code,
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scan,
        tooltip: 'Scan a QR code!',
        child: Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
      ),
    );
  }

  Future scan() async {
    try {
      String code = await BarcodeScanner.scan();
      setState(() => this.code = code);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ItemScreen()),
      );
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.code = 'No camera permission!';
        });
      } else {
        setState(() => this.code = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.code = 'null (User used the back button!)');
    } catch (e) {
      setState(() => this.code = 'Unknown error: $e');
    }
  }
}
