





import 'package:dio/dio.dart';
import 'package:keswaty/constant.dart';
import 'package:keswaty/data/datasource/remote/dio/dio_client.dart';
import 'package:keswaty/data/models/base/api_response.dart';
import 'package:keswaty/data/models/sginup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetAccountRepo {

  DioClient? dioClient;
  SharedPreferences sharedPreferences;
  ResetAccountRepo({required this.sharedPreferences,this.dioClient});


  Future<ApiResponse> reset_account(String email) async {
    try {
      dioClient?.updateHeader("token");

      Response response = await dioClient!.get(
          "${AppConstants.RESET_ACCOUNT}?email=$email");

      // Response response = await dioClient!.get(AppConstants.INSERT_LOSTFOUND_URL,queryParameters: lostsFounds.toJson());
      // Response response = await dioClient!.post(AppConstants.LOGIN_URL,data: {
      //   "username":username,
      //   "password":password
      // } );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }


  Future<ApiResponse> update_account ( SginUpModel sginUpModel )async{


    try{
      dioClient?.updateHeader("token");

      // Response response = await dioClient!.get("https://keswaty.com/api/donation?id=$clnt_id");

      Response response = await dioClient!.get(AppConstants.UPDATE_ACCOUNT,queryParameters:sginUpModel.toJson());
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