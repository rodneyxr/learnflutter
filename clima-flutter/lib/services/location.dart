import 'dart:async';

import 'package:geolocator/geolocator.dart';

class Location {
  Position? _position;

  Future<void> updateLocation() async {
    try {
      _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<Location> current() async {
    Location location = Location();
    await location.updateLocation();
    return location;
  }

  Position? getLocation() {
    return _position;
  }

  double getLatitude() {
    return _position!.latitude;
  }

  double getLongitude() {
    return _position!.longitude;
  }

  @override
  String toString() {
    return _position.toString();
  }
}
