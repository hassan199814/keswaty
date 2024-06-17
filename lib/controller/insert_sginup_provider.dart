import 'dart:convert';
import 'package:flutter/cupertino.dart';
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

     print(apiResponse.error);
     print(apiResponse.response?.statusCode==200);
     print(apiResponse.response);

    if(apiResponse.response != null&&apiResponse.response?.statusCode ==200){


      Map<dynamic, dynamic> map = jsonDecode(apiResponse.response!.data);
      // Map<dynamic, dynamic> map = jsonDecode(apiResponse.response!.data);
      // print("***************************************");
      //  print(map);
      if(apiResponse.response != null&&apiResponse.response?.statusCode ==200) {
        if(apiResponse.response!.data.toString().contains("Already Exists.")){
          for (var item in apiResponse.response?.data) {
            var encodedString = jsonEncode( apiResponse.response?.data);

            // Map<String, dynamic> valueMap = json.decode(encodedString);
            Map<String, dynamic> valueMap = json.decode(encodedString);

            singuperrorlist.add(SignuperrorModel.fromJson(valueMap));
            print(userlist);
            print(singuperrorlist);

        }
        } else{
          for (var item in apiResponse.response?.data) {
          print(item);
          var encodedString = jsonEncode(item);

          Map<String, dynamic> valueMap = Map.castFrom(json.decode(encodedString));

          userlist.add(SginUpModel.fromJson(valueMap));
          }

        }

      }


    }else{
      // print(apiResponse.response?.statusCode==200);
      // print(apiResponse.response?.statusMessage);
      print("-----------------------------");


    }

    isloading =false;
    notifyListeners();

  }



}