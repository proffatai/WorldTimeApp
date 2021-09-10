import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;

    Color bgColor =
        data['dayOrnig'] == "assets/day.png" ? Colors.blue : Colors.indigo;
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/day.png"),
                        fit: BoxFit.cover)),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 120, 0, 0),
                    child: Center(
                      child: Column(children: <Widget>[
                        TextButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, '/choose_location');
                          },
                          icon: Icon(
                            Icons.edit_location,
                            color: Colors.black,
                          ),
                          label: Text("Change location",
                              style: TextStyle(color: Colors.red)),
                        ),
                        SizedBox(height: 20.0),
                        Text(data['loc'],
                            style:
                                TextStyle(fontSize: 40, color: Colors.black)),
                        SizedBox(height: 45.0),
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                                backgroundImage: AssetImage(data['flg']),
                                radius: 50),
                            SizedBox(width: 15.1),
                            Text(data['time'],
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black)),
                          ],
                        ),
                      ]),
                    )))));
  }
}
