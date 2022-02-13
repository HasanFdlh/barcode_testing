import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// import 'package:crud_flutter/myhomepage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: MyHomePage(),
      home: ScanCode(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScanCode extends StatefulWidget {
  const ScanCode({Key? key}) : super(key: key);

  @override
  _ScanCodeState createState() => _ScanCodeState();
}

class _ScanCodeState extends State<ScanCode> {
  String _scanResult = '';
  Future<void> scanQr() async {
    try {
      final _scanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      if (!mounted) return;
      setState(() {
        this._scanResult = _scanResult;
      });
    } on PlatformException {
      _scanResult = "Tidak Tampil";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('qrScan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Scan Result : $_scanResult',
            ),
            ElevatedButton(
              onPressed: () {
                scanQr();
              },
              child: Text("Scan"),
            )
          ],
        ),
      ),
    );
  }
}
