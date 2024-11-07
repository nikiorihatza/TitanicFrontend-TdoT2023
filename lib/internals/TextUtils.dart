import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextUtils {
  static var _commonFont = 'SF Pro Display';
  static var _white = Color(0xffffffff);
  static var _black = Colors.black;

  static TextStyle navBarTxtStyle = TextStyle(fontFamily: _commonFont, fontSize: 20, color: _black, decoration: TextDecoration.none);

  static TextStyle headlineTxtStyle = TextStyle(fontFamily: _commonFont, fontSize: 40, color: _black,  decoration: TextDecoration.none);

  static TextStyle txtFieldStyle = TextStyle(fontFamily: 'SF Pro Display', fontSize: 25, color: _black, decoration: TextDecoration.none);

  static TextStyle menuFieldStyle = TextStyle(fontFamily: 'SF Pro Display', fontSize: 20, color: _black, decoration: TextDecoration.none);

  static TextStyle tableColumnStyle = TextStyle(fontFamily: _commonFont, fontSize: 25, color: CupertinoColors.activeBlue, decoration: TextDecoration.none);

  static TextStyle tableContentStyle = TextStyle(fontFamily: _commonFont, fontSize: 18, color: CupertinoColors.white, decoration: TextDecoration.none);

  static TextStyle buttonStyle = TextStyle(fontSize: 23, fontFamily: 'SF Pro Display', color: CupertinoColors.white, decoration: TextDecoration.none);
}