
import 'package:dio/dio.dart';
import 'package:keswaty/constant.dart';
import 'package:keswaty/data/datasource/remote/dio/dio_client.dart';
import 'package:keswaty/data/models/base/api_response.dart';
import 'package:keswaty/data/models/donation_bskt_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonationBsktGetRepo{
  DioClient? dioClient;
  SharedPreferences sharedPreferences;
  DonationBsktGetRepo({required this.sharedPreferences,this.dioClient});


  Future<ApiResponse> get_donation_bskt ({required int  clnt_id })async{


    try{
      dioClient?.updateHeader("token");
      // Response response = await dioClient!.get("https://keswaty.com/api/donation?id=$clnt_id");

      Response response = await dioClient!.get("${AppConstants.DONATION_BSKT}?id=$clnt_id");
      print(response);
      // Response response = await dioClient!.get(AppConstants.INSERT_LOSTFOUND_URL,queryParameters: lostsFounds.toJson());
      // Response response = await dioClient!.post(AppConstants.LOGIN_URL,data: {
      //   "username":username,
      //   "password":password
      // } );

      return ApiResponse.withSuccess(response);

    }catch(e){

      return ApiResponse.withError(e);
    }

  }



  Future<ApiResponse> get_donation_bskt_type ({ int ?  type_id })async{


    try{
      dioClient?.updateHeader("token");
      // Response response = await dioClient!.get("https://keswaty.com/api/donation?id=$clnt_id");

      Response response = await dioClient!.get("${AppConstants.DONATION_BSKT_TYPE}?id=$type_id");
      print(response);
      // Response response = await dioClient!.get(AppConstants.INSERT_LOSTFOUND_URL,queryParameters: lostsFounds.toJson());
      // Response response = await dioClient!.post(AppConstants.LOGIN_URL,data: {
      //   "username":username,
      //   "password":password
      // } );

      return ApiResponse.withSuccess(response);

    }catch(e){

      return ApiResponse.withError(e);
    }

  }


  Future<ApiResponse> donation_types ({ int ?  bskt_id })async{


    try{
      dioClient?.updateHeader("token");
      // Response response = await dioClient!.get("https://keswaty.com/api/donation?id=$clnt_id");

      Response response = await dioClient!.get("${AppConstants.GET_DONATION_TYPE}?id=$bskt_id");
      print(response);
      // Response response = await dioClient!.get(AppConstants.INSERT_LOSTFOUND_URL,queryParameters: lostsFounds.toJson());
      // Response response = await dioClient!.post(AppConstants.LOGIN_URL,data: {
      //   "username":username,
      //   "password":password
      // } );

      return ApiResponse.withSuccess(response);

    }catch(e){

      return ApiResponse.withError(e);
    }

  }


  Future<ApiResponse> get_donation_pic ({ int ?  bskt_id })async{


    try{
      dioClient?.updateHeader("token");
      // Response response = await dioClient!.get("https://keswaty.com/api/donation?id=$clnt_id");

      Response response = await dioClient!.get("${AppConstants.DONATION_PIC}?id=$bskt_id");
      print(response);
      // Response response = await dioClient!.get(AppConstants.INSERT_LOSTFOUND_URL,queryParameters: lostsFounds.toJson());
      // Response response = await dioClient!.post(AppConstants.LOGIN_URL,data: {
      //   "username":username,
      //   "password":password
      // } );

      return ApiResponse.withSuccess(response);

    }catch(e){

      return ApiResponse.withError(e);
    }

  }


  Future<ApiResponse> donation_pic_delete ({ int ?  pic_id })async{


    try{
      dioClient?.updateHeader("token");
      // Response response = await dioClient!.get("https://keswaty.com/api/donation?id=$clnt_id");

      Response response = await dioClient!.get("${AppConstants.DONATION_PIC_DELETE}?id=$pic_id");
      print(response);
      // Response response = await dioClient!.get(AppConstants.INSERT_LOSTFOUND_URL,queryParameters: lostsFounds.toJson());
      // Response response = await dioClient!.post(AppConstants.LOGIN_URL,data: {
      //   "username":username,
      //   "password":password
      // } );

      return ApiResponse.withSuccess(response);

    }catch(e){

      return ApiResponse.withError(e);
    }

  }


  Future<ApiResponse> donation_type_delete ({ int ?  type_id , int ? bskt_id })async{


    try{
      dioClient?.updateHeader("token");
      // Response response = await dioClient!.get("https://keswaty.com/api/donation?id=$clnt_id");

      Response response = await dioClient!.get("${AppConstants.DONATION_TYPE_DELETE}?id=$bskt_id&type=$type_id");
      print(response);
      // Response response = await dioClient!.get(AppConstants.INSERT_LOSTFOUND_URL,queryParameters: lostsFounds.toJson());
      // Response response = await dioClient!.post(AppConstants.LOGIN_URL,data: {
      //   "username":username,
      //   "password":password
      // } );

      return ApiResponse.withSuccess(response);

    }catch(e){

      return ApiResponse.withError(e);
    }

  }



  Future<ApiResponse> insert_basket ( DonationBsktModel donationBsktModel )async{


    try{
      dioClient?.updateHeader("token");

      // Response response = await dioClient!.get("https://keswaty.com/api/donation?id=$clnt_id");

      Response response = await dioClient!.get(AppConstants.INSERT_BASKET,queryParameters:donationBsktModel.toJson());
      print(response);
      // Response response = await dioClient!.get(AppConstants.INSERT_LOSTFOUND_URL,queryParameters: lostsFounds.toJson());
      // Response response = await dioClient!.post(AppConstants.LOGIN_URL,data: {
      //   "username":username,
      //   "password":password
      // } );

      return ApiResponse.withSuccess(response);

    }catch(e){

      return ApiResponse.withError(e);
    }

  }


}