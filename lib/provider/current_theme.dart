import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_app/common/color.dart';
import 'package:simple_app/common/global.dart';

class CurrentTheme with ChangeNotifier {
  // 当前语言环境
  ThemeMode themeMode;

  ThemeMode get value => themeMode;

  CurrentTheme({this.themeMode = ThemeMode.light});
  // 是否为夜间模式
  bool get isNightMode => themeMode == ThemeMode.dark ? true : false;

  // 暗色或白色背景色
  Color get themeBackgroundColor =>
      isNightMode ? easyDarkColor : const Color.fromRGBO(246, 246, 246, 1.0);

  // 渐变色
  List<Color> get gradientColors => isNightMode
      ? [Colors.black12, Colors.black]
      : [const Color.fromRGBO(152, 203, 179, 0.5), themeColor];
  Color get darkOrWhiteColor => isNightMode ? Colors.white : Colors.black;
  
  changeMode(ThemeMode mode) async {
    themeMode = mode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(ConstantKey.isNightMode, isNightMode);
    notifyListeners();
  }

  // 初始化
  void initNightMode({bool? isNightMode}) async {
    if (isNightMode != null) {
      if (isNightMode) {
        themeMode = ThemeMode.dark;
        notifyListeners();
      }
    }
  }
}
