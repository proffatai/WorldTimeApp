import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  //Testing async ()
  void getData() {
    Future.delayed(Duration(seconds: 3), () {
      print("Hello world");
    });
    print("I ran b4 the delayed ()!!!");
  }

// asynchronous getData: Now we have to wait till the delayed() completes
//before moving to the next line to print the print("I ran after the delayed ()!!!")
  void getData2() async {
    await Future.delayed(Duration(seconds: 3), () {
      print("Gimme food");
    });
    print("I ran after the delayed ()!!!");
  }

  @override
  void initState() // this () is called immediately the widget is created
  {
    super.initState();
    // all these 3 () will be called as arranged but those () that have
    //awaits will be waiting while others continue
    // But print() will be called first because others contain some delayed()
    getData(); // calling the getData()
    getData2();
    print(
        "init State is here"); // This will run first while others do their thing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text("Back to home"),
          centerTitle: true,
          backgroundColor: Colors.white10,
        ),
        body: Center(child: Text(" This is love")));
  }
}
