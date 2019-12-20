import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_icons/weather_icons.dart';

const API_KEY = '172beb1494bf8e201cdff9f86381793d';
WeatherStation weatherStation = new WeatherStation(API_KEY);
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        body: WeatherBody(),
      ),
    );
  }
}

class _WeatherBodyState extends State<WeatherBody> {
  var _temp = '';
  var _location = '';

  @override
  void initState() {
    _getWeather().then((result) => {
          setState(() {
            _temp = result.temperature.fahrenheit.truncate().toString();
            _location = result.areaName;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              _temp + '°',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 64),
            ),
          ),
          Center(
            child: Text(
              _location,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Future<Weather> _getWeather() async {
    Weather weather = await weatherStation.currentWeather();
    print(_temp);
    return weather;
  }
}

class WeatherBody extends StatefulWidget {
  @override
  _WeatherBodyState createState() => _WeatherBodyState();
}
