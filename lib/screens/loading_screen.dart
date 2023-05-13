// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/location.dart';

// const apiKey = 'f9047957ef3a4c768d7171947231005';
double? latitude;
double? longitude;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(
      location.latitude,
    );
    print(
      location.longitude,
    );
  }

  void getData() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=de974e862b0018217ce8e65a1c9aafb1'),
    );
    print(response.body);
    print(response.statusCode);

    // if (response.statusCode == 200) {
    //   String data = response.body;

    //   var decoding = jsonDecode(data);

    //   String locationName = decoding['name'];
    //   int condition = decoding['weather']['id'];
    //   double temperature = decoding['main']['temp'];
    //   print(locationName);
    //   print(condition);
    //   print(temperature);
    // } else {
    //   print(response.statusCode);
    // }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return const Scaffold();
  }
}
