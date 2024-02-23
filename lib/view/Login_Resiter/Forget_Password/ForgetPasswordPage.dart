import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:keswaty/String_Extensions.dart';
import 'package:keswaty/Widgets/DefaultButton.dart';
import 'package:keswaty/Widgets/Email_field.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/controller/Reset_Account_Provider.dart';
import 'package:keswaty/main.dart';
import 'package:keswaty/view/Login_Resiter/Forget_Password/ForgetPasswordWidgets/NoAccountText.dart';
import 'package:provider/provider.dart';

import 'ForgetPasswordWidgets/ValidatingAnswer.dart';



class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {


  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Provider.of<ResetAccountProvider>(context, listen: false).reset_account(email);
  //   });
  // }


  final _formkey = GlobalKey<FormState>();
  final List<String> errors =[];
  TextEditingController emailcontroller = TextEditingController() ;

  late String email;
  late String password;
  bool remember = false;


  Language _language = Language();

  @override
  Widget build(BuildContext context) {
    return
      Directionality(
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
          // title:  Text(_language.tAddpost(),
          //     style: TextStyle(
          //         color:Theme.of(context).brightness == Brightness.dark
          //             ?  kwhait
          //             :  kblueColor,
          //         fontSize: 15)),
          leading: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon( Icons.arrow_back,
              color:Theme.of(context).brightness == Brightness.dark
                  ?  kwhait
                  :  kblueColor,

            ),
          ),
        ),

        body:

        Consumer<ResetAccountProvider>(builder: (context, resetAccountPro, child) {
          return resetAccountPro.isloading
              ? Center(
            child: CircularProgressIndicator(),
          )
              :
          ListView(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          _language.resetpass(),
                          style : headingStyle,
                        ),
                        SizedBox(height: 10,),
                        Text(
                          _language.resetpassdesc(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kblack38,
                          ),
                        ),
                        Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(height: 60),
                              SizedBox(
                                  width: 345,
                                  child: EmailField(
                                    controller1:  emailcontroller,
                                  )
                              ),
                              SizedBox(height: 40),
                              Container(
                                width: 350,
                                child: DefaultButton(
                                  bkground: kblueColor,
                                  press: () {

                                    final dio = Dio();

                                    if(_formkey.currentState!.validate()){
                                      _formkey.currentState!.save();

                                      setState(() async{
                                       await Provider.of<ResetAccountProvider>(context, listen: false).reset_account(emailcontroller.text);
                                       if(resetAccountPro.userlist.length > 0){

                                         Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ValidatingAnswer(sginUpModel: resetAccountPro.userlist.last,)));

                                       }else{
                                         AwesomeDialog(
                                             context: context,
                                             dialogType: DialogType.warning,
                                             animType: AnimType.topSlide,
                                             showCloseIcon: true,
                                             // title: _language.tAlertUnCompleted(),
                                             desc: _language.noemail(),
                                             btnOkText: _language.tbtnYse(),
                                             btnOkColor: kblueColor,
                                             btnOkIcon: Icons.check,
                                             buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                                             btnOkOnPress: (){

                                             }
                                         ).show();
                                       }
                                      });


                                      // dio.get('https://keswaty.com/api/users/reset?email=Osama@gmail.com');

                                    }

                                  },
                                  text: _language.Next(),txtstyle: TextStyle(fontSize: 20,color: kwhait),
                                  icon: Icon(Icons.next_plan_outlined, color: kwhait ),
                                ),
                              ),
                              SizedBox(height: 60),

                            ],
                          ),
                        ),
                      ],
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



