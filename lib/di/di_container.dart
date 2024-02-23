

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:keswaty/constant.dart';
import 'package:keswaty/controller/Reset_Account_Provider.dart';
import 'package:keswaty/controller/donation_bskt_get_provider.dart';
import 'package:keswaty/controller/login_provider.dart';
import 'package:keswaty/controller/insert_sginup_provider.dart';
import 'package:keswaty/controller/main_gellary_provider.dart';
import 'package:keswaty/data/datasource/remote/dio/dio_client.dart';
import 'package:keswaty/data/datasource/remote/dio/logging_interceptor.dart';
import 'package:keswaty/data/repository/donation_bskt_get_repo.dart';
import 'package:keswaty/data/repository/login_repo.dart';
import 'package:keswaty/data/repository/inset_sginup_repo.dart';
import 'package:keswaty/data/repository/main_gellary_repo.dart';
import 'package:keswaty/data/repository/reset_accunt_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sl = GetIt.instance;


Future<void> init() async{
  //core
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), sharedPreferences: sl()));


  // Repository

  sl.registerLazySingleton(() => LoginRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => InsertSginUpRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => DonationBsktGetRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => MainGellaryRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => ResetAccountRepo(sharedPreferences: sl(), dioClient: sl()));




  // Provider

  sl.registerFactory(() => LoginProvider(loginRepo: sl()));
  sl.registerFactory(() => InsertSginUpProvider(insertSginUpRepo: sl()));
  sl.registerFactory(() => DonationBsktGetProvider(donationBsktGetRepo: sl()));
  sl.registerFactory(() => MainGellaryProvider(mainGellaryRepo: sl()));
  sl.registerFactory(() => ResetAccountProvider(resetAccountRepo: sl()));



  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}