import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/main.dart';
import 'package:keswaty/view/Login_Resiter/Login/login.dart';
import 'package:keswaty/view/feedback/feedback_page.dart';


class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {

  Language _language = Language();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return  Directionality(
      textDirection: language == 'AR' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
          backgroundColor:
          Theme.of(context).brightness == Brightness.dark
              ?  Color.fromRGBO(33, 37, 25, 1)
              :  Color.fromRGBO(240, 242, 245, 1),

          appBar: AppBar(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ?  Color.fromRGBO(33, 37, 25, 1)
                :  Color.fromRGBO(240, 242, 245, 1),
            elevation: 0,

            leading: IconButton(
              onPressed: (){Navigator.pop(context);},
              icon: Icon( Icons.arrow_back,
                  color:Theme.of(context).brightness == Brightness.dark
                      ?  kwhait
                      :  kblueColor),),),

          body:ListView(
            padding: EdgeInsets.all(8.0),
            children: [
              SizedBox(height: 40),


              Container(
                    child: Text(_language.helptitle(),style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                  ),

              SizedBox(height: 40),

              Container(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    // padding: EdgeInsets.only(bottom: 70),


                    child:
                    GridView.count(
                      padding: const EdgeInsets.all(20),
                      crossAxisCount: 2,
                      childAspectRatio: 1.5 / 1,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 20,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // childAspectRatio: 10,
                      // mainAxisSpacing: 10,

                      children: [

                        InkWell(
                          onTap: (){
                            InitSharedPreferences.getID()==null?
                            AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.topSlide,
                                showCloseIcon: true,
                                desc: _language.tAlertinfor(),
                                btnOkText: _language.tbtnYse(),
                                btnOkColor: kblueColor,

                                buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                                btnOkOnPress: (){
                                  FocusScope.of(context).unfocus();
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Login()));
                                },
                                btnCancelOnPress: (){}
                            ).show():
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => FeedbackPage()));
                          },
                          child: Material(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ?  Color.fromRGBO(41, 45, 33, 1)
                                  : kwhait,
                              elevation: 3,
                              borderRadius: BorderRadius.circular(15),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      hoverColor: greenColor,
                                      onTap: (){
                                        InitSharedPreferences.getID()==null?
                                        AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.info,
                                            animType: AnimType.topSlide,
                                            showCloseIcon: true,
                                            desc: _language.tAlertinfor(),
                                            btnOkText: _language.tbtnYse(),
                                            btnOkColor: kblueColor,

                                            buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                                            btnOkOnPress: (){
                                              FocusScope.of(context).unfocus();
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Login()));
                                            },
                                            btnCancelOnPress: (){}
                                        ).show():
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (_) => FeedbackPage()));
                                      },
                                      child: Column(
                                        children: [


                                            Icon(FontAwesome.headset_solid,size: screenWidth / 10, color:kblueColor, ),

                                          Text(
                                            _language.tFeedback(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                                          ),

                                        ],
                                      )


                                  ),


                                ],
                              )
                          ),
                        ),
                        InkWell(
                          onTap: (){
                          },
                          child: Material(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ?  Color.fromRGBO(41, 45, 33, 1)
                                  : kwhait,
                              elevation: 3,
                              borderRadius: BorderRadius.circular(15),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      hoverColor: greenColor,
                                      onTap: (){
                                      },
                                      child: Column(
                                        children: [
                                          Icon(Icons.privacy_tip_outlined, color:kblueColor,size: screenWidth/10, ),
                                          Text(
                                            _language.privacypolicy(),style: TextStyle(fontSize: screenWidth/25,color: kblueColor),
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                  )
              )
            ],
          )
      ),
    );
  }
}
