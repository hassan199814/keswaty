//
//
//
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:keswaty/data/models/base/api_response.dart';
// import 'package:keswaty/data/models/donation_bskt_model.dart';
// import 'package:keswaty/data/repository/donation_bskt_get_repo.dart';
//
// class DonationBsktGetProvider extends ChangeNotifier{
//   DonationBsktGetRepo? donationBsktGetRepo;
//
//   DonationBsktGetProvider({this.donationBsktGetRepo});
//
//   // int stateResponse =10;
//   // bool islogin =false;
//   bool isloading =false;
//   // String message_error ="";
//   List<DonationBsktModel> donationbsktlist = [];
//
//   // List<LostsFounds> searchlist = [];
//   // List<UserModel> userlist = [];
//
//   Future<void> donationbskt ( {int ? clnt_id} )async{
//     // donationbsktlist.clear();
//     print(donationbsktlist.length);
//
//     isloading =true;
//     // notifyListeners();
//
//     ApiResponse apiResponse = await donationBsktGetRepo!.get_donation_bskt(clnt_id : clnt_id);
//
//     print(apiResponse.response);
//     print(donationbsktlist.length);
//     if(apiResponse.response != null&&apiResponse.response?.statusCode ==200){
//       // Map<dynamic, dynamic> map = jsonDecode(apiResponse.response!.data);
//       Map<dynamic, dynamic> map = jsonDecode(apiResponse.response!.data);
//       print("***************************************");
//       // print(map);
//       // print(map["data"]);
//       if(map['id']){
//         for (var item in map["data"]){
//           donationbsktlist.add(DonationBsktModel.fromJson(item));
//         }
//         // islogin =true;
//         // authRepo!.setEmail(map["data"]["VisitorEmail"]);
//
//       }else{
//         // islogin =false;
//         // message_error = map["message"];
//       }
//     }else{
//
//
//       print("-----------------------------");
//     }
//
//     isloading =false;
//     notifyListeners();
//   }
//
//
//
//
//
//
// }


import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keswaty/data/datasource/remote/dio/dio_client.dart';
import 'package:keswaty/data/models/base/api_response.dart';
import 'package:keswaty/data/models/donation_bskt_model.dart';
import 'package:keswaty/data/models/donation_pic_model.dart';
import 'package:keswaty/data/models/donation_type_model.dart';
import 'package:keswaty/data/repository/donation_bskt_get_repo.dart';

class DonationBsktGetProvider extends ChangeNotifier{
  DonationBsktGetRepo? donationBsktGetRepo;

  DonationBsktGetProvider({this.donationBsktGetRepo});

  // int stateResponse =10;
  // bool islogin =false;
  bool isloading =false;
  // String message_error ="";

  List<DonationBsktModel> donationbsktlist=[];
  List<DonationBsktModel> donationbsktadded_item=[];

  List<DonationTypeModel> donationtypelist=[] ;

  List<DonationPicModel> donationpiclist=[] ;

  List<DonationTypeModel> donationtypedropdownlist=[] ;





