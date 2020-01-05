import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/weather.dart';
import 'package:weather_icons/weather_icons.dart';
import './components/todays_weather.dart';

WeatherStation weatherStation;
main() async {
  await DotEnv().load('.env');
  weatherStation = new WeatherStation(DotEnv().env['WEATHER_API_KEY']);
  runApp(MyApp());
}

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
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.teal, body: Column(children: <Widget>[TodaysWeather()],));
  }
}

class WeatherBody extends StatefulWidget {
  @override
  _WeatherBodyState createState() => _WeatherBodyState();
}
