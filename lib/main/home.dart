import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

import 'countdown.dart';

class Home extends StatelessWidget {
  static const String routeName = "/Home";
  BannerAd myBanner;


  Home() {
    myBanner = BannerAd(
        adUnitId: 'ca-app-pub-9237574227734784/6706072361',
        size: AdSize.largeBanner,
        listener: (MobileAdEvent event) {
          print("BannerAd event is $event");
        });
    myBanner
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Center(
              child: Countdown(),
            ),
          ),
        ),)
      ,
    );
  }
}
