import 'package:flutter/material.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/main.dart';
import 'package:keswaty/view/about_project/About_project.dart';
import 'package:keswaty/view/navigationbar/nav.dart';

import 'package:shared_preferences/shared_preferences.dart';


class GeneralSetting extends StatefulWidget {
  const GeneralSetting({super.key});

  @override
  State<GeneralSetting> createState() => _GeneralSettingState();
}

class _GeneralSettingState extends State<GeneralSetting> {

  final Language _language = Language();
  final List<String> _languages = ['AR', 'EN'];
  String? _selectedLanguage;
  bool _darkMode = false;
  final bool _natification = false;


  @override
  void initState(){
    super.initState();
    // getSeletedPref();
    setState(() => _language.getLanguage());
    setState(() => _darkMode = darkMode);
  }
  @override
  Widget build(BuildContext context) {
    var selected = true;
    return
      Directionality(
        textDirection: language == 'AR' ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          backgroundColor:
          Theme.of(context).brightness == Brightness.dark
              ?  const Color.fromRGBO(33, 37, 25, 1)
              :  const Color.fromRGBO(240, 242, 245, 1),

          appBar: AppBar(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ?  const Color.fromRGBO(33, 37, 25, 1)
                :  const Color.fromRGBO(240, 242, 245, 1),
            elevation: 0,
            title:  Text(_language.tGeneralsetting(),
                style: TextStyle(
                    color:Theme.of(context).brightness == Brightness.dark
                        ?  kwhait
                        :  kblueColor,
                    fontSize: 15)),
            leading: IconButton(
              onPressed: (){Navigator.pop(context);},
              icon: Icon( Icons.arrow_back,
                color:Theme.of(context).brightness == Brightness.dark
                    ?  kwhait
                    :  kblueColor,
              ),
            ),
          ),
        body: ListView(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(right: 10,left: 10),
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
                        // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=>GeneralSetting())),
                        child: Container(
                          // height: 60,
                          child:  Column(
                            children: [
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  const SizedBox(width: 7),
                                  const Icon(Icons.language, size: 20, color: kblueColor),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                        _language.tLanguageSwitch(),
                                        style: const TextStyle(fontSize: 15,color: kblueColor,
                                        )
                                    ),
                                  ),
                                  Material(
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(5),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: InkWell(
                                      // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=>GeneralSetting())),
                                      child:
                                      Container(
                                        // height: 60,
                                        child:  Column(
                                          children: [

                                            const SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                const SizedBox(width: 7),
                                                SizedBox(
                                                  width: 60,
                                                  height: 30,
                                                  child:
                                                  DropdownButton(
                                                    underline: const SizedBox(),
                                                      hint: Text(_language.tLanguage()),
                                                      value: _selectedLanguage,
                                                      onChanged: (newValue) async {
                                                        SharedPreferences pref = await
                                                        SharedPreferences.getInstance();
                                                        pref.setString('language', newValue.toString());
                                                        _language.setLanguage(newValue.toString());
                                                        language = newValue.toString();
                                                        setState(() {
                                                          _selectedLanguage = newValue.toString();
                                                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>const nav()),(route) => false,);
                                                        });

                                                      },
                                                      items: _languages.map((lang){
                                                        return DropdownMenuItem(value: lang,child: Text(lang),
                                                        );
                                                      }).toList()),
                                                ),

                                               const SizedBox(width: 7),

                                              ],
                                            ),

                                            const SizedBox(height: 5,),
                                          ],
                                        ) ,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 7),
                                ],
                              ),

