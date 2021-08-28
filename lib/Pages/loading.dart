import 'package:flutter/material.dart';
import 'package:world_clock_project/worldTimeClass.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //at fitst, Loading would appear then after the getData() completes, setState()
  //will be rebuilt and the new time will appear on the Text Widget
  String theTime = "Loading....";

  void setupTime() async {
    WorldTime
        data1 = // take note: the time :theTime will be overritten when getData() executes
        WorldTime(
            location: 'England',
            time: theTime,
            flag: 'assets.png',
            url: "Europe/London");
    //We want our program to get the and fill the time ppty before progressing
    //forward and that is why we made it to be an await data
    await data1.getData(); // filling the url and also filling the time ppry
    setState(() {
      theTime = data1.time;
    });
  }

  @override
  void initState() // this () is called immediately the widget is created
  {
    super.initState();
    setupTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[200],
        body: SafeArea(child: Center(child: Text("$theTime"))));
  }
}
