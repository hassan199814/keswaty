import 'package:dio/dio.dart';
import 'package:keswaty/constant.dart';
import 'package:keswaty/data/datasource/remote/dio/dio_client.dart';
import 'package:keswaty/data/models/base/api_response.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo{
  DioClient? dioClient;
  SharedPreferences sharedPreferences;
  LoginRepo({required this.sharedPreferences,this.dioClient});



  Future<ApiResponse> login (String email,String password)async{

    try{
      // dioClient?.updateHeader("token");
      Response response = await dioClient!.get(AppConstants.LOGIN_USER,queryParameters: {"email":email,"password":password});
      // Response response = await dioClient!.post(AppConstants.LOGIN_URL,data: {
      //   "username":username,
      //   "password":password
      // } );

      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(e);
    }

  }
  void setEmail (String email){
  sharedPreferences.setString("user_email", email);
  }
  Future<String> getEmail()async{
    return await sharedPreferences.getString("user_email")??"";
  }

}