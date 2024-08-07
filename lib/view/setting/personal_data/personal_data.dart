import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:keswaty/String_Extensions.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../navigationbar/nav.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({
    super.key,
  });

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  final Language _language = Language();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: language == 'AR' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromRGBO(33, 37, 25, 1)
            : const Color.fromRGBO(240, 242, 245, 1),
        appBar: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromRGBO(33, 37, 25, 1)
              : const Color.fromRGBO(240, 242, 245, 1),
          elevation: 0,
          title: Text(_language.tProfile(),
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? kwhait
                      : kblueColor,
                  fontSize: 15)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).brightness == Brightness.dark
                  ? kwhait
                  : kblueColor,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),

            // Consumer<UserProvider>(builder: (context, userdprov, child) {
            //   return userdprov.isloading ? Center(child: CircularProgressIndicator(),) :
            Expanded(
                flex: 5,
                child: ListView(
                  // reverse: true,
                  //   physics: BouncingScrollPhysics(),
                  // itemCount: userdprov.userlist.length,
                  // itemBuilder: (context, index) {
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Column(children: [
                          Container(
                            width: screenWidth,
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Column(
                              children: [
                                Material(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? const Color.fromRGBO(41, 45, 33, 1)
                                        : kwhait,
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(5),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Column(
                                      children: [
                                        Center(
                                            child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                // borderRadius: BorderRadius.only(
                                                //     bottomLeft: Radius.circular(65),
                                                //     topLeft: Radius.circular(65)),
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? kblueColor
                                                    : kblueColor,
                                              ),
                                              padding: const EdgeInsets.only(
                                                left: 0,
                                              ),
                                              margin: const EdgeInsets.only(
                                                  left: 0, top: 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Container(
                                                    width: 60.0,
                                                    height: 60.0,
                                                    margin:
                                                        const EdgeInsets.only(
                                                      top: 10.0,
                                                      bottom: 10.0,
                                                    ),
                                                    alignment: Alignment.center,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          kblack38
                                                              .withOpacity(0.5),
                                                          kblack38
                                                              .withOpacity(0.5),
                                                          kblack38
                                                              .withOpacity(0.5)
                                                        ],
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: kblack38,
                                                      // shape: BoxShape.circle,
                                                    ),
                                                    child: Text(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      InitSharedPreferences
                                                              .getNameUser()!
                                                          .substring(0, 1)
                                                          .toUpperCase(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize:
                                                            screenWidth / 20,
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? kwhait
                                                            : kwhait,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 15),
                                                  Column(
                                                    children: [
                                                      if (InitSharedPreferences
                                                                  .getNameUser() !=
                                                              null &&
                                                          InitSharedPreferences
                                                                  .getNameUser()!
                                                              .isNotEmpty)
                                                        SizedBox(
                                                          width:
                                                              screenWidth / 2,
                                                          child: Text(
                                                            InitSharedPreferences
                                                                .getNameUser()!,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  screenWidth /
                                                                      30,
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? kwhait
                                                                  : kwhait,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      //Text("Hassan alalie",style: TextStyle(color: kblack38,fontWeight: FontWeight.bold,fontSize: 20),),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 10),
                                                ],
                                              ),
                                            ),
                                            // SizedBox(height: 20,),
                                          ],
                                        )),
                                        Container(
                                          decoration: const BoxDecoration(
                                              // border: Border(
                                              //   left:BorderSide(color: kblueColor,width: 5) ,),
                                              ),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      const Icon(
                                                        Icons
                                                            .person_outline_sharp,
                                                        size: 20,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(_language.tNamee()),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      const SizedBox(width: 40),
                                                      if (InitSharedPreferences
                                                                  .getNameUser() !=
                                                              null &&
                                                          InitSharedPreferences
                                                                  .getNameUser()!
                                                              .isNotEmpty)
                                                        Text(
                                                          InitSharedPreferences
                                                              .getNameUser()!,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 13,
                                                                  color:
                                                                      kblack38),
                                                        )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              buildDivider(),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      const Icon(
                                                        Icons.phone_outlined,
                                                        size: 20,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(_language.tPhonee()),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      const SizedBox(width: 40),
                                                      if (InitSharedPreferences
                                                                  .getPhoneUser() !=
                                                              null &&
                                                          InitSharedPreferences
                                                                  .getPhoneUser()!
                                                              .isNotEmpty)
                                                        Text(
                                                          InitSharedPreferences
                                                                  .getPhoneUser()
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 13,
                                                                  color:
                                                                      kblack38),
                                                        )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              buildDivider(),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      const Icon(
                                                        Icons.email_outlined,
                                                        size: 20,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(_language.tEmaill()),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      const SizedBox(width: 40),
                                                      if (InitSharedPreferences
                                                                  .getEmailUser() !=
                                                              null &&
                                                          InitSharedPreferences
                                                                  .getEmailUser()!
                                                              .isNotEmpty)
                                                        Text(
                                                          InitSharedPreferences
                                                              .getEmailUser()!,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 13,
                                                                  color:
                                                                      kblack38),
                                                        )
                                                      //Text("hassan@gmail.com",style: TextStyle(fontSize: 13, color: kblack38)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              buildDivider(),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      const Icon(
                                                        Icons
                                                            .location_on_outlined,
                                                        size: 20,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(_language.tadress()),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      const SizedBox(width: 40),
                                                      if (InitSharedPreferences
                                                                  .getAddressUser() !=
                                                              null &&
                                                          InitSharedPreferences
                                                                  .getAddressUser()!
                                                              .isNotEmpty)
                                                        Text(
                                                            InitSharedPreferences
                                                                .getAddressUser()!,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color:
                                                                        kblack38))
                                                      //Text("sana'a al jaraf",style: TextStyle(fontSize: 13,color: kblack38)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const SizedBox(height: 16),
                          CupertinoButton(
                              color: const Color.fromARGB(200, 191, 40, 13),
                              child: Text(
                                _language.DeleteAccount(),
                              ),
                              onPressed: () async {
                                AwesomeDialog(
                                        dialogBackgroundColor:
                                            Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? const Color.fromRGBO(
                                                    41, 45, 33, 1)
                                                : kwhait,
                                        context: context,
                                        dialogType: DialogType.warning,
                                        animType: AnimType.topSlide,
                                        showCloseIcon: true,
                                        title: _language
                                            .tAlertTitleRemoveAccount(),
                                        desc:
                                            _language.tAlertDescRemoveAccount(),
                                        btnCancelColor: kblueColor,
                                        btnOkColor: kred,
                                        btnOkIcon: Icons.delete,
                                        buttonsBorderRadius:
                                            const BorderRadius.all(
                                                Radius.circular(10)),
                                        btnOkText: _language.tbremove(),
                                        btnOkOnPress: () async {
                                          final SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          final String? Email =
                                              prefs.getString('Email');
                                          final String? password =
                                              prefs.getString('password');
                                          print(Email);
                                          print(password);
                                          print(
                                              'https://keswaty.com/api/users/login?email=$Email&password=$password');

                                          final dio = Dio();

                                          final response = await dio
                                              .get(
                                                  'https://keswaty.com/api/users/remove?email=$Email&password=$password')
                                              .then(
                                            (value) async {
                                              print(value.toString());
                                              print("####");
                                              print(value.toString() ==
                                                  'deleted');
                                              if (value.toString() ==
                                                  'deleted') {
                                                // await InitSharedPreferences.logOut();
                                                // await InitSharedPreferences.logOut();

                                                AwesomeDialog(
                                                  dialogBackgroundColor: Theme.of(context).brightness == Brightness.dark? const Color.fromRGBO( 41, 45, 33, 1)
                                                      : kwhait,
                                                  context: context,
                                                  dialogType:DialogType.noHeader,
                                                  animType: AnimType.topSlide,
                                                  showCloseIcon: false,
                                                  title: _language.tAlertSuccess(),
                                                  desc: _language.tAlertDescrDeleteLogout(),
                                                  btnOkColor: kblueColor,
                                                  btnOkIcon: Icons.check,
                                                  buttonsBorderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  btnOkOnPress: () async {
                                                    Get.offAll(const nav());
                                                    await InitSharedPreferences.logOut();

                                                    // setState(() {});
                                                  },
                                                  btnOkText:
                                                      _language.tbtnYse(),
                                                ).show();
                                              } else {
                                                AwesomeDialog(
                                                  dialogBackgroundColor: Theme
                                                                  .of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? const Color.fromRGBO(
                                                          41, 45, 33, 1)
                                                      : kwhait,
                                                  context: context,
                                                  dialogType:
                                                      DialogType.noHeader,
                                                  animType: AnimType.topSlide,
                                                  showCloseIcon: false,
                                                  title:
                                                      _language.tAlertError(),
                                                  desc: _language
                                                      .tAlertDescrError(),
                                                  btnOkColor: kblueColor,
                                                  btnOkIcon: Icons.check,
                                                  buttonsBorderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  btnOkOnPress: () async {

                                                  },
                                                  btnOkText:
                                                      _language.tbtnOk_yes(),
                                                ).show();
                                              }
                                            },
                                          ).catchError((e){
                                            print(e.toString());

                                            AwesomeDialog(
                                              dialogBackgroundColor: Theme
                                                  .of(context)
                                                  .brightness ==
                                                  Brightness.dark
                                                  ? const Color.fromRGBO(
                                                  41, 45, 33, 1)
                                                  : kwhait,
                                              context: context,
                                              dialogType:
                                              DialogType.noHeader,
                                              animType: AnimType.topSlide,
                                              showCloseIcon: false,
                                              title:
                                              _language.tAlertError(),
                                              desc: _language
                                                  .tAlertDescrError(),
                                              btnOkColor: kblueColor,
                                              btnOkIcon: Icons.check,
                                              buttonsBorderRadius:
                                              const BorderRadius.all(
                                                  Radius.circular(10)),
                                              btnOkOnPress: () async {

                                              },
                                              btnOkText:
                                              _language.tbtnOk_yes(),
                                            ).show();

                                          });
                                          setState(() {});
                                        },
                                        btnCancelOnPress: () {},
                                        btnCancelText: _language.tbtnCancel())
                                    .show();

                                // print(response.data.toString());
                                // The below request is the same as above.

                                // print(response.data.toString());
                              }),
                        ]),
                      ],
                    ))
                  ],
                )),

            // }
            // )
          ],
        ),
      ),
    );
  }
}
