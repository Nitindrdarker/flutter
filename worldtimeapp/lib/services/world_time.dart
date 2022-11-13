import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location = ''; //location name for the ui
  String time = ''; //time of location
  String flag = ''; //url to an asset
  String url = ''; //this is the location url
  bool isDaytime = true;
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      //make the request
      Response response = await get(
          Uri.parse("https://www.worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      // print(data);
      //get properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'].toString().substring(1, 3);
      // print(datetime);
      // print(offset);
      //create Datetime object
      DateTime now = DateTime.parse(datetime);
      // print(now);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = 'no time';
    }
  }
}
