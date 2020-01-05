import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/weather.dart';
import 'package:weather_icons/weather_icons.dart';

class _TodaysWeatherState extends State<TodaysWeather> {
  var _temp = '';
  var _location = '';
  var weatherStation;

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
    return Expanded(
      // backgroundColor: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            _temp + '°',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 64),
          ),
          Text(
            _location,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Future<Weather> _getWeather() async {
    await DotEnv().load('.env');
    weatherStation = new WeatherStation(DotEnv().env['WEATHER_API_KEY']);

    Weather weather = await weatherStation.currentWeather();
    print(_temp);
    return weather;
  }
}

class TodaysWeather extends StatefulWidget {
  @override
  _TodaysWeatherState createState() => _TodaysWeatherState();
}
