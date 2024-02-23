import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:keswaty/Widgets/colors.dart';

class AppTheme {
  AppTheme(BuildContext context) {
    // var _theme = Theme.of(context);

    if (Get.isDarkMode){

      Get.changeTheme(ThemeData.light(),);
    }
    else {
      Get.changeTheme(ThemeData.dark());
    }

  }

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
class MyInputTheme {


  TextStyle _builtTextStyle(Color color , {double size = 16.0 } ){
    return TextStyle(
      color: color,
      fontSize: size,


    );
  }
  
  OutlineInputBorder _buildBorder(Color color){
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: color,
        width: 1.0,
      ),
    );
  }


  InputDecorationTheme theme() => InputDecorationTheme(
    contentPadding: EdgeInsets.all(15),
    isDense: true,
    
    floatingLabelBehavior: FloatingLabelBehavior.always,
    
    constraints: BoxConstraints(maxWidth: 150),
    
    //Border
    enabledBorder: _buildBorder(kblack38),
    
    errorBorder: _buildBorder(Colors.red),
    
    focusedErrorBorder: _buildBorder(Colors.red  ),

    border: _buildBorder(Colors.yellow),
    
    focusedBorder: _buildBorder(kblueColor),


    disabledBorder: _buildBorder(Colors.grey[400]!),
    
    //TextStyles
    suffixStyle: _builtTextStyle(Colors.red),
    counterStyle: _builtTextStyle(Colors.grey, size: 12.0),
    floatingLabelStyle: _builtTextStyle(kblueColor),
    
    errorStyle: _builtTextStyle(Colors.red, size:10.0),
    helperStyle: _builtTextStyle(kblueColor, size: 10.0),
    hintStyle: _builtTextStyle(Colors.grey),
    labelStyle: _builtTextStyle(kblueColor),
    prefixStyle: _builtTextStyle(kblueColor),

  );


}


