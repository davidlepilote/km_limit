import 'dart:async';

import 'package:flutter/material.dart';
import 'package:km_limit/core/location.dart';
import 'package:location/location.dart';

import 'distance.dart';

class Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  DateTime _origin = DateTime.now();
  LocationData _originLocation;
  Duration _countDown = Duration(
    seconds: 0,
    milliseconds: 0,
  );
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Temps"),
        Text(
          format(
            _origin.add(Duration(hours: 1)).subtract(Duration(seconds: _countDown.inSeconds)).difference(_origin),
          ),
        ),
        Text("Distance"),
        _originLocation != null
            ? Distance(_originLocation)
            : StreamBuilder<LocationData>(
                stream: LocationProvider().locationDataStream(),
                builder: (context, AsyncSnapshot<LocationData> snapshot) {
                  if (snapshot.hasData) {
                    return Text("0 m");
                  } else {
                    return Text("Recherche de localisation ...");
                  }
                },
              ),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          onPressed: () => _countDown.inMilliseconds > 0 ? _stopTimer() : _startTimer(),
          color: Colors.blue,
          child: Text(
            _countDown.inMilliseconds > 0 ? "Stop" : "C'est parti",
          ),
        ),
      ],
    );
  }

  /// The hour is updated every half a second, so we make sure it is always on time.
  void _updateTime() {
    setState(() {
      _countDown = DateTime.now().difference(_origin);
      _timer = Timer(
        Duration(milliseconds: 500),
        _updateTime,
      );
    });
  }

  void _startTimer() async {
    setState(() {
      _origin = DateTime.now();
      _timer = Timer(
        Duration(milliseconds: 500),
        _updateTime,
      );
    });
    LocationProvider().locationData().then((LocationData value) {
      setState(() {
        _originLocation = value;
      });
    });
  }

  void _stopTimer() {
    setState(() {
      _originLocation = null;
      _timer.cancel();
      _countDown = Duration(seconds: 0);
    });
  }

  String format(Duration duration) {
    return "${duration.inHours}:${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(duration.inSeconds.remainder(60).toString().padLeft(2, '0'))}";
  }
}
