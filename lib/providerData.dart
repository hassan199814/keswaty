import 'package:flutter/material.dart';
import 'package:keswaty/main.dart';

  class ProviderData extends ChangeNotifier{

      ThemeData _themeData = darkMode ? ThemeData.dark() : ThemeData.light();

      getThem(){
        return _themeData;
      }

      setThem(ThemeData theme) {
        _themeData = theme;
        notifyListeners();
      }


  }