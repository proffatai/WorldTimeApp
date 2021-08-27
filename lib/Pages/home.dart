import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: SafeArea(
          child: TextButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, '/choose_location');
        },
        icon: Icon(
          Icons.edit_location,
          color: Colors.black,
        ),
        label: Text("Change location", style: TextStyle(color: Colors.red)),
      )),
    );
  }
}
