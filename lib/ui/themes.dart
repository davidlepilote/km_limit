import 'package:flutter/material.dart';

class _Colors {
  Color get black => Color(0xff060606);
  Color get primaryColor => Color(0xff01b1b4);
  Color get secondaryColor => Color(0xffffeceb);
  Color get grey => Color(0xff686868);
  Color get grey2 => Color(0xff23293d);
  Color get grey3 => Color(0xfff2f2f2);
  Color get grey4 => Color(0xff333333);
  Color get lightGrey => Color(0xffababab);
  Color get veryLightGrey => Color(0xffefeff4);
  Color get white => Color(0xffffffff);
  Color get gray => Color(0x1e8e8e93);
  Color get gray2 => Color(0xff8e8e93);
}

class _Values {
  BorderRadius get defaultBorderRadius => BorderRadius.circular(5.0);
}

class _TextStyles {

  final _Colors colors;

  _TextStyles(this.colors);

  TextStyle get title => TextStyle(
    color: colors.black,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.2,
  );

  TextStyle get title2 => TextStyle(
    color: colors.grey4,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    letterSpacing: 5.6,
  );


  TextStyle get button => TextStyle(
    color: colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.88,
  );


  TextStyle get button1 => TextStyle(
    color: colors.primaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.88,
  );

  TextStyle get subhead => TextStyle(
    color: colors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.2,
  );

  TextStyle get headline => TextStyle(
    color: colors.primaryColor,
    fontSize: 36,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.2,
  );

  TextStyle get body1 => TextStyle(
    color: colors.grey,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.2,
  );

  TextStyle get body2 => TextStyle(
    color: colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  TextStyle get body3 => TextStyle(
      color: colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5
  );

  TextStyle get body4 => TextStyle(
      color: colors.grey2,
      backgroundColor: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.88
  );

  TextStyle get body5 => TextStyle(
    color: colors.black,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.4,
  );

  TextStyle get body6 => TextStyle(
      color: colors.grey2,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      height: 2,
      letterSpacing: 0.88
  );

  TextStyle get caption => TextStyle(
    color: colors.lightGrey,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.2,
  );

  TextStyle get subtitle => TextStyle(
    color: colors.grey,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.2,
  );

  TextStyle get subtitle2 => TextStyle(
    color: colors.grey4,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.88,
    height: 1.8,
  );
}

// ignore: must_be_immutable
class AppTheme extends InheritedWidget {

  final _Colors colors = _Colors();

  final _Values values = _Values();

  _TextStyles textStyles;

  AppTheme({
    @required Widget child,
  }) : super(child: child) {
    textStyles = _TextStyles(colors);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static AppTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

}