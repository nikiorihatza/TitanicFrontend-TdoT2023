import 'package:dsai_titanic/pages/ResultPage.dart';
import 'package:dsai_titanic/pages/TitanicDataFormPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterAppStart extends StatelessWidget {
  const FlutterAppStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      routes: {
        '/': (context) => TitanticDataFormPage(),
        '/result': (context) => ResultPage()
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
