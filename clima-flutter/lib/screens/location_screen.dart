import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  final dynamic data;

  LocationScreen(this.data);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double? temperature;
  double? condition;
  String? customMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.data);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData != null) {
        temperature = weatherData['main']['temp'];
        condition = weatherData['weather'][0]['id'];
        String cityName = weatherData['name'];
        customMessage =
            Weather.getMessage(temperature!.toInt()) + " in $cityName!";
      } else {
        temperature = 0;
        condition = 0;
        customMessage = 'Unable to get weather data';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      updateUI(
                          await Weather.getWeatherDataForCurrentLocation());
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var cityText = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => CityScreen(),
                        ),
                      );
                      if (cityText != null) {
                        updateUI(
                          await Weather.getWeatherData(
                            query: cityText,
                          ),
                        );
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temperature!.toInt()}°F ',
                      style: kTempTextStyle,
                    ),
                    Text(
                      Weather.getWeatherIcon(condition!.toInt()),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  customMessage!,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
