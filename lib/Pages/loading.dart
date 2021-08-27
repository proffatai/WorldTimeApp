import 'package:flutter/material.dart';
import 'package:http/http.dart'; // used to get JSON data from a webpage
import 'dart:convert'; // it allows to convert JSON obj into Maps that we can work with

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //Getting JSON Data from a website
  void getData() async {
    //we used await as we want the content to be gotten first before the code progresses further
    //the content is stored into a Response datatype variable, it is used to store website contents/responses
    Response pagecontent = await get(Uri.parse(
        'https://jsonplaceholder.typicode.com/todos/1')); //extracting the content of the webpage using the get() and storing it into a Response variable type.
    // this is the JSON content, the body of the webpage
    print(pagecontent.body);
    // the JSON body is converted into Map
    Map data = jsonDecode(pagecontent.body);
    print(data.keys); // the Map version of the body
  }

  @override
  void initState() // this () is called immediately the widget is created
  {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[200],
        body: SafeArea(child: Center(child: Text("Loading, please wait"))));
  }
}
