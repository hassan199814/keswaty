import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keswaty/String_Extensions.dart';
import 'package:keswaty/Widgets/DefaultButton.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/controller/insert_sginup_provider.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/data/models/sginup_model.dart';
import 'package:keswaty/main.dart';
import 'package:keswaty/view/Login_Resiter/Login/login.dart';
import 'package:provider/provider.dart';

import '../Forget_Password/ForgetPasswordWidgets/NoAccountText.dart';





class SginUpPage extends StatefulWidget {
  const SginUpPage({Key? key}) : super(key: key);

  @override
  State<SginUpPage> createState() => _SginUpPageState();
}

class _SginUpPageState extends State<SginUpPage> {


  String? userName;
  String? email;
  String? phoneNo;
  String? password;
  String? rstrQstn;
  String? rstrAnsr;
  String? adrs;
  // String? lngtd;
  // String? latud;
  // String? updatedAt;
  // String? createdAt;
  int? id;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Language _language = Language();

  bool obscurePassWord = true;
  // late String password;
  late String confrom_password;

  final List<String> errors =[];

  void addError({required String error}){
    if(!error.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removError({required String error}){
    if(!error.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
//----------------------

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
          backgroundColor:
          Theme.of(context).brightness == Brightness.dark
              ?  Color.fromRGBO(33, 37, 25, 1)
              :  Color.fromRGBO(240, 242, 245, 1),

          // elevation: 0,
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
        Consumer<InsertSginUpProvider>(builder: (context, userPro, child) {
          return
          Form(
            key: _formKey,
            child: ListView(
              children: [

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Column(
                        children: [

                          SizedBox(height: 20),

                          Text(
                            _language.RegisterAccount(),
                            style: headingStyle,
                          ),


                          // SginUpForm(),

                          SizedBox(height: 15),

                        ],
                      ),

                      SizedBox(height: 20),

                      Container(
                          width: screenWidth,
                          child: TextFormField(
                            onChanged: (value) {
                              userName = value;
                            },
                            validator: (s) {
                              if (!s!.isNotEmpty) {
                                return _language.tPleaseEntername();
                              }
                              return null;
                            },
                            decoration:  InputDecoration(
                                labelText: _language.tFullname(),
                                helperText: "",
                                hintText: _language.tEnteryourname(),hintStyle: TextStyle(fontSize: 10),
                                suffixIcon: Icon(
                                    Icons.person_outline_sharp, color: kblack38)
                            ),
                          )
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                          width: screenWidth,
                          child: TextFormField(
                            onChanged: (value) {
                              phoneNo = value;
                            },
                            validator: (s) {
                              if (!s!.isValidInt()) {
                                return _language.tPleaseenterphonenumber();
                              }
                              return null;
                            },
                            // maxLength: 9,
                            // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            decoration:  InputDecoration(
                                labelText: _language.tPhonnumber(),
                                helperText: "",
                                hintText: _language.tenterphonenumber(),hintStyle: TextStyle(fontSize: 10),
                                suffixIcon: Icon(Icons.phone, color: kblack38)

                            ),
                          )
                      ),
                      SizedBox(height: 10),
                      Container(
                          width: screenWidth,
                          child: TextFormField(
                            onChanged: (value) {
                              email = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                            validator: (s) {
                              if (!s!.isValidEmail()) {
                                return KinvalidEmailError;
                              }
                              return null;
                            },
                            decoration:  InputDecoration(
                                labelText: _language.temail(),
                                helperText: "",
                                hintText: _language.tEnterYourEmail(),hintStyle: TextStyle(fontSize: 10),
                                suffixIcon: Icon(
                                    Icons.email_outlined, color: kblack38)
                            ),

                          )
                      ),
                      SizedBox(height: 10),
                      Container(
                          width: screenWidth,
                          child: TextFormField(
                            onSaved: (newValue) => password = newValue!,
                            onChanged: (value) {
                              password = value;
                              if (value.isNotEmpty) {
                                removError(error: KPassNullError);
                              }
                              else if (value.length >= 8) {
                                removError(error: KShortPassError);
                              }
                              return null;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                addError(error: KPassNullError);
                                return KPassNullError;
                              }
                              else if (value.length < 8) {
                                addError(error: KShortPassError);
                                return KShortPassError;
                              }
                              password = value;
                              return null;
                            },

                            obscureText: obscurePassWord,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: _language.tpassword(),
                              helperText: "",
                              hintText: _language.teEnteryourpassword(),hintStyle: TextStyle(fontSize: 10),

                              suffixIcon: IconButton(
                                onPressed: () =>
                                    setState(() =>
                                    obscurePassWord = !obscurePassWord),
                                icon: Icon(
                                  obscurePassWord ? Icons.visibility : Icons
                                      .visibility_off,
                                  color: kblack38,
                                ),
                              ),
                            ),
                          )
                      ),
                      SizedBox(height: 10),
                      Container(
                          width: screenWidth,
                          child: TextFormField(
                            onChanged: (value) {
                              adrs = value;
                            },
                            validator: (s) {
                              if (!s!.isNotEmpty) {
                                return _language.tPleaseEnterAddress();
                              }
                              return null;
                            },
                            decoration:  InputDecoration(
                                labelText: _language.taddress(),
                                helperText: "",
                                hintText: _language.teEnterAddress(),hintStyle: TextStyle(fontSize: 10),
                                suffixIcon: Icon(
                                    Icons.location_on_outlined, color: kblack38)
                            ),
                          )
                      ),
                      SizedBox(height: 10),
                      Container(
                          width: screenWidth,
                          child: TextFormField(
                            onChanged: (value) {
                              rstrQstn = value;
                            },
                            validator: (s) {
                              if (!s!.isNotEmpty) {
                                return _language.palseEntertheQuestion();
                              }
                              return null;
                            },
                            decoration:  InputDecoration(
                                labelText: _language.tquestion(),
                                helperText: "",
                                hintText: _language.EntertheQuestion(),hintStyle: TextStyle(fontSize: 10),
                                suffixIcon: Icon(
                                    Icons.location_on_outlined, color: kblack38)
                            ),
                          )
                      ),
                      SizedBox(height: 10),
                      Container(
                          width: screenWidth,
                          child: TextFormField(
                            onChanged: (value) {
                              rstrAnsr = value;
                            },
                            validator: (s) {
                              if (!s!.isNotEmpty) {
                                return _language.tpleaseEnterAnswer();
                              }
                              return null;
                            },
                            decoration:  InputDecoration(
                                labelText: _language.tanswer(),
                                helperText: "",
                                hintText: _language.tEnterAnswer(),hintStyle: TextStyle(fontSize: 10),
                                suffixIcon: Icon(
                                    Icons.location_on_outlined, color: kblack38)
                            ),
                          )
                      ),
                      SizedBox(height: 10),


                      // Consumer<InsertUserProvider>(builder: (context, value, child) {
                      //   return  value.isloading?Center(child: CircularProgressIndicator(),):

                      Consumer<InsertSginUpProvider>(builder: (context, value, child) {
                        return

                        Container(


                            width: screenWidth,

                            child: DefaultButton(
                              bkground: kblueColor,
                              press: () async {
                                //_saveForm;
                                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You must enter the required data",style: TextStyle(color: Colors.white),)));
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  SginUpModel sginUpModel = SginUpModel(

                                    userName: userName,
                                    Email: email,
                                    phoneNo: phoneNo,
                                    password: password,
                                    adrs: adrs,
                                    rstrQstn: rstrQstn,
                                    rstrAnsr: rstrAnsr,


                                  );
                                  setState(()  {

                                     Provider.of<InsertSginUpProvider>(context, listen: false).insert_response(sginUpModel);

                                    AwesomeDialog(
                                      dialogBackgroundColor: Theme.of(context).brightness == Brightness.dark ? Color.fromRGBO(41, 45, 33, 1) : kwhait,
                                      context: context,
                                      dialogType: DialogType.noHeader,
                                      animType: AnimType.topSlide,
                                      showCloseIcon: true,
                                      title: "",
                                      desc:_language.RegistrDon(),
                                      descTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      btnOkOnPress: () {
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Login()));
                                      },
                                      btnOkColor: kblueColor,
                                      btnOkIcon: Icons.check_circle,
                                    ).show();


                                  });

                                  //
                                  // if(userPro.userlist.isEmpty){
                                  //   AwesomeDialog(
                                  //         dialogBackgroundColor: Theme.of(context).brightness == Brightness.dark ? Color.fromRGBO(41, 45, 33, 1) : kwhait,
                                  //         context: context,
                                  //         dialogType: DialogType.noHeader,
                                  //         animType: AnimType.topSlide,
                                  //         showCloseIcon: true,
                                  //         title: _language.tHello(),
                                  //         desc:userPro.singuperrorlist.last.email??""+ userPro.singuperrorlist.last.phone.toString()??"",
                                  //         descTextStyle: TextStyle(
                                  //             fontWeight: FontWeight.bold),
                                  //     btnOkOnPress: () {},
                                  //         btnOkColor: kblueColor,
                                  //         btnOkIcon: Icons.check_circle,
                                  //       ).show();
                                  // }
                                  //
                                  // setState(() {
                                  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Login()));
                                  //   userPro.isloading = false;
                                  // });

                                  print(sginUpModel.toString());
                                }




                              },
                              text: _language.Registration(),
                              txtstyle: TextStyle(fontSize: 15, color: kwhait),
                              icon: Icon(Icons.add, color: kwhait),)
                        );
                      }),

                      SizedBox(height: 30,),



                      SizedBox(height: 10),
                      NoAccountText(

                        text1: _language.Bycontinuingconfirm(),
                        text2: "",
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),

          );

        }
            )

      ),
    );

  }
}

