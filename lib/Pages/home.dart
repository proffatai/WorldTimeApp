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
    return Scaffold(
        backgroundColor: Colors.orange[100],
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.fromLTRB(40, 15, 10, 0),
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
                    SizedBox(height: 100.0),
                    Text(data['loc'],
                        style: TextStyle(fontSize: 30, color: Colors.black)),
                    SizedBox(height: 45.0),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage(data['flg']),
                            radius: 50),
                        SizedBox(width: 20.1),
                        Text(data['time'],
                            style:
                                TextStyle(fontSize: 30, color: Colors.black)),
                      ],
                    ),
                  ]),
                ))));
  }
}
