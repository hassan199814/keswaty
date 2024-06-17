import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:keswaty/String_Extensions.dart';
import 'package:keswaty/Widgets/DefaultButton.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/data/models/sginup_model.dart';
import 'package:keswaty/main.dart';
import 'package:keswaty/view/Login_Resiter/Forget_Password/ForgetPasswordWidgets/ChangePassword.dart';
import 'package:keswaty/view/about_project/con_us.dart';

class ValidatingAnswer extends StatefulWidget {
   ValidatingAnswer({super.key,required this.sginUpModel});


  SginUpModel sginUpModel;

  @override
  _ValidatingAnswerState createState() => _ValidatingAnswerState();
}

class _ValidatingAnswerState extends State<ValidatingAnswer> {


  final _formkey = GlobalKey<FormState>();
  final List<String> errors =[];
  TextEditingController qustioncontroller = TextEditingController() ;
  TextEditingController answercontroller = TextEditingController() ;


  late String email;
  late String password;
  bool remember = false;


  final Language _language = Language();


  @override
  Widget build(BuildContext context) {

    qustioncontroller.text = widget.sginUpModel.rstrQstn.toString();

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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        _language.tValidateAnswer(),
                        style : headingStyle,
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        _language.tValidateHelp(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: kblack38,
                        ),
                      ),



                      Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            const SizedBox(height: 60),
                            SizedBox(
                              width: 345,
                              child: TextFormField(
                                controller: qustioncontroller,
                                enabled: false,
                                keyboardType: TextInputType.text,
                                decoration:  InputDecoration(
                                    labelText: _language.tquestion(),
                                    helperText: "",
                                    // hintText: _language.tEnterRestoreAnswer(),hintStyle: TextStyle(fontSize: 12),
                                    suffixIcon: const Icon(Icons.lock, color:kblack38)
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                width: 345,
                                child: TextFormField(
                                  controller: answercontroller,

                                  keyboardType: TextInputType.text,
                                  validator: (s) {
                                    if (!s!.isNotEmpty){
                                      return _language.tEnterAnswer() ;
                                    }
                                    return null;
                                  },
                                  decoration:  InputDecoration(
                                      labelText: _language.tanswer(),
                                      helperText: "",
                                      hintText: _language.tEnterRestoreAnswer(),hintStyle: const TextStyle(fontSize: 12),
                                      suffixIcon: const Icon(Icons.key, color:kblack38)
                                  ),
                                ),
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: 350,
                              child: DefaultButton(
                                bkground: kblueColor,
                                press: () {
                                  if(_formkey.currentState!.validate()){
                                    _formkey.currentState!.save();

                                    if(widget.sginUpModel.rstrAnsr.toString() == answercontroller.text.toString()){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ChangePassword(sginUpModel: widget.sginUpModel)));
                                    }else{
                                      AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.error,
                                          animType: AnimType.topSlide,
                                          showCloseIcon: true,
                                          // title: _language.tAlertUnnCompleted(),
                                          desc: _language.twronganswer(),
                                          btnOkText: _language.tconus(),
                                          btnCancelText: _language.tbtnCancel(),
                                          btnOkColor: greenColor,
                                          btnCancelColor: kblack38,
                                          btnOkIcon: Icons.check,
                                          buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
                                          btnOkOnPress: (){
                                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const con_us()));
                                          },
                                        btnCancelOnPress: (){

                                        }
                                      ).show();
                                    }

                                  }

                                },
                                text: _language.Reset(),txtstyle: const TextStyle(fontSize: 20,color: kwhait),
                                icon: const Icon(Icons.settings_backup_restore_sharp, color: kwhait ),
                              ),
                            ),
                            const SizedBox(height: 60),

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
