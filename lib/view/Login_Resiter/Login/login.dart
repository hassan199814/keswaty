import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:keswaty/String_Extensions.dart';
import 'package:keswaty/Widgets/DefaultButton.dart';
import 'package:keswaty/Widgets/Email_field.dart';
import 'package:keswaty/Widgets/PassWord_field.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/controller/Reset_Account_Provider.dart';
import 'package:keswaty/controller/login_provider.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/main.dart';
import 'package:keswaty/view/Login_Resiter/Forget_Password/ForgetPasswordPage.dart';
import 'package:keswaty/view/Login_Resiter/Forget_Password/ForgetPasswordWidgets/NoAccountText.dart';
import 'package:keswaty/view/navigationbar/nav.dart';
import 'package:provider/provider.dart';

import '../Sgin_up/sgin_up.dart';





class Login extends StatefulWidget {
    Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  final _formkey = GlobalKey<FormState>();
  final List<String> errors =[];
  TextEditingController emailcontroller = TextEditingController() ;
  TextEditingController passwordcontroller = TextEditingController() ;
  late String email;
  late String password;
  bool remember = false;

  Language _language = Language();
  @override


  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return   Directionality(
      textDirection: language == 'AR' ? TextDirection.rtl : TextDirection.ltr,

      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:
        Theme.of(context).brightness == Brightness.dark
            ?  const Color.fromRGBO(33, 37, 25, 1)
            :  const Color.fromRGBO(240, 242, 245, 1),

        appBar: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ?  const Color.fromRGBO(33, 37, 25, 1)
              :  const Color.fromRGBO(240, 242, 245, 1),
          elevation: 0,
          title:  Text(_language.tWelcomBack(),
              style: TextStyle(
                color:Theme.of(context).brightness == Brightness.dark
                    ?  Colors.transparent
                    :  Colors.transparent,
                fontSize: 15,)),
          leading: IconButton(
            onPressed: (){},
            icon: Icon( Icons.arrow_back,
              color:Theme.of(context).brightness == Brightness.dark
                  ?  Colors.transparent
                  :  Colors.transparent,

            ),
          ),
        ),

        body: Consumer<ResetAccountProvider>(builder: (context, resetAccountPro, child) {
          return resetAccountPro.isloading
              ? Center(
            child: CircularProgressIndicator(),
          )
              :
          ListView(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(


                      scrollDirection: Axis.vertical,
                     child: SizedBox(
                       height: MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [

                          const SizedBox(height: 20,),
                          Text(
                              _language.tWelcomBack(),
                              textAlign: TextAlign.center,
                              style: headingStyle
                          ),
                          const SizedBox(height: 5,),
                          Text(
                              _language.tSgininwithyouremail(),
                              textAlign: TextAlign.center,
                              style: TextStyleGray
                          ),
                          Form(
                            key: _formkey,
                            child: Column(
                                children: [
                                  const SizedBox(height: 60),
                                  SizedBox(
                                      width: screenWidth,

                                      //-------------------------============================================----------------------------------------------------
                                      child: EmailField(
                                        controller1: emailcontroller,
                                      )
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                      width: screenWidth,

                                      //-------------------------============================================----------------------------------------------------

                                      child: PassWordField(
                                        controller1: passwordcontroller,
                                      )
                                  ),
                                  const SizedBox(height: 0),
                                  Row(
                                    children: [

                                      const SizedBox(width: 20),
                                      GestureDetector(
                                        onTap: ()=>  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const ForgetPasswordPage())),
                                        child: Text(

                                          _language.tForgetPassword(),
                                          style: const TextStyle(
                                              decoration: TextDecoration.underline,
                                              color: kblack38
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                  Consumer<LoginProvider>(builder: (context,loginpro,child) {
                                    return loginpro.isloading ? const Center(child: CircularProgressIndicator(),) :
                                    SizedBox(
                                        width: screenWidth,
                                        child: DefaultButton(
                                          bkground: kblueColor,
                                          press: () async {
                                            if (_formkey.currentState!.validate()) {
                                              _formkey.currentState!.save();
                                              setState(() async{
                                                await Provider.of<ResetAccountProvider>(context, listen: false).login(emailcontroller.text);
                                                if(resetAccountPro.userlist3.isNotEmpty){
                                                  if(resetAccountPro.userlist3.last.password.toString()==passwordcontroller.text.toString()){

                                                    AwesomeDialog(
                                                      dialogBackgroundColor: Theme.of(context).brightness == Brightness.dark
                                                          ? Color.fromRGBO(41, 45, 33, 1)
                                                          : kwhait,
                                                      context: context,
                                                      dialogType: DialogType.noHeader,
                                                      animType: AnimType.topSlide,
                                                      showCloseIcon: true,
                                                      title: _language.tHello(),
                                                      desc: _language.tWelcome() + InitSharedPreferences.getNameUser()!,
                                                      descTextStyle: TextStyle(
                                                          fontWeight: FontWeight.bold),
                                                      btnOkOnPress: () {
                                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>nav()));
                                                      },
                                                      btnOkColor: kblueColor,
                                                      btnOkIcon: Icons.check_circle,
                                                    ).show();

                                                  }else {
                                                    AwesomeDialog(
                                                        context: context,
                                                        dialogType: DialogType
                                                            .error,
                                                        animType: AnimType
                                                            .topSlide,
                                                        showCloseIcon: true,
                                                        // title: _language.tAlertUnCompleted(),
                                                        desc: _language
                                                            .wrongpass(),
                                                        btnOkText: _language
                                                            .tbtnYse(),
                                                        btnOkColor: kblueColor,
                                                        btnOkIcon: Icons
                                                            .check,
                                                        buttonsBorderRadius: BorderRadius
                                                            .all(
                                                            Radius.circular(
                                                                10)),
                                                        btnOkOnPress: () {

                                                        }
                                                    ).show();
                                                  }
                                                }else{
                                                  AwesomeDialog(
                                                      context: context,
                                                      dialogType: DialogType.error,
                                                      animType: AnimType.topSlide,
                                                      showCloseIcon: true,
                                                      // title: _language.tAlertUnCompleted(),
                                                      desc: _language.wrongemail(),
                                                      btnOkText: _language.tbtnYse(),
                                                      btnOkColor: kblueColor,
                                                      btnOkIcon: Icons.check,
                                                      buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                                                      btnOkOnPress: (){

                                                      }
                                                  ).show();
                                                }
                                              });


                                            }
                                          },
                                          text: _language.tlogin(),
                                          txtstyle: const TextStyle(fontSize: 17,color: kwhait),
                                          icon: const Icon(Icons.login, color: kwhait),)
                                    );

                                  })

                                ]
                            ),
                          ),

                          const SizedBox(height: 10,)
                      ,
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Text(
                                 _language.donthaveaccount(),style: const TextStyle(fontSize: 15,color: kblack38),textAlign: TextAlign.center,
                               ),
                               GestureDetector(
                                 onTap: ()=> {

                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SginUpPage(),))
                                 },
                                 child:Text(
                                   _language.signup(),style: const TextStyle(fontSize: 15,color: kblueColor),
                                 ),
                               ),
                             ],
                           ),


                          // SizedBox(height: 40),
                        ],
                       ),
                     ),
                    ),
                  ),
                ),
              ]
          );
        }
        )
      ),
    );
  }
}

