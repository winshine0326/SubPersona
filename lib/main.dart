import 'package:flutter/cupertino.dart';
import 'package:subpersona/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'SubPersona',
      theme: CupertinoThemeData(
          primaryColor: CupertinoColors.activeBlue,
      ),
      home: HomePage(),
    );
  }
}