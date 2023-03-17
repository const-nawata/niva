import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Niva market',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MyHomePage(),
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);

        return MediaQuery(
          data: mediaQueryData.copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}

// HTC U12+ (Width is assumed as height due to Orientation)
const double iniWidth = 360.0;
const double iniHeight = 669.5;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MediaQueryData? _mediaData;
  double _scaleH = 0.0;
  double _scaleW = 0.0;
  double _headerScale = 0.53;

  @override
  Widget build(BuildContext context) {
    _mediaData = MediaQuery.of(context);
    _scaleH = _mediaData!.size.width / iniHeight;
    _scaleW = _mediaData!.size.height / iniWidth;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 245.0 * _scaleH * _headerScale,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/header.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.0 * _scaleW,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/barcode-13.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80.0 * _scaleW,
                    color: Color(0xFF6E110C),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
