
import 'package:flutter/cupertino.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/data/models/base/api_response.dart';
import 'package:keswaty/data/models/sginup_model.dart';
import 'package:keswaty/data/repository/login_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginProvider extends ChangeNotifier{
  LoginRepo loginRepo;

  LoginProvider({required this.loginRepo});

   // int stateResponse =10;
  List<SginUpModel> sginUpModel = [];

  bool islogin =false;
   bool isloading =false;
   String message_error ="";
Future<void> stoploading() async{
  isloading=false;
  notifyListeners();
}
  Future<void> login (String email , String password)async{

    isloading =true;
    notifyListeners();
    ApiResponse apiResponse = await loginRepo.login(email, password);

    print(email);

    print( " sginUpModel.length");
    print(  sginUpModel);


    if(apiResponse.response != null&&apiResponse.response?.statusCode ==200){
      try {
        print(apiResponse.response);
        // if(apiResponse.response.toString().contains(""))
        Map<String, dynamic> map = apiResponse.response?.data[0];

        if(map['id'] != null){
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt('id',  map["id"]);
          await InitSharedPreferences.setPhoneUser(map["PhoneNo"]);
          await InitSharedPreferences.setEmailUser(map["Email"]);
          await InitSharedPreferences.setPassUser( map["password"]);
          await InitSharedPreferences.setNameUser(map["UserName"]);
          await InitSharedPreferences.setAddressUser( map["Adrs"]);
          // await InitSharedPreferences.setDateUser( map["AddingTime"]);

          loginRepo!.setEmail(map["Email"]);
          islogin =true;
          isloading = false;
          notifyListeners();
        }else{
          islogin =false;
          isloading =false;
          message_error = map["message"]!;
        }
      } on  Exception catch(_){

        isloading =false;
        notifyListeners();
      }

    }
    //
    // isloading =false;
    // notifyListeners();
}



}