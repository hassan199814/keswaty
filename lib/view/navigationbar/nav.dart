import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/main.dart';
import 'package:keswaty/view/Login_Resiter/Login/login.dart';
import 'package:keswaty/view/Login_Resiter/Sgin_up/sgin_up.dart';
import 'package:keswaty/view/Main/mainpage.dart';
import 'package:keswaty/view/about_project/About_project.dart';
import 'package:keswaty/view/donation/add_baskets_page.dart';
import 'package:keswaty/view/donation/donation_bskt_page.dart';
import 'package:keswaty/view/feedback/feedback_page.dart';
import 'package:keswaty/view/help/help.dart';
import 'package:keswaty/view/menus/Menus.dart';
import 'package:keswaty/view/setting/personal_data/personal_data.dart';
import 'package:keswaty/view/setting/setting_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


class nav extends StatefulWidget {
  const nav({super.key,});

  @override
  State<nav> createState() => _navState();
}

class _navState extends State<nav> {

  final _advancedDrawerController = AdvancedDrawerController();

  String page = 'Home';

  final Language _language = Language();

  static var _currentIndex = 0;

  var index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: language == 'AR' ? TextDirection.rtl: TextDirection.ltr,
      child: AdvancedDrawer(
        backdrop: Container(
      width: 10,
          decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ?  const Color.fromRGBO(33, 37, 25, 1)
                  :  kwhait,

          ),
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.ease,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: language == 'AR' ? true : false,

        // openScale: 1.0,
        disabledGestures: false,

        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),