  Future<void> donationbskt (  {required int  clnt_id} )async{
    donationbsktlist.clear();

    isloading =true;
    notifyListeners();

    ApiResponse apiResponse = await donationBsktGetRepo!.get_donation_bskt(clnt_id : clnt_id);


    if(apiResponse.response != null&&apiResponse.response?.statusCode ==200){

      for (var item in apiResponse.response?.data){
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
        donationbsktlist.add(DonationBsktModel.fromJson(valueMap));

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
    }

    isloading =false;
    notifyListeners();
  }


  Future<void> donationbskttype (  { int ? type_id} )async{

    donationtypelist.clear();

    isloading =true;
    notifyListeners();

    ApiResponse apiResponse = await donationBsktGetRepo!.get_donation_bskt_type(type_id : type_id);


    if(apiResponse.response != null&&apiResponse.response?.statusCode ==200){

      for (var item in apiResponse.response?.data){
        print(item);
        var encodedString = jsonEncode(item);

        Map<String, dynamic> valueMap = json.decode(encodedString);

        donationtypelist.add(DonationTypeModel.fromJson(valueMap));

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
    }

    isloading =false;
    notifyListeners();
  }

  Future<void> donationtypes (  { int ? bskt_id} )async{

    donationtypedropdownlist.clear();

    isloading =true;
    notifyListeners();

    ApiResponse apiResponse = await donationBsktGetRepo!.donation_types(bskt_id : bskt_id);


    if(apiResponse.response != null&&apiResponse.response?.statusCode ==200){

      for (var item in apiResponse.response?.data){
        print(item);
        var encodedString = jsonEncode(item);

        Map<String, dynamic> valueMap = json.decode(encodedString);

        donationtypedropdownlist.add(DonationTypeModel.fromJson(valueMap));

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
    }

    isloading =false;
    notifyListeners();
  }

  Future<void> donationpic (  { int ? bskt_id} )async{

    donationpiclist.clear();

    isloading =true;
    notifyListeners();

    ApiResponse apiResponse = await donationBsktGetRepo!.get_donation_pic(bskt_id : bskt_id);


    if(apiResponse.response != null&&apiResponse.response?.statusCode ==200){

      for (var item in apiResponse.response?.data){
        print(item);
        var encodedString = jsonEncode(item);

        Map<String, dynamic> valueMap = json.decode(encodedString);

        donationpiclist.add(DonationPicModel.fromJson(valueMap));

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
    }

    isloading =false;
    notifyListeners();
  }


  Future<void> donationpicdelete (  { int ? pic_id } )async{

    donationpiclist.clear();

    isloading =true;
    notifyListeners();

    ApiResponse apiResponse = await donationBsktGetRepo!.donation_pic_delete(pic_id : pic_id);

    if(apiResponse.response != null&&apiResponse.response?.statusCode ==200){

      for (var item in apiResponse.response?.data){
        print(item);
        var encodedString = jsonEncode(item);

        Map<String, dynamic> valueMap = json.decode(encodedString);

        donationpiclist.add(DonationPicModel.fromJson(valueMap));
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
    }

    isloading =false;
    notifyListeners();
  }


  Future<void> donationtypedelete (  {  int ? bskt_id , int ? type_id} )async{

    donationpiclist.clear();

    isloading =true;
    notifyListeners();

    ApiResponse apiResponse = await donationBsktGetRepo!.donation_type_delete(bskt_id: bskt_id , type_id: type_id);

    if(apiResponse.response != null&&apiResponse.response?.statusCode ==200){

      for (var item in apiResponse.response?.data){
        print(item);
        var encodedString = jsonEncode(item);

        Map<String, dynamic> valueMap = json.decode(encodedString);

        donationpiclist.add(DonationPicModel.fromJson(valueMap));
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
    }

    isloading =false;
    notifyListeners();
  }


  Future<void> insertbasket (   DonationBsktModel donationBsktModel )async{

    donationbsktlist.clear();

    isloading =true;
    // notifyListeners();

    ApiResponse apiResponse = await donationBsktGetRepo!.insert_basket( donationBsktModel);
    print(apiResponse.response);
    if(apiResponse.response != null&&apiResponse.response?.statusCode ==200){

      for (var item in apiResponse.response?.data){
        print(item);
        var encodedString = jsonEncode(item);

        Map<String, dynamic> valueMap = json.decode(encodedString);

        donationbsktadded_item.add(DonationBsktModel.fromJson(valueMap));
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








  List<File>? imageFileList = [];
  final List<dynamic> _documents = [];

  void deleteImage(int index) {
    imageFileList?.removeAt(index);

  }
  final picker=ImagePicker();


  pickMultipleImage() async {
    try {
      
      final images = await picker.pickMultiImage(
          maxWidth: 600, maxHeight: 600, imageQuality: 50);
      for (XFile image in images) {
        var imagesTemporary = File(image.path);
        imageFileList!.add(imagesTemporary);
        print(imageFileList);
        // print(_documents);
      }
      notifyListeners();
    } catch (e) {

    }
  }
  pickCameraImage() async {
    try {
            final image = await picker.pickImage(
          maxWidth: 600, maxHeight: 600, imageQuality: 50, source: ImageSource.camera);
      if (image == null) return;

        var imagesTemporary = File(image.path);
        imageFileList!.add(imagesTemporary);
      notifyListeners();
    } catch (e) {

    }

  }




  Future<void> uploadImage(String bsktId,String type) async {
    for(int i=0;i<imageFileList!.length;i++){


    DioClient? dioClient;
    String fileName = imageFileList![i].path.split('/').last;
    FormData formData = FormData.fromMap({
      "file":
      await MultipartFile.fromFile(imageFileList![i].path, filename:fileName),
      'id':bsktId,
      'type':type,
    });
    var response = await  Dio().post("https://keswaty.com/api/donation/type/create", data: formData);
  }
    imageFileList=[];
    notifyListeners();
  }

}