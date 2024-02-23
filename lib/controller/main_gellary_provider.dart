import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:keswaty/data/models/base/api_response.dart';
import 'package:keswaty/data/models/gellary_model.dart';
import 'package:keswaty/data/models/news_model.dart';
import 'package:keswaty/data/repository/main_gellary_repo.dart';

class MainGellaryProvider extends ChangeNotifier {
  MainGellaryRepo? mainGellaryRepo;

  MainGellaryProvider({this.mainGellaryRepo});

  // int stateResponse =10;
  // bool islogin =false;
  bool isloading = false;

  // String message_error ="";


   List<GellaryModel> gellaryList = [];


   List<NewsModel> newslist = [];


  Future<void> getgellarymain() async {
    gellaryList.clear();

    isloading = true;
    notifyListeners();

    ApiResponse apiResponse = await mainGellaryRepo!.get_gellary_main();


    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      for (var item in apiResponse.response?.data) {
        print(item);
        var encodedString = jsonEncode(item);

        Map<String, dynamic> valueMap = json.decode(encodedString);

        // ApiResponse apiResponse1 = await donationBsktGetRepo!.get_donation_bskt_type(type_id :DonationBsktModel.fromJson(valueMap).id );
        // for (var item1 in apiResponse1.response?.data){
        //   var encodedString1 = jsonEncode(item1);
        //
        //   Map<String, dynamic> valueMap1 = json.decode(encodedString1);
        //
        //   donationtypelist.
        //
        // }
        gellaryList.add(GellaryModel.fromJson(valueMap));
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
    } else {
      print("-----------------------------");
    }

    isloading = false;
    notifyListeners();
  }


//==============================================================================================================================


  Future<void> getnews() async {
    newslist.clear();

    isloading = true;
    notifyListeners();

    ApiResponse apiResponse = await mainGellaryRepo!.get_news();


    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      for (var item in apiResponse.response?.data) {
        print(item);
        var encodedString = jsonEncode(item);

        Map<String, dynamic> valueMap = json.decode(encodedString);

        // ApiResponse apiResponse1 = await donationBsktGetRepo!.get_donation_bskt_type(type_id :DonationBsktModel.fromJson(valueMap).id );
        // for (var item1 in apiResponse1.response?.data){
        //   var encodedString1 = jsonEncode(item1);
        //
        //   Map<String, dynamic> valueMap1 = json.decode(encodedString1);
        //
        //   donationtypelist.
        //
        // }
        newslist.add(NewsModel.fromJson(valueMap));
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
    } else {
      print("-----------------------------");
    }

    isloading = false;
    notifyListeners();
  }



}