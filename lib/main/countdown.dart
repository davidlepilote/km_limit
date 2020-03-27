import 'dart:async';
import 'dart:math';

import 'package:CoroFooting/rules/rules.dart';
import 'package:CoroFooting/themes.dart';
import 'package:flutter/material.dart';
import 'package:CoroFooting/core/location.dart';
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
        SizedBox(height: 16,),
        Image.asset(
          "assets/ic_launcher.png",
          width: 50,
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          "#RestezÀLaMaison",
          style: AppTheme.of(context).textStyles.logo,
        ),
        SizedBox(
          height: 10,
        ),
        RaisedButton(
          onPressed: () => Navigator.of(context).pushNamed(Rules.routeName),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Voir les règles",
              style: AppTheme.of(context).textStyles.button1,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          elevation: 10,
        ),
        SizedBox(
          height: 40,
        ),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 280,
              height: 280,
            ),
            _points(),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.of(context).colors.grey2, width: 2),
              ),
            ),
            Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                      offset: Offset(
                        2.0, // Move to right 10  horizontally
                        2.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                )),
            Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.of(context).colors.grey2.withAlpha(110), width: 6),
              ),
            ),
            CustomPaint(
              size: Size(184, 184),
              painter: ArcPainter(context, _progress()),
            ),
            FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => _countDown.inMilliseconds > 0 ? _stopTimer() : _startTimer(),
              child: Text(
                _originLocation != null ? "Stop" : "Go",
                style: AppTheme.of(context).textStyles.headline,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Distance(_originLocation),
        _time(),
        SizedBox(height: 16,)
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

  double _progress() {
    return (Duration(hours: 1).inSeconds - _origin.add(Duration(hours: 1)).subtract(Duration(seconds: _countDown.inSeconds)).difference(_origin).inSeconds) /
        Duration(hours: 1).inSeconds;
  }

  Widget _points() {
    var children = <Widget>[];
    for (int i = 0; i < 24; i++) {
      children.add(Transform.rotate(
        angle: pi * 2 / 24 * i,
        child: Transform.translate(
          offset: Offset(0, 140),
          child: Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.of(context).colors.grey2,
            ),
          ),
        ),
      ));
    }
    return Stack(
      children: children,
    );
  }

  Widget _time() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 28,
        ),
        Text(
          "Temps restant",
          style: AppTheme.of(context).textStyles.text2,
        ),
        Text(
          format(
            _origin.add(Duration(hours: 1)).subtract(Duration(seconds: _countDown.inSeconds)).difference(_origin),
          ),
          style: AppTheme.of(context).textStyles.text3,
        )
      ],
    );
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
    return "${duration.inHours} : ${duration.inMinutes.remainder(60).toString().padLeft(2, '0')} : ${(duration.inSeconds.remainder(60).toString().padLeft(2, '0'))}";
  }
}

class ArcPainter extends CustomPainter {
  Paint arcPaint = Paint();
  BuildContext context;
  double progress;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawArc(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2), -pi / 2, progress * 2 * pi, false, arcPaint);
  }

  ArcPainter(this.context, this.progress) {
    arcPaint.color = AppTheme.of(context).colors.primaryColor;
    arcPaint.style = PaintingStyle.stroke;
    arcPaint.strokeWidth = 6;
    arcPaint.strokeCap = StrokeCap.round;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
