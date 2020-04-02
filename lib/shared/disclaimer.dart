import 'package:CoroJogging/themes.dart';
import 'package:flutter/material.dart';

class Disclaimer extends StatelessWidget {
  Widget icon;
  String title;
  List<Widget> body;
  Function() onPressed;
  String okText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              this.icon,
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  this.title,
                  style: AppTheme.of(context).textStyles.header,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(children: this.body),
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                onPressed: this.onPressed,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        this.okText,
                        style: AppTheme.of(context).textStyles.button1.copyWith(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Disclaimer({this.icon, this.title, this.body, this.onPressed, this.okText});
}
