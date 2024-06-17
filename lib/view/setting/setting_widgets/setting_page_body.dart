import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/main.dart';
import 'package:keswaty/view/Login_Resiter/Login/login.dart';
import 'package:keswaty/view/setting/general_setting/general_setting.dart';
import 'package:keswaty/view/setting/personal_data/personal_data.dart';



class SettingPageBody extends StatefulWidget {
  const SettingPageBody({super.key});

  @override
  State<SettingPageBody> createState() => _SettingPageBodyState();
}

class _SettingPageBodyState extends State<SettingPageBody> {

  final Language _language = Language();

  @override

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return  Directionality(
      textDirection: language == 'AR' ? TextDirection.rtl : TextDirection.ltr,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [

              Material(
                color: Theme.of(context).brightness == Brightness.dark
                    ?  const Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 2,
                borderRadius: BorderRadius.circular(5),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const GeneralSetting())),

                  child: Container(

                    child:  Column(
                      children: [
                        const SizedBox(height: 15,),
                        Row(
                          children: [
                            const SizedBox(width: 7),
                            const Icon(Icons.settings_outlined, size: 20, color: kblueColor),
                            const SizedBox(width: 20),
                            Expanded(
                              child:
                                  Text(
                                    _language.tGaneralSetting(),
                                      style: const TextStyle(fontSize: 15,color: kblueColor,
                                      )
                                  ),
                            ),
                            const Icon(Icons.arrow_forward_ios, size: 15, color:kblueColor,),
                            const SizedBox(width: 7),

                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            const SizedBox(width: 50,),
                            Text(_language.tLanguagelanguage(), style: TextStyle(fontSize: screenWidth / 50,color: kblack38,decoration: TextDecoration.underline,)),
                            const SizedBox(width: 10),
                            Text(_language.tsituation(), style: TextStyle(fontSize: screenWidth / 50,color: kblack38,decoration: TextDecoration.underline,)),
                            const SizedBox(width: 10),
                            Text(_language.taboutapp(), style: TextStyle(fontSize: screenWidth / 50,color: kblack38,decoration: TextDecoration.underline,)),
                            const SizedBox(width: 10),

                          ],
                        ),
                        const SizedBox(height: 5,),
                      ],
                    ) ,
                  ),
                ),
              ),



              const SizedBox(height: 20,),

              Material(
                color: Theme.of(context).brightness == Brightness.dark
                    ?  const Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 3,
                borderRadius: BorderRadius.circular(5),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(

                  onTap: () {
                    if(InitSharedPreferences.getNameUser()!=null&&InitSharedPreferences.getNameUser()!.isNotEmpty) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const PersonalData()));
                    } else{
                      AwesomeDialog(
                        dialogBackgroundColor: Theme.of(context).brightness == Brightness.dark
                            ?  const Color.fromRGBO(41, 45, 33, 1)
                            : kwhait,
                        context: context,
                        dialogType: DialogType.noHeader,
                        animType: AnimType.topSlide,
                        showCloseIcon: true,
                        title: "!!",
                        desc: _language.tAlertWrong(),
                        btnOkText: _language.tbtnGoLogin(),
                        btnCancelText: _language.tbtnCancel(),
                        btnOkColor: kblueColor,
                        btnOkIcon: Icons.login,
                        buttonsBorderRadius: const BorderRadius.all(
                            Radius.circular(10)),
                        btnOkOnPress: ()  {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const Login()));
                        },
                        btnCancelOnPress: (){
                        }

                      ).show();
                    }

                  } ,

                  child: Container(

                    child:  Column(
                      children: [

                        const SizedBox(height: 15,),
                        Row(
                          children: [
                            const SizedBox(width: 7),
                            const Icon(Icons.manage_accounts_outlined, size: 20, color: kblueColor),
                            const SizedBox(width: 20),
                            Expanded(child: Text(
                                _language.Account(),
                              style: const TextStyle(fontSize: 15,color: kblueColor,
                            )
                            ),
                            ),
                            const Icon(Icons.arrow_forward_ios, size: 15, color:kblueColor,),
                            const SizedBox(width: 7),

                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            const SizedBox(width: 50,),
                            Text(_language.tname(), style: TextStyle(fontSize: screenWidth / 50,color: kblack38,decoration: TextDecoration.underline)),
                            const SizedBox(width: 10),
                            Text(_language.tphone(), style: TextStyle(fontSize: screenWidth / 50,color: kblack38,decoration: TextDecoration.underline)),
                            const SizedBox(width: 10),
                            Text(_language.tpassword(), style: TextStyle(fontSize: screenWidth / 50,color: kblack38,decoration: TextDecoration.underline)),
                            const SizedBox(width: 10),
                            Text(_language.temail(), style: TextStyle(fontSize: screenWidth / 50,color: kblack38,decoration: TextDecoration.underline)),
                            const SizedBox(width: 10),
                            Text(_language.taddress(), style: TextStyle(fontSize: screenWidth / 50,color: kblack38,decoration: TextDecoration.underline)),
                            const SizedBox(width: 10),
                          ],
                        ),
                        const SizedBox(height: 5,),
                      ],
                    ) ,
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              // Material(
              //   color: Theme.of(context).brightness == Brightness.dark
              //       ?  Color.fromRGBO(41, 45, 33, 1)
              //       : kwhait,
              //   elevation: 3,
              //   borderRadius: BorderRadius.circular(5),
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //   child: InkWell(
              //     onTap: () async {
              //
              //       if (InitSharedPreferences.getNameUser() != null && InitSharedPreferences.getNameUser()!.isNotEmpty)
              //       {
              //         AwesomeDialog(
              //             dialogBackgroundColor: Theme.of(context).brightness == Brightness.dark
              //                 ?  Color.fromRGBO(41, 45, 33, 1)
              //                 : kwhait,
              //             context: context,
              //             dialogType: DialogType.question,
              //             animType: AnimType.topSlide,
              //             showCloseIcon: true,
              //             title: "??",
              //             desc: _language.tAlertTitleLogout(),
              //             btnOkColor: kblueColor,
              //             btnOkIcon: Icons.check,
              //             buttonsBorderRadius: BorderRadius.all(
              //                 Radius.circular(10)),
              //             btnOkOnPress: () async {
              //               await InitSharedPreferences.logOut();
              //               AwesomeDialog(
              //                 dialogBackgroundColor: Theme.of(context).brightness == Brightness.dark
              //                     ?  Color.fromRGBO(41, 45, 33, 1)
              //                     : kwhait,
              //                 context: context,
              //                 dialogType: DialogType.noHeader,
              //                 animType: AnimType.topSlide,
              //                 showCloseIcon: true,
              //                 title: _language.tAlertSuccess(),
              //                 desc: _language.tAlertDescrLogout(),
              //                 btnOkText: _language.tbtnYse(),
              //                 btnCancelText: _language.tbtnCancel(),
              //                 btnOkColor: kblueColor,
              //                 btnOkIcon: Icons.check,
              //                 buttonsBorderRadius: BorderRadius.all(
              //                     Radius.circular(10)),
              //                 btnOkOnPress: () async {
              //                   await InitSharedPreferences.logOut();
              //                 },
              //
              //               ).show();
              //             },
              //             btnCancelOnPress: () {}
              //         ).show();
              //       }
              //       else {
              //         AwesomeDialog(
              //           dialogBackgroundColor: Theme.of(context).brightness == Brightness.dark
              //               ?  Color.fromRGBO(41, 45, 33, 1)
              //               : kwhait,
              //           context: context,
              //           dialogType: DialogType.noHeader,
              //           animType: AnimType.topSlide,
              //           showCloseIcon: true,
              //           title: "!!!",
              //           desc: _language.tAlertAlreadyLogout(),
              //           btnOkText: _language.tbtnYse(),
              //           btnOkColor: kblueColor,
              //           btnOkIcon: Icons.check,
              //           buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
              //           btnOkOnPress: () async {
              //           },
              //
              //         ).show();
              //       }
              //
              //     },
              //
              //     child: Container(
              //       decoration:  BoxDecoration(
              //           border: Border(
              //             left:BorderSide(color: kblueColor,width: 5) ,)
              //       ),
              //       child:  Column(
              //         children: [
              //           SizedBox(height: 15,),
              //           Row(
              //             children: [
              //               SizedBox(width: 7),
              //               Icon(Icons.login_outlined, size: 20, color: kblueColor),
              //               SizedBox(width: 20),
              //               Expanded(child: Text(
              //                   _language.tlogout(),
              //                 style: TextStyle(fontSize: 15,color: kblueColor,
              //               )
              //               ),
              //               ),
              //               Icon(Icons.arrow_forward_ios, size: 15, color:kblueColor,),
              //               SizedBox(width: 7),
              //
              //             ],
              //           ),
              //           SizedBox(height: 15,),
              //         ],
              //       ) ,
              //     ),
              //   ),
              // ),
              // SizedBox(height: 20,),
              //
              // Material(
              //   color: Theme.of(context).brightness == Brightness.dark
              //       ?  Color.fromRGBO(41, 45, 33, 1)
              //       : kwhait,
              //   elevation: 3,
              //   borderRadius: BorderRadius.circular(5),
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //   child: InkWell(
              //     onTap: () {
              //       if (InitSharedPreferences.getNameUser() != null && InitSharedPreferences.getNameUser()!.isNotEmpty)
              //         AwesomeDialog(
              //           dialogBackgroundColor: Theme.of(context).brightness == Brightness.dark
              //               ?  Color.fromRGBO(41, 45, 33, 1)
              //               : kwhait,
              //           context: context,
              //           dialogType: DialogType.noHeader,
              //           animType: AnimType.topSlide,
              //           showCloseIcon: true,
              //           title: "!!!",
              //           desc: _language.tAlertAlreadylogin(),
              //           btnOkText: _language.tbtnYse(),
              //           btnOkColor: kblueColor,
              //           btnOkIcon: Icons.check,
              //           buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
              //           btnOkOnPress: () async {
              //           },
              //
              //         ).show();
              //       else {
              //         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Login()));
              //       }
              //     },
              //
              //     child: Container(
              //       decoration:  BoxDecoration(
              //           border: Border(
              //             left:BorderSide(color: kblueColor,width: 5) ,)
              //       ),
              //       child:  Column(
              //         children: [
              //           SizedBox(height: 15,),
              //           Row(
              //             children: [
              //               SizedBox(width: 7),
              //               Icon(Icons.login_outlined, size: 20, color: kblueColor),
              //               SizedBox(width: 20),
              //               Expanded(child: Text(
              //                   _language.tlogin(),
              //                 style: TextStyle(fontSize: 15,color: kblueColor,
              //               )
              //               ),
              //               ),
              //               Icon(Icons.arrow_forward_ios, size: 15, color:kblueColor,),
              //               SizedBox(width: 7),
              //
              //             ],
              //           ),
              //           SizedBox(height: 15,),
              //         ],
              //       ) ,
              //     ),
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );



  }
}



