import 'package:http/http.dart'; // used to get JSON data from a webpage
import 'dart:convert'; // it allows to convert JSON obj into Maps that we can work with

class WorldTime {
  String location;
  String time;
  String url;
  String flag;

  WorldTime(
      {required this.location,
      required this.time,
      required this.flag,
      required this.url});
//Getting JSON Data from a website
  Future<void> getData() async {
    //we used await as we want the content to be gotten first before the code progresses further
    //the content is stored into a Response datatype variable, it is used to store website contents/responses
    Response pagecontent = await get(Uri.parse(
        'http://worldtimeapi.org/api/timezone/$url')); //extracting the content of the webpage using the get() and storing it into a Response variable type.

    // the JSON body is converted into Map
    Map data = jsonDecode(pagecontent.body);
    String datetime = data["datetime"]; // string value is returned
    String offset = data[
        "utc_offset"]; // we need to add the offset to the time to obtain an accurate result
    // print(datetime);
    // print(offset);
    //removing the + and other redundat part of the offset, taking only the integer
    offset = offset.substring(1, 3); // this is a string
    //Let's convert the datetime into a DateTime obj so we can person manipulations on the values
    DateTime result = DateTime.parse(datetime);
    // print(
    // result); // we now have a datetime object, note the difference from the datetime variable in line 24
    // since we have a DateTime obj, we can apply the add() to the time to apply the offset value
    //convertung the string offset into an integer
    int hr = int.parse(offset);
    //adding the offset to the hour of the datetime
    result = result.add(Duration(hours: hr));
    // print(result); // the offset has been added to update the time
    // converting the time from int to str so we can put inside a Text widget on the screen
    time = result.toString();
  }
}
