import 'dart:async';
import 'dart:math';

import 'package:CoroFooting/themes.dart';
import 'package:flutter/material.dart';
import 'package:CoroFooting/core/location.dart';
import 'package:location/location.dart';

class DistanceObject {
  final int distance;
  final int accuracy;

  DistanceObject(this.distance, this.accuracy);

  String description() {
    return "${distance} m (± ${accuracy} m)";
  }

  bool isTooFar() {
    return distance + accuracy > 1000;
  }
}

class Distance extends StatefulWidget {
  final LocationData _origin;

  @override
  _DistanceState createState() => _DistanceState();

  Distance(this._origin);
}

class _DistanceState extends State<Distance> {
  DistanceObject _distance;
  StreamSubscription<LocationData> _subscription;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: _distance.isTooFar() ? AppTheme.of(context).colors.red : AppTheme.of(context).colors.green,
        borderRadius: BorderRadius.all(
          Radius.circular(17.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Column(
          children: <Widget>[
            Text(
              "Distance",
              style: AppTheme.of(context).textStyles.text,
            ),
            widget._origin != null
                ? Text(_distance.description(), style: AppTheme.of(context).textStyles.text4)
                : StreamBuilder<LocationData>(
                    stream: LocationProvider().locationDataStream(),
                    builder: (context, AsyncSnapshot<LocationData> snapshot) {
                      var text;
                      if (snapshot.hasData) {
                        text = "0 m";
                      } else {
                        text = "...";
                      }
                      return Text(
                        text,
                        style: AppTheme.of(context).textStyles.text4,
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _distance = _calculateDistance(widget._origin, widget._origin);
    _subscription = LocationProvider().locationDataStream().listen((LocationData currentLocation) {
      setState(() {
        _distance = _calculateDistance(widget._origin, currentLocation);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  DistanceObject _calculateDistance(LocationData origin, LocationData current) {
    if (origin == null || current == null) {
      return DistanceObject(0, 0);
    }
    var lat1 = origin.latitude;
    var lat2 = current.latitude;
    var lon1 = origin.longitude;
    var lon2 = current.longitude;
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p) / 2 + cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return DistanceObject((12742000 * asin(sqrt(a))).ceil(), current.accuracy.toInt());
  }
}
