import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keswaty/String_Extensions.dart';
import 'package:keswaty/Widgets/DefaultButton.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/main.dart';

import 'package:provider/provider.dart';


class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {


  TextEditingController namecontroller = TextEditingController() ;
  TextEditingController phoneontroller = TextEditingController() ;
  TextEditingController emailcontroller = TextEditingController() ;
  TextEditingController passwordcontroller = TextEditingController() ;
  TextEditingController addresscontroller = TextEditingController() ;

  void initState() {
    // TODO: implement initState
    super.initState();
    namecontroller.text = InitSharedPreferences.getNameUser()!;
    phoneontroller.text = InitSharedPreferences.getPhoneUser()!;
    emailcontroller.text = InitSharedPreferences.getEmailUser()!;
    passwordcontroller.text = InitSharedPreferences.getPassUser()!;
    addresscontroller.text = InitSharedPreferences.getAddressUser()!;

  }



 // int? Vistor_ID;
  String? VistorEmail;
  String? Nots;
  //late DateTime? adding_time;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Language _language = Language();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
              title:  Text(_language.tFeedback(),
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
          body:
          // Consumer<InsertFeedbackProvider>(builder: (context, feedBack, child) {
          //   return feedBack.isloading ? Center(child: CircularProgressIndicator(),) :
            ListView(
              padding: EdgeInsets.all(20),
                children: [



                  SizedBox(height: 10,),
                  Text(
                      _language.tFeedbackPage(),
                      textAlign: TextAlign.center, style: TextStyleGray),
                  SizedBox(height: 30),
                  Form(
                    key: _formKey,
                      child: Column(
                        children: [

                          Container(
                              width: screenWidth,
                              child: TextFormField(
                                controller: namecontroller,
                                enabled: false,
                                decoration: InputDecoration(
                                    labelText: _language.tFullname(),
                                    helperText: "",
                                    hintText: "",
                                    suffixIcon: Icon(
                                        Icons.person_outline_sharp, color: kblack38)
                                ),
                              )
                          ),

                          SizedBox(height: 10),
                          Container(
                              width: screenWidth,
                              child: TextFormField(
                                controller: phoneontroller,
                                enabled: false,

                                decoration:  InputDecoration(
                                    labelText: _language.tphone(),
                                    helperText: "",
                                    hintText: "",
                                    suffixIcon: Icon(Icons.phone, color: kblack38)

                                ),
                              ),
                          ),

                          SizedBox(height: 10),
                          Container(
                              width: screenWidth,
                              child: TextFormField(
                                controller: emailcontroller,
                                enabled: false,
                                keyboardType: TextInputType.emailAddress,
                                decoration:  InputDecoration(
                                    labelText: _language.temail(),
                                    helperText: "",
                                    hintText: "",
                                    suffixIcon: Icon(Icons.email_outlined, color: kblack38)
                                ),

                              )
                          ),
                          SizedBox(height: 10),


                          Container(width: screenWidth,
                              child: TextFormField(
                                validator: (s) {
                                  if (!s!.isNotEmpty) {
                                    return _language.tPleaseEnterNots();
                                  }
                                },
                                onChanged: (value) {
                                  Nots = value;
                                },
                                maxLines: 5,
                                decoration: InputDecoration(
                                    helperText: "",
                                    hintText: _language.tWriteYourNotehere(),
                                    //suffixIcon: Icon(Icons., color: Colors.black38),
                                    label: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.description_outlined,
                                          color: kblueColor,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(_language.tNotes()),
                                        )
                                      ],
                                    )
                                ),
                              )

                          ),

                          SizedBox(height: 0,),


                          SizedBox(height: 20),

                          Container(width: screenWidth,
                            child: DefaultButton(
                              bkground: kblueColor,
                              press: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  // FeedbackModel feedbackModel=FeedbackModel(
                                  //
                                  //   Vistor_id: InitSharedPreferences.getID()!,
                                  //   VistorEmail: InitSharedPreferences.getEmailUser()!,
                                  //   Comment: Nots!,
                                  //   addingTime: DateTime.now().toString(),
                                  //
                                  //
                                  // );

                                  // Provider.of<InsertFeedbackProvider>(context,listen: false).insert_feedback(feedbackModel);
                                  // print(feedbackModel.toString());

                                  AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.success,
                                      animType: AnimType.topSlide,
                                      showCloseIcon: true,
                                      title: _language.tAlertSuccess(),
                                      desc: _language.tAlertNote(),
                                      btnOkColor: kblueColor,
                                      btnOkIcon: Icons.check,
                                      buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                                      btnOkOnPress: (){
                                        FocusScope.of(context).unfocus();

                                      }
                                  ).show();


                                }

                              },
                              text: _language.tsend(),txtstyle: TextStyle(fontSize: 17,color: kwhait),
                              icon: Icon(Icons.add_circle_outline, color: Colors.white),
                            ),


                          ),
                        ],
                      )
                  ),

                ]
            ),
          // }
          // )
            ),
      );
  }
}
