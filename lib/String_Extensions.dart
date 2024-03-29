import 'package:flutter/material.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';

    extension StringExtensions on String{


      bool isValidEmail(){
        return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\"".+\"))@((\[[0-9]{1,3\.[0-9]{1,3}\.[0-9]{1,3\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-z]{2,}))$')
            .hasMatch(this);
      }

      bool isWhitespace() => this.trim().isEmpty;
      bool isValidDouble() => double.tryParse(this) != null;
      bool isValidInt() => int.tryParse(this) != null;

    }

    Container buildDivider() {
      return Container(
        padding: EdgeInsets.only(right: 15,left: 15),
        child: Divider(
          height: 20,
          color: kblack38,
        ),
      );
    }
    Container buildDivider1() {
      return Container(
        padding: EdgeInsets.only(right: 0,left: 20),
        child: Divider(
          color: kblack,
        ),
      );
    }
    Container buildDividerWithText() {
      return Container(
        padding: const EdgeInsets.only(right: 0,left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              height: 20,
              color: kblack38,
            ),
            Text("Or"),
            Divider(
              height: 20,
              color: kblack38,
            ),
          ],
        )


      );
    }

    VerticalDivider buildVerticalDivider() {
      return VerticalDivider(
        color: kblack38,
        width: 15,

      );
    }

    final headingStyle = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: kblueColor,
        height: 1.5
    );

    final TextStyleGray = TextStyle(
        color: kblack38,
      );


    final OtpInputDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      enabledBorder: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(),
    );

    OutlineInputBorder outlineInputBorder() {
      return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: kblack38),
    );
    }



    Language _language = Language();

    //الاخطاااااااااء
       String kEmailNullError = _language.tPleaseEnterValidEmail();
     String KinvalidEmailError = _language.tPleaseEnterValidEmail();
     String KPassNullError = _language.tPleaseEnteryourpassword();
     String KShortPassError = _language.tPasswordistooshort();
     String KMatchPassError = _language.passnotmatch();