
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

  Future<void> login (String email , String password)async{

    // isloading =true;
    notifyListeners();
    ApiResponse apiResponse = await loginRepo.login(email, password);

    print(email);

    print( " sginUpModel.length");
    print(  sginUpModel);


    if(apiResponse.response != null&&apiResponse.response?.statusCode ==200){
      print(email);
      print(apiResponse.response!.data);
      Map<String, dynamic> map = apiResponse.response?.data[0];
      // const arr=[];
      // map.forEach((key, value) =>arr[key:value]);
      // print(arr);
      print(map);
      if(map['id'] != null){
        // print(map);
        isloading = false;
        // notifyListeners();
// Obtain shared preferences.
        final SharedPreferences prefs = await SharedPreferences.getInstance();
         await prefs.setInt('id',  map["id"]);
//
// // Save an integer value to 'counter' key.
        await InitSharedPreferences.setPhoneUser(map["PhoneNo"]);

// // Save an boolean value to 'repeat' key.
//         await prefs.setBool('repeat', true);
// // Save an double value to 'decimal' key.
//         await prefs.setDouble('decimal', 1.5);
// // Save an String value to 'action' key.
        await InitSharedPreferences.setEmailUser(map["Email"]);
        await InitSharedPreferences.setPassUser( map["password"]);
        await InitSharedPreferences.setNameUser(map["UserName"]);
        await InitSharedPreferences.setAddressUser( map["Adrs"]);
        // await InitSharedPreferences.setDateUser( map["AddingTime"]);

        islogin =true;
       loginRepo!.setEmail(map["Email"]);

      }else{
        islogin =false;
        message_error = map["message"]!;
      }
    }else{


print("-----------------------------");

    }

    isloading =false;
    notifyListeners();
}



}