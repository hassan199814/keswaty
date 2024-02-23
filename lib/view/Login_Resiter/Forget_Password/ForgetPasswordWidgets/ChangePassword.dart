import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:keswaty/String_Extensions.dart';
import 'package:keswaty/Widgets/DefaultButton.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/controller/Reset_Account_Provider.dart';
import 'package:keswaty/data/models/sginup_model.dart';
import 'package:keswaty/main.dart';
import 'package:keswaty/view/Login_Resiter/Login/login.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
   ChangePassword({Key? key , required this.sginUpModel}) : super(key: key);

  SginUpModel sginUpModel;
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {


  //
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Provider.of<ResetAccountProvider>(context, listen: false).update_account();
  //   });
  // }

  final _formkey = GlobalKey<FormState>();
  final List<String> errors =[];
  TextEditingController oldpasscontroller = TextEditingController() ;
  TextEditingController newpasscontroller = TextEditingController() ;
  TextEditingController confirmpasscontroller = TextEditingController() ;

  late String email;
  late String password;
  bool remember = false;


  Language _language = Language();


  bool obscurePassWord = true;
  bool obscurePassWord2 = true;
  late String confrom_password;

  @override
  Widget build(BuildContext context) {
    oldpasscontroller.text = widget.sginUpModel.password.toString();

    return   Directionality(
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

        body: ListView(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        _language.tChangePass(),
                        style : headingStyle,
                      ),
                      SizedBox(height: 10,),
                      // Text(
                      //   _language.tValidateHelp(),
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: kblack38,
                      //   ),
                      // ),



                      Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            SizedBox(height: 60),

                            SizedBox(
                              width: 345,
                              child: TextFormField(
                                style: TextStyle(

                                ),

                                controller: oldpasscontroller,
                                enabled: false,
                                obscureText: true,
                                decoration:  InputDecoration(

                                    labelText: _language.tOldPass(),
                                    helperText: "",
                                    // hintText: _language.tEnterRestoreAnswer(),hintStyle: TextStyle(fontSize: 12),
                                    suffixIcon: Icon(Icons.password, color:kblack38)
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: 345,
                              child: TextFormField(
                                controller: newpasscontroller,
                                validator: (s) {
                                  if (!s!.isNotEmpty){
                                    return _language.tEnterAnswer() ;
                                  }

                                  return null;
                                },
                                obscureText: obscurePassWord2,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  labelText: _language.tNewPass(),
                                  helperText: "",

                                  suffixIcon: IconButton(
                                    onPressed: () => setState(() => obscurePassWord2 = !obscurePassWord2),
                                    icon: Icon(
                                      obscurePassWord2 ? Icons.visibility : Icons.visibility_off,
                                      color: kblack38,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: 345,
                              child: TextFormField(
                                controller: confirmpasscontroller,

                                validator: (s) {
                                  if (!s!.isNotEmpty){
                                    return _language.tpassrequired() ;
                                  }
                                  if(s.length < 8){
                                    return _language.tPasswordistooshort();
                                  }
                                  if(s.toString() != newpasscontroller.text.toString()){
                                    return _language.passnotmatch();
                                  }
                                  return null;
                                },
                                obscureText: obscurePassWord,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  labelText: _language.tConfirmPass(),
                                  helperText: "",

                                  suffixIcon: IconButton(
                                    onPressed: () => setState(() => obscurePassWord = !obscurePassWord),
                                    icon: Icon(
                                      obscurePassWord ? Icons.visibility : Icons.visibility_off,
                                      color: kblack38,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            Container(
                              width: 350,
                              child: DefaultButton(
                                bkground: kblueColor,
                                press: () {
                                  if(_formkey.currentState!.validate()){
                                    _formkey.currentState!.save();

                                      setState(() async{
                                        widget.sginUpModel.password = newpasscontroller.text;
                                        Provider.of<ResetAccountProvider>(context, listen: false).update_account(widget.sginUpModel);

                                        AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.success,
                                            animType: AnimType.topSlide,
                                            showCloseIcon: true,
                                            // title: _language.tAlertUnnCompleted(),
                                            desc: _language.tpasschanged(),
                                            btnOkText: _language.tbtnOk(),
                                            btnOkColor: kblueColor,
                                            btnOkIcon: Icons.check,
                                            buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                                            btnOkOnPress: (){
                                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Login()));
                                            },
                                        ).show();

                                      });
                                    }


                                },
                                text: _language.tChange(),txtstyle: TextStyle(fontSize: 20,color: kwhait),
                                icon: Icon(Icons.check_circle, color: kwhait ),
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

        ),
      ),
    );
  }
}
