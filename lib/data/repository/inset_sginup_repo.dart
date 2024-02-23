
import 'package:dio/dio.dart';
import 'package:keswaty/constant.dart';
import 'package:keswaty/data/datasource/remote/dio/dio_client.dart';
import 'package:keswaty/data/models/base/api_response.dart';
import 'package:keswaty/data/models/sginup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertSginUpRepo{
  DioClient? dioClient;
  SharedPreferences sharedPreferences;
  InsertSginUpRepo({required this.sharedPreferences,this.dioClient});


  Future<ApiResponse> insert_response (SginUpModel sginUpModel )async{


    try{
      dioClient?.updateHeader("token");
      Response response = await dioClient!.get(AppConstants.GREATE_USER,queryParameters:sginUpModel.toJson());
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