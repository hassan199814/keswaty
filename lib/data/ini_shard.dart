import 'package:keswaty/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitSharedPreferences{
  static SharedPreferences? prefs ;

 static init() async {
    prefs = await SharedPreferences.getInstance();

    // setState(() {
      prefs=prefs;
    // });
    // });
  }


  static  logOut()  async {
    // var prefs;
    if(prefs==null) {
      init();
    }
    if(prefs!=null){
      await prefs!.clear();

    }else{
      // return null;
    }

  }


  static String ? getNameUser()  {
    // var prefs;
    // if(prefs==null) {
    //   init();
    // }
    if(prefs!=null){
     return  prefs!.getString('UserName');

    }else{
      return null;
    }

  }


static setNameUser(String name) async {
  // var prefs;
  if(prefs==null) {
   await init();
  }
    if(prefs!=null){
    await prefs!.setString('UserName', name);

  }

}

  static String ? getPhoneUser()  {
    // var prefs;
    // if(prefs==null) {
    //   init();
    // }
    if(prefs!=null){
      return  prefs!.getString('PhoneNo');

    }else{
      return null;
    }

  }

  static setPhoneUser(String phone) async {
    // var prefs;
    if(prefs==null) {
      await init();
    }
    if(prefs!=null){
      await prefs!.setString('PhoneNo', phone);

    }

  }

  static String ? getEmailUser()  {
    // var prefs;
    // if(prefs==null) {
    //   init();
    // }
    if(prefs!=null){
      return  prefs!.getString('Email');

    }else{
      return null;
    }

  }

  static setEmailUser(String email) async {
    // var prefs;
    if(prefs==null) {
      await init();
    }
    if(prefs!=null){
      await prefs!.setString('Email', email);

    }

  }

  static int ? getID()  {
    // var prefs;
    // if(prefs==null) {
    //   init();
    // }
    if(prefs!=null&&prefs!.getInt('id')!=null){
      return  (prefs!.getInt('id')!);

    }else{
      return null;
    }

  }

  static String ? getAddressUser()  {
    // var prefs;
    // if(prefs==null) {
    //   init();
    // }
    if(prefs!=null){
      return  prefs!.getString('Adrs');

    }else{
      return null;
    }

  }

  static setAddressUser(String email) async {
    // var prefs;
    if(prefs==null) {
      await init();
    }
    if(prefs!=null){
      await prefs!.setString('Adrs', email);

    }

  }


  static String ? getPassUser()  {
    // var prefs;
    // if(prefs==null) {
    //   init();
    // }
    if(prefs!=null){
      return  prefs!.getString('password');

    }else{
      return null;
    }

  }

  static setPassUser(String pass) async {
    // var prefs;
    if(prefs==null) {
      await init();
    }
    if(prefs!=null){
      await prefs!.setString('password', pass);

    }

  }

  static String ? getDateUser()  {
    // var prefs;
    // if(prefs==null) {
    //   init();
    // }
    if(prefs!=null){
      return  prefs!.getString('AddingTime');

    }else{
      return null;
    }

  }

  static setDateUser(String date) async {
    // var prefs;
    if(prefs==null) {
      await init();
    }
    if(prefs!=null){
      await prefs!.setString('AddingTime', date);

    }

  }


  static bool getonboarding()  {
    // var prefs;
    // if(prefs==null) {
    //   init();
    // }
    if(prefs!=null){
      return  prefs!.getBool(AppConstants.onboarding)??false;

    }else{
      return false;
    }

  }

  static setonboarding(bool date) async {
    // var prefs;
    if(prefs==null) {
      await init();
    }
    if(prefs!=null){
      await prefs!.setBool(AppConstants.onboarding, date);

    }

  }





}