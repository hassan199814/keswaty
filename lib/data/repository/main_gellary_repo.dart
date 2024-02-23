


import 'package:dio/dio.dart';
import 'package:keswaty/constant.dart';
import 'package:keswaty/data/models/base/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../datasource/remote/dio/dio_client.dart';

class MainGellaryRepo {
  DioClient? dioClient;
  SharedPreferences sharedPreferences;

  MainGellaryRepo({required this.sharedPreferences, this.dioClient});



  Future<ApiResponse> get_gellary_main() async {
    try {
      dioClient?.updateHeader("token");
      // Response response = await dioClient!.get("https://keswaty.com/api/donation?id=$clnt_id");

      Response response = await dioClient!.get("${AppConstants.GALLARY}");
      print(response);
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


  //==============================================================================================================================


  Future<ApiResponse> get_news() async {
    try {
      dioClient?.updateHeader("token");
      // Response response = await dioClient!.get("https://keswaty.com/api/donation?id=$clnt_id");

      Response response = await dioClient!.get("${AppConstants.GET_NEWS}");
      print(response);
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

//==============================================================================================================================

}