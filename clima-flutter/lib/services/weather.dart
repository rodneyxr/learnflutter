import 'dart:convert';

import 'location.dart';
import 'package:http/http.dart' as http;

const String APIKEY = String.fromEnvironment('APIKEY');

class Weather {
  static Future<dynamic> getWeatherDataForCurrentLocation() async {
    return await Weather.getWeatherData(location: await Location.current());
  }

  static Future<dynamic> getWeatherData(
      {Location? location, String? query}) async {
    try {
      http.Response response = await http.get(
        Uri.https(
          'api.openweathermap.org',
          '/data/2.5/weather',
          {
            if (location != null) 'lat': location.getLatitude().toString(),
            if (location != null) 'lon': location.getLongitude().toString(),
            if (query != null) 'q': query,
            'appid': APIKEY,
            'units': 'imperial',
            'mode': 'json',
          },
        ),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
