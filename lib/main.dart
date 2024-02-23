
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keswaty/Widgets/My_Input_Them.dart';
import 'package:keswaty/controller/Reset_Account_Provider.dart';
import 'package:keswaty/controller/donation_bskt_get_provider.dart';
import 'package:keswaty/controller/login_provider.dart';
import 'package:keswaty/controller/insert_sginup_provider.dart';
import 'package:keswaty/controller/main_gellary_provider.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/providerData.dart';
import 'package:keswaty/di/di_container.dart' as di;
import 'package:keswaty/view/splash_screen/spl_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



String language = 'AR';
bool darkMode = false;



void main() async{
  WidgetsFlutterBinding.ensureInitialized();



  SharedPreferences.getInstance().then((instance) {
    language = instance.getString('language')!;
    darkMode = instance.getBool('darkMode')!;

  }
  );
  await InitSharedPreferences.init();
  await di.init();
  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<LoginProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<InsertSginUpProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DonationBsktGetProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<MainGellaryProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ResetAccountProvider>()),
    ],

        child: MyApp(),

  )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider <ProviderData> (
      create: (context) => ProviderData(),
      child: MafqwdwithThem(),
      // MaterialApp(
    );

  }
}

class MafqwdwithThem extends StatelessWidget {
  const MafqwdwithThem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ProviderData>(context);
    return
      GetMaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        inputDecorationTheme: MyInputTheme().theme(),
        brightness: Brightness.light,
        fontFamily: "nor"

      ),

      // darkTheme: ThemeData(
      //     inputDecorationTheme: MyInputTheme().theme(),
      //     brightness: Brightness.dark,
      //     fontFamily: "nor"
      //
      // ),


      home: mysplsh(),







    );
  }
}

