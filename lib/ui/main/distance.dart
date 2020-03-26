import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:km_limit/core/location.dart';
import 'package:location/location.dart';

class Distance extends StatefulWidget {
  final LocationData _origin;

  @override
  _DistanceState createState() => _DistanceState();

  Distance(this._origin);
}

class _DistanceState extends State<Distance> {
  LocationData _currentLocation;
  StreamSubscription<LocationData> _subscription;

  @override
  Widget build(BuildContext context) {
    return Text(_calculateDistance(widget._origin, _currentLocation));
  }

  @override
  void initState() {
    super.initState();
    _currentLocation = widget._origin;
    _subscription = LocationProvider().locationDataStream().listen((LocationData currentLocation) {
      setState(() {
        _currentLocation = currentLocation;
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
  }

  String _calculateDistance(LocationData origin, LocationData current){
    var lat1 = origin.latitude;
    var lat2 = current.latitude;
    var lon1 = origin.longitude;
    var lon2 = current.longitude;
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p))/2;
    return "${(12742000 * asin(sqrt(a))).ceil()} m ± ${current.accuracy.toInt()} m" ;
  }
}