import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:keswaty/data/models/base/api_response.dart';
import 'package:keswaty/data/models/sginup_model.dart';
import 'package:keswaty/data/models/signuperrorModel.dart';
import 'package:keswaty/data/repository/inset_sginup_repo.dart';

class InsertSginUpProvider extends ChangeNotifier{
  InsertSginUpRepo? insertSginUpRepo;

  InsertSginUpProvider({this.insertSginUpRepo});
  // int stateResponse =10;
  // bool islogin =false;
  bool isloading =false;
   String message_error ="";
  bool iserror =false;
   Map<String, dynamic> errlist=new Map<String,dynamic>();


  List<SginUpModel> userlist = [];
  List<SignuperrorModel> singuperrorlist = [];

//============================================================================================================
  Future<void> insert_response (SginUpModel sginUpModel )async{
    //userlist.clear();
    // isloading =true;
    iserror =false;
    message_error="";
    isloading =true;
    notifyListeners();
    ApiResponse apiResponse = await insertSginUpRepo!.insert_response(sginUpModel);



    try {
      if (apiResponse.response != null &&
          apiResponse.response?.statusCode == 200) {
          Map<String, dynamic> userMap =jsonDecode(apiResponse.response.toString());
              singuperrorlist.add(SignuperrorModel.fromJson(userMap));
        iserror = false;
        isloading = false;
      } else {
        iserror = true;
        // apiResponse.
        // Extracting the overall message and errors
        // final String message = apiResponse.error['response'];
        final DioException r = apiResponse.error;
        print(r.response);

        print(r);
        // print(r.error.toString());
        print(apiResponse.error.response);
        print(apiResponse.error.message);
        print(apiResponse.error.toString());
        // Response hh = apiResponse.error.response!;
        errlist = apiResponse.error.response!.data['errors'];
        message_error = apiResponse.error.response!.data['message'];

        print("-----------------------------");
      }
    }catch(e){
      message_error=e.toString();
      e.printError;
      print(e);
      iserror=true;
    }

    isloading =false;
    notifyListeners();

  }



}