        drawer: Directionality(
          textDirection: language == 'AR' ? TextDirection.rtl: TextDirection.ltr,

          child:

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        SingleChildScrollView(
                          child: Column(

                            children: [
                              const SizedBox(height: 60),
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    if (InitSharedPreferences.getNameUser() != null &&
                                        InitSharedPreferences.getNameUser()!.isNotEmpty) {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PersonalData()));
                                    } else {
                                      AwesomeDialog(
                                          dialogBackgroundColor:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                              ? const Color.fromRGBO(41, 45, 33, 1)
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
                                          buttonsBorderRadius:
                                          const BorderRadius.all(Radius.circular(10)),
                                          btnOkOnPress: () {
                                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Login()));
                                          },
                                          btnCancelOnPress: () {})
                                          .show();
                                    }
                                  },
                                  child: Center(
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(left: 0,),
                                            margin: const EdgeInsets.only(left: 0, top: 0),
                                            child: Row(
                                              children: [

                                                Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  margin: const EdgeInsets.only(
                                                    top: 10.0,
                                                    bottom: 10.0,
                                                    right: 10.0,
                                                    left: 10.0
                                                  ),
                                                  alignment: Alignment.center,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end: Alignment.bottomRight,
                                                      colors: [
                                                        kblack38.withOpacity(0.5),
                                                        kblack38.withOpacity(0.5),
                                                        kblack38.withOpacity(0.5)
                                                      ],
                                                    ),
                                                    borderRadius: BorderRadius.circular(15),
                                                    color: kblack38,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      if (InitSharedPreferences.getNameUser() != null && InitSharedPreferences.getNameUser()!.isNotEmpty)
                                                        Text(
                                                            InitSharedPreferences.getNameUser()!.substring(0, 1).toUpperCase(),
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              fontSize: screenWidth / 20,
                                                              color: Theme.of(context).brightness == Brightness.dark
                                                                  ? kwhait
                                                                  : kblueColor,
                                                            ))
                                                    ],
                                                  ),
                                                ),

                                                Column(
                                                  children: [
                                                    Container(
                                                      // width: 200,
                                                      child:
                                                      Row(
                                                        children: [
                                                          if (InitSharedPreferences.getNameUser() != null &&
                                                              InitSharedPreferences.getNameUser()!.isNotEmpty)
                                                            SizedBox(
                                                              width: screenWidth / 2,
                                                              child: Text(InitSharedPreferences.getNameUser()!,
                                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth / 30, color:
                                                                  Theme.of(context).brightness == Brightness.dark
                                                                      ? kwhait
                                                                      : kblack,
                                                                  ),
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            )
                                                          else
                                                            SizedBox(
                                                              // width: 100,
                                                              child: Text(
                                                                _language.tNousers(),
                                                                style: TextStyle(
                                                                    color: Theme.of(context)
                                                                        .brightness ==
                                                                        Brightness.dark
                                                                        ? kwhait
                                                                        : kblack),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [

                                                        if (InitSharedPreferences.getEmailUser() != null &&
                                                            InitSharedPreferences.getEmailUser()!.isNotEmpty)
                                                          SizedBox(
                                                            width: screenWidth / 2,
                                                            child: Text(
                                                              overflow: TextOverflow.ellipsis,
                                                              InitSharedPreferences
                                                                  .getEmailUser()!,
                                                              style: TextStyle(
                                                                fontSize: screenWidth / 35,
                                                                color: Theme.of(context)
                                                                    .brightness ==
                                                                    Brightness.dark
                                                                    ? kwhait
                                                                    : kblueColor,
                                                              ),
                                                            ),
                                                          )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                // SizedBox(width: 10),
                                              ],
                                            ),
                                          ),
                                          // SizedBox(height: 20,),
                                        ],
                                      )),
                                ),
                              ),

                              Divider(color:
                              Theme.of(context).brightness ==
                                  Brightness.dark
                                  ? kwhait
                                  : kblueColor
                              ),

                              ListTile(
                                    onTap: () {
                                      if (InitSharedPreferences.getNameUser() != null &&
                                          InitSharedPreferences.getNameUser()!.isNotEmpty) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (_) => const FeedbackPage()));
                                      } else {
                                        AwesomeDialog(
                                            dialogBackgroundColor:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                                ? const Color.fromRGBO(41, 45, 33, 1)
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
                                            buttonsBorderRadius:
                                            const BorderRadius.all(Radius.circular(10)),
                                            btnOkOnPress: () {
                                              Navigator.of(context).pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (_) => const SginUpPage()));
                                            },
                                            btnCancelOnPress: () {})
                                            .show();
                                      }
                                    },
                                    leading: Icon(Icons.chat_bubble_outline,
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? kwhait
                                            : kblueColor),
                                    title: Text(_language.tFeedback(),style:TextStyle(
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? kwhait
                                            : kblueColor,
                                        fontWeight: FontWeight.bold),),
                                  ),
                              ListTile(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SettingPage()));
                                    },
                                    leading: Icon(EvaIcons.settings_outline,
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? kwhait
                                            : kblueColor),
                                    title: Text(_language.tSettings(),style:TextStyle(
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? kwhait
                                            : kblueColor,
                                        fontWeight: FontWeight.bold),),
                                  ),
                              ListTile(
                                    onTap: () {

                                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HelpPage()));
                                    },
                                    leading: Icon(Icons.question_mark,
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? kwhait
                                            : kblueColor),
                                    title: Text(_language.help(),style:TextStyle(
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? kwhait
                                            : kblueColor,
                                        fontWeight: FontWeight.bold),
                                    ),
                                  ),
                              ListTile(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const aboutpro()));
                                      },

                                    leading: Icon(Icons.info_outline,
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? kwhait
                                            : kblueColor),
                                    title: Text(_language.taboutapp(),style:TextStyle(
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? kwhait
                                            : kblueColor,
                                        fontWeight: FontWeight.bold),
                                    ),
                                  ),
                              ListTile(
                                  onTap: () async {
                                    if (InitSharedPreferences.getNameUser() != null &&
                                        InitSharedPreferences.getNameUser()!.isNotEmpty) {
                                      AwesomeDialog(
                                          dialogBackgroundColor:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                              ? const Color.fromRGBO(41, 45, 33, 1)
                                              : kwhait,
                                          context: context,
                                          dialogType: DialogType.question,
                                          animType: AnimType.topSlide,
                                          showCloseIcon: true,
                                          title: "??",
                                          desc: _language.tAlertTitleLogout(),
                                          btnOkColor: kblueColor,
                                          btnOkIcon: Icons.check,
                                          buttonsBorderRadius:
                                          const BorderRadius.all(Radius.circular(10)),
                                          btnOkText: _language.tbtnYse(),
                                          btnOkOnPress: () async {
                                            await InitSharedPreferences.logOut();
                                            AwesomeDialog(
                                              dialogBackgroundColor:
                                              Theme.of(context).brightness ==
                                                  Brightness.dark
                                                  ? const Color.fromRGBO(41, 45, 33, 1)
                                                  : kwhait,
                                              context: context,
                                              dialogType: DialogType.noHeader,
                                              animType: AnimType.topSlide,
                                              showCloseIcon: true,
                                              title: _language.tAlertSuccess(),
                                              desc: _language.tAlertDescrLogout(),
                                              btnOkColor: kblueColor,
                                              btnOkIcon: Icons.check,
                                              buttonsBorderRadius:
                                              const BorderRadius.all(Radius.circular(10)),
                                              btnOkOnPress: () async {
                                                await InitSharedPreferences.logOut();
                                                setState(() {});
                                              },
                                              btnOkText: _language.tbtnYse(),
                                            ).show();
                                          },
                                          btnCancelOnPress: () {},
                                          btnCancelText: _language.tbtnCancel())
                                          .show();
                                    } else {
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const Login()));
                                    }
                                  },
                                  leading: Icon(
                                      InitSharedPreferences.getID() == null
                                          ? BoxIcons.bx_log_in_circle
                                          : BoxIcons.bx_log_out_circle,
                                      color: Theme.of(context).brightness == Brightness.dark
                                          ? kwhait
                                          : kblueColor),
                                  title: Text(
                                      InitSharedPreferences.getID() == null
                                          ? _language.tlogin()
                                          : _language.tlogout()
                                      ,
                                      style: const TextStyle(color: kblueColor,fontWeight: FontWeight.bold))
                              ),


                            ],
                          ),
                        ),

                        Column(
                          children: [
                            Text(_language.trights(),textAlign: TextAlign.center,style: const TextStyle(
                                color: kblack38,fontSize: 12
                            )),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ],
                    ),




        ),

        child: Scaffold(

          appBar: AppBar(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromRGBO(33, 37, 25, 1)
                : const Color.fromRGBO(240, 242, 245, 1),
            elevation: 0,
            title: Center(
              child:

      _currentIndex == 0 ?Text(_language.tHome(),style: TextStyle(color: Theme.of(context).brightness == Brightness.dark? kwhait: kblueColor,fontSize: 20,fontWeight: FontWeight.bold)):

      _currentIndex == 1 ? Text("",style: TextStyle(color: Theme.of(context).brightness == Brightness.dark? kwhait: kblueColor,fontSize: 20,fontWeight: FontWeight.bold)):

      _currentIndex == 2 ? Text("",style: TextStyle(color: Theme.of(context).brightness == Brightness.dark? kwhait: kblueColor,fontSize: 20,fontWeight: FontWeight.bold)):

       Text(_language.Menus(),style: TextStyle(color: Theme.of(context).brightness == Brightness.dark? kwhait: kblueColor,fontSize: 20,fontWeight: FontWeight.bold))


      ),
            leading:
            _currentIndex != 1 ?
            IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? kwhait
                          : kblueColor,
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ):
                const SizedBox(),


            actions: [

              _currentIndex == 2 ?
              InkWell(
                focusColor: kblueColor,
                onTap: (){
                  InitSharedPreferences.getID()==null?
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      animType: AnimType.topSlide,
                      showCloseIcon: true,
                      // title: _language.tAlert(),
                      desc: _language.tAlertinfor(),
                      btnOkText: _language.tbtnYse(),
                      btnOkColor: kblueColor,

                      buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
                      btnOkOnPress: (){
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Login()));
                      },
                    btnCancelOnPress: (){}
                  ).show():

                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddBasketsPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(
                    right: language == 'AR' ? 0 : 10 ,
                    left: language == 'AR' ? 10 : 0
                  ),
                 height: 35,
                  decoration: BoxDecoration(
                    color: kblueColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 5,),
                      Text(_currentIndex == 2?
                      _language.Createreceiptrequest() : "",
                        style: TextStyle(
                            color: kwhait,
                            fontWeight: FontWeight.bold,fontSize: screenWidth / 30
                        ),
                      ),
                      const SizedBox(width: 5,),
                    ],
                  ),
                ),
              ):
                  const SizedBox()
            ],
          ),
          // _pages[_currentIndex],
          extendBody: true,

          bottomNavigationBar: SalomonBottomBar(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromRGBO(33, 37, 25, 1)
                : const Color.fromRGBO(240, 242, 245, 1),


            selectedItemColor: kblueColor,
            // selectedColorOpacity: 5.0,

            currentIndex: _currentIndex,

            onTap: (id) {
              setState(() {
                _currentIndex = id;
              });
            },
            // setState(() => _currentIndex = id),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon:
                  _currentIndex == 0 ?Icon(Icons.home,size:  screenWidth / 15,):
                  Icon(Icons.home_outlined,size:  screenWidth / 15,),
                title: Text(_language.tHome(),style: TextStyle(fontSize: screenWidth / 30)),
                // selectedColor: kblueColor,
              ),
              SalomonBottomBarItem(
                icon:
                _currentIndex == 1 ? Icon(MingCute.truck_fill,size:  screenWidth / 15):
                Icon(MingCute.truck_line,size:  screenWidth / 15),

                title: Text(_language.Createreceiptrequest(),style: TextStyle(fontSize: screenWidth / 30)),
                // selectedColor: kblueColor,
              ),
              /// Donations
              SalomonBottomBarItem(
                icon:
                  _currentIndex == 2 ? Icon(MingCute.hand_heart_fill,size:  screenWidth / 15):
                    Icon(MingCute.hand_heart_line,size:  screenWidth / 15),

                title: Text(_language.MyDonations(),style: TextStyle(fontSize: screenWidth / 30)),
                // selectedColor: kblueColor,
              ),


              /// Menus
              SalomonBottomBarItem(
                icon:
                _currentIndex == 3 ? Icon(BoxIcons.bx_grid_horizontal,size:  screenWidth / 15):
                Icon(BoxIcons.bx_grid_horizontal,size:  screenWidth / 15),
                title: Text(_language.Menus(),style: TextStyle(fontSize: screenWidth / 30)),
              ),

              /// Profile

            ],
          ),

          body:

              Builder(
            builder: (context) {
              switch (_currentIndex) {
                case 0:
                  return Container(child: const MainPage());
                case 1:
                  if(InitSharedPreferences.getNameUser()!=null){
                    return Container(child: AddBasketsPage());
                  } return Container(child: const Login());

                case 2:
                  return Container(child: donation());


                case 3:
                   // if(InitSharedPreferences.getNameUser()!=null)
                  return Container(child: const Menus());

                default:
                  return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
