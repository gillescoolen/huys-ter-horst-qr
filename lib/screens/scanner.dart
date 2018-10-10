import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        child: Text(
          code,
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 20.0,
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
