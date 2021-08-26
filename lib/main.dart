import 'package:flutter/material.dart';
import 'package:world_clock_project/Pages/loading.dart';
import 'Pages/home.dart';
import 'package:world_clock_project/Pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute:
        '/home', // this is used to specify the first page. it will override '/' of the routes attribute
    // home: Home(),
    routes: {
      '/': (context) =>
          Loading(), // the '/' specifies that the loading page should be the default page
      '/home': (context) => Home(),
      '/choose_location': (context) => ChooseLocation()
    },
  ));
}
