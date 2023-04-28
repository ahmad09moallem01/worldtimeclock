import 'package:flutter/material.dart';
import 'package:testerrr/pages/home.dart';
import 'package:testerrr/pages/choose_location.dart';
import 'package:testerrr/pages/loading.dart';
  void main() {
  runApp( MaterialApp(

    initialRoute: '/loading',
    routes: {
      '/loading': (context) => Loading(),
      '/choose_location': (context) => ChooseLocation(),
      '/home': (context) => Home(),


    }

    ));
    }






