import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/data/models/base/api_response.dart';
import 'package:keswaty/data/models/sginup_model.dart';
import 'package:keswaty/data/repository/inset_sginup_repo.dart';
import 'package:keswaty/data/repository/reset_accunt_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetAccountProvider extends ChangeNotifier{
  ResetAccountRepo? resetAccountRepo;

  ResetAccountProvider({this.resetAccountRepo});

  // int stateResponse =10;
  // bool islogin =false;
  bool isloading =false;
  String message_error ="";
  bool iserror =false;

  List<SginUpModel> userlist = [];
  List<SginUpModel> userlist2 = [];
  List<SginUpModel> userlist3 = [];

//============================================================================================================


  Future<void> reset_account ( String email )async{

    userlist.clear();

    isloading =true;
    // notifyListeners();



    ApiResponse apiResponse = await resetAccountRepo!.reset_account(email);
    print(apiResponse.response);
    if(apiResponse.response != null&&apiResponse.response?.statusCode ==200){

      for (var item in apiResponse.response?.data){
        print(item);
        var encodedString = jsonEncode(item);

        Map<String, dynamic> valueMap = json.decode(encodedString);

        userlist.add(SginUpModel.fromJson(valueMap));
      }
      // donationbsktlist=apiResponse.response?.data;
      // Map<dynamic, dynamic> map = jsonDecode(apiResponse.response.data);
      // map = jsonDecode(apiResponse.response?.data);
      // print("***************************************");
      // print(map);
      // print(map["data"]);

      // if(apiResponse.response?.data){
      //
      //   // print(donationbsktlist.length);
      //   // islogin =true;
      //   // authRepo!.setEmail(map["data"]["VisitorEmail"]);
      //
      // }else{
      //   // islogin =false;
      //   // message_error = map["message"];
      // }
    }else{


      print("-----------------------------");
      print(apiResponse.response);
    }

    isloading =false;
    notifyListeners();
  }


  bool islogin=false;

  Future<void> login ( String email )async{

    userlist3.clear();

    isloading =true;

    // notifyListeners();



    ApiResponse apiResponse = await resetAccountRepo!.reset_account(email);
    print(apiResponse.response);
    if(apiResponse.response != null&&apiResponse.response?.statusCode ==200){

      for (var item in apiResponse.response?.data){
        print(item);
        var encodedString = jsonEncode(item);

        Map<String, dynamic> valueMap = json.decode(encodedString);

        userlist3.add(SginUpModel.fromJson(valueMap));
      }
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('id',  userlist3.last.id!);
//
// // Save an integer value to 'counter' key.
      await InitSharedPreferences.setPhoneUser(userlist3.last.phoneNo!);

// // Save an boolean value to 'repeat' key.
//         await prefs.setBool('repeat', true);
// // Save an double value to 'decimal' key.
//         await prefs.setDouble('decimal', 1.5);
// // Save an String value to 'action' key.
      await InitSharedPreferences.setEmailUser(userlist3.last.Email!);
      await InitSharedPreferences.setPassUser( userlist3.last.password!);
      await InitSharedPreferences.setNameUser(userlist3.last.userName!);
      await InitSharedPreferences.setAddressUser( userlist3.last.adrs!);
      // await InitSharedPreferences.setDateUser( map["AddingTime"]);

      islogin =true;
      // loginRepo!.setEmail(map["Email"]);
    }else{


      print("-----------------------------");
      print(apiResponse.response);
    }

    isloading =false;
    notifyListeners();
  }




  Future<void> update_account (   SginUpModel sginUpModel )async{

    userlist2.clear();

    isloading =true;
    // notifyListeners();

    ApiResponse apiResponse = await resetAccountRepo!.update_account( sginUpModel);
    print(apiResponse.response);
    if(apiResponse.response != null&&apiResponse.response?.statusCode ==200){

      for (var item in apiResponse.response?.data){
        print(item);
        var encodedString = jsonEncode(item);

        Map<String, dynamic> valueMap = json.decode(encodedString);

        userlist2.add(SginUpModel.fromJson(valueMap));
      }

    }else{


      print("-----------------------------");
      print(apiResponse.response);
    }

    isloading =false;
    notifyListeners();
  }

}