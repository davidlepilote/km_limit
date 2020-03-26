import 'package:location/location.dart';

class LocationProvider {
  static final LocationProvider _singleton = LocationProvider._internal();

  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  factory LocationProvider() {
    return _singleton;
  }

  LocationProvider._internal();

  Future<bool> requestService() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }
    return true;
  }

  Future<bool> requestPermission() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.GRANTED) {
        return false;
      }
    }
    return true;
  }

  Future<LocationData> locationData() async {
    if(_permissionGranted == PermissionStatus.GRANTED && _serviceEnabled) {
      return location.getLocation();
    } else {
      return null;
    }
  }

  Stream<LocationData> locationDataStream() {
    if(_permissionGranted == PermissionStatus.GRANTED && _serviceEnabled) {
      return location.onLocationChanged();
    } else {
      return null;
    }
  }
}