                              const SizedBox(height: 10,),
                            ],
                          ) ,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Material(
                    //   color: Theme.of(context).brightness == Brightness.dark
                    //       ?  Color.fromRGBO(41, 45, 33, 1)
                    //       : kwhait,
                    //   elevation: 2,
                    //   borderRadius: BorderRadius.circular(5),
                    //   clipBehavior: Clip.antiAliasWithSaveLayer,
                    //   child: InkWell(
                    //     // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=>GeneralSetting())),
                    //     child: Container(
                    //
                    //       child:  Column(
                    //         children: [
                    //           SizedBox(height: 10,),
                    //           Row(
                    //             children: [
                    //               SizedBox(width: 7),
                    //               Icon(
                    //                 Theme.of(context).brightness == Brightness.dark
                    //                     ? Icons.dark_mode_outlined
                    //                     : Icons.light_mode_outlined, size: 20, color: kblueColor),
                    //
                    //               SizedBox(width: 20),
                    //               Expanded(
                    //                 child: Text(
                    //                     _language.tdarkLightMode(),
                    //                     style: TextStyle(fontSize: 15,color: kblueColor,
                    //                     )
                    //                 ),
                    //               ),
                    //
                    //                 IconButton(
                    //                     icon: Icon(
                    //                       selected ? Icons.dark_mode : Icons.light_mode,
                    //                     ),
                    //                     onPressed: () {
                    //
                    //                       if (Get.isDarkMode){
                    //
                    //                         Get.changeTheme(ThemeData.light(),);
                    //                         Get.snackbar(_language.theme(), _language.lighttheme());
                    //
                    //                       }
                    //                       else {
                    //                         Get.changeTheme(ThemeData.dark());
                    //                         Get.snackbar(_language.theme(), _language.darktheme());
                    //                       }
                    //
                    //                     }),
                    //
                    //
                    //              // ElevatedButton(
                    //              //   style: ElevatedButton.styleFrom(shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3))),
                    //              //     onPressed: (){
                    //              //   Get.bottomSheet(
                    //              //     Container(
                    //              //       child: Wrap(
                    //              //         children:  [
                    //              //           ListTile(
                    //              //             leading: Icon(Icons.wb_incandescent),
                    //              //             title: Text(_language.lighttheme()),
                    //              //             onTap: (){
                    //              //               Get.changeTheme(ThemeData.light());
                    //              //                Get.snackbar(_language.theme(), _language.lighttheme());
                    //              //
                    //              //             },
                    //              //           ),
                    //              //           ListTile(
                    //              //             leading: Icon(Icons.wb_incandescent_outlined),
                    //              //             title: Text(_language.darktheme()),
                    //              //             onTap: (){
                    //              //               Get.changeTheme(ThemeData.dark());
                    //              //               Get.snackbar(_language.theme(), _language.darktheme());
                    //              //             },
                    //              //           ),
                    //              //         ],
                    //              //       ),
                    //              //     )
                    //              //   );
                    //              // },
                    //              //     child: Text(_language.theme()),
                    //              //
                    //              // ),
                    //
                    //               SizedBox(width: 7),
                    //
                    //             ],
                    //           ),
                    //
                    //           SizedBox(height: 10,),
                    //         ],
                    //       ) ,
                    //     ),
                    //   ),
                    // ),

                    // SizedBox(height: 20,),
                    Material(
                      color: Theme.of(context).brightness == Brightness.dark
                          ?  const Color.fromRGBO(41, 45, 33, 1)
                          : kwhait,
                      elevation: 2,
                      borderRadius: BorderRadius.circular(5),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                         onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const aboutpro())),
                        child: Container(

                          child:  Column(
                            children: [
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const SizedBox(width: 7),
                                  Icon(Icons.adb,
                                      color: Theme.of(context).brightness == Brightness.dark
                                        ? kblueColor
                                        : kblueColor),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                        _language.taboutapp(),
                                        style: const TextStyle(fontSize: 15,color: kblueColor,
                                        )
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15,),
                            ],
                          ) ,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SettingPageBody(),
              const SizedBox(height: 20),

            ]
        ),


            ),
      );


  }
// getSeletedPref() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   setState((){
//     _selectedLanguage = pref.getString('language')!;
//     _darkMode = pref.getBool('darkMode')!;
//     _natification = pref.getBool('natification')!;
//   });
//
//
// }

}

