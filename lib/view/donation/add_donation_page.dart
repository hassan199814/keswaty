import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keswaty/String_Extensions.dart';
import 'package:keswaty/Widgets/DefaultButton.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/controller/donation_bskt_get_provider.dart';
import 'package:keswaty/data/models/donation_type_model.dart';
import 'package:keswaty/main.dart';
import 'package:keswaty/view/donation/donations_page.dart';
import 'package:provider/provider.dart';

class AddDonationPage extends StatefulWidget {
  // var bskt_id;




  AddDonationPage({Key? key ,
    // required this.bskt_id
  }) : super(key: key);


  // DonationBsktModel bskt_id;


  @override
  _AddDonationPageState createState() => _AddDonationPageState();
}

class _AddDonationPageState extends State<AddDonationPage> {





  String? name;

  String? id;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _saveForm() {}
  final TextEditingController controllerLat = TextEditingController();
  final TextEditingController controllerLong = TextEditingController();

  Language _language = Language();

  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DonationBsktGetProvider>(context, listen: false).donationtypes();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return
        // InitSharedPreferences.getID()==null?
        // SignInPage():

          Directionality(
              textDirection: language == 'AR' ? TextDirection.rtl : TextDirection.ltr,
              child: Scaffold(
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? Color.fromRGBO(33, 37, 25, 1)
                    : Color.fromRGBO(240, 242, 245, 1),
                appBar: AppBar(
                  backgroundColor: Theme.of(context).brightness == Brightness.dark
                      ? Color.fromRGBO(33, 37, 25, 1)
                      : Color.fromRGBO(240, 242, 245, 1),
                  elevation: 0,
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
                body:
                Consumer<DonationBsktGetProvider>(builder: (context, donationinsertPro, child) {
                  return donationinsertPro.isloading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      :
                  ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //----------------------------------------------------------------------------------------------------------------------------------------------------------
                          Center(
                            child: Material(
                                color: Theme.of(context).brightness ==
                                    Brightness.dark
                                    ? Color.fromRGBO(41, 45, 33, 1)
                                    : Color.fromRGBO(240, 242, 245, 1),
                                elevation: 0,
                                borderRadius: BorderRadius.circular(5),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            //  border: Border.all(color: kblueColor),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                topLeft: Radius.circular(5)),
                                          ),
                                          child: Icon(
                                            MingCute.hand_heart_line,
                                            color: greenColor,
                                            size: 40,
                                          ),
                                          // Ink.image(image: AssetImage("images/found.png"),
                                          height: 40,
                                          width: screenWidth - 20,
                                          // fit: BoxFit.cover,
                                        ),
                                        SizedBox(height: 6),

                                        // SizedBox(height: 6,)
                                      ],
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                                color: Theme.of(context).brightness ==
                                    Brightness.dark
                                    ? kwhait
                                    : greenColor,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              _language.Donate(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: greenColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                                color: Theme.of(context).brightness ==
                                    Brightness.dark
                                    ? kwhait
                                    : greenColor,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //---------------------------------------------------------------------------------------------------------
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: screenWidth - 20,

                                child: DropdownButtonFormField<String>(
                                  validator: (value) {
                                    if (value == null) {
                                      return _language.tPleaseselectType();
                                    }
                                  },
                                  // value: lostfound_type,
                                  items: donationinsertPro.donationtypedropdownlist!.map((DonationTypeModel element) {
                                    return DropdownMenuItem(
                                      value: element.id.toString(),
                                      child: Text(element.name.toString()),
                                    );

                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      id =  value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: _language.tType(),
                                    hintText: _language.tChooseType(),
                                  ),
                                ),
                              ),

                              SizedBox(height: 10),

                              SizedBox(width: 20),
                              Text(_language.AddPhoto()),
                              SizedBox(width: 10),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [

                                  ElevatedButton.icon(onPressed:  () {
                                    donationinsertPro.pickCameraImage();
                                  },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:  kblueColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:BorderRadius.only(
                                              bottomRight: language == 'AR' ? Radius.circular(15) : Radius.circular(0),
                                              topRight: language == 'AR' ? Radius.circular(15) : Radius.circular(0),
                                              bottomLeft: language == 'AR' ? Radius.circular(0) : Radius.circular(15),
                                              topLeft: language == 'AR' ? Radius.circular(0) : Radius.circular(15),
                                            ),
                                          )
                                      ),
                                      icon:Icon(Icons.camera_alt,color: Colors.white),
                                      label: Text(_language.Camera(),style: TextStyle(color: Colors.white),)),
                                  SizedBox(width: 1),
                                  ElevatedButton.icon(onPressed:  () {
                                    donationinsertPro.pickMultipleImage();
                                  },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:  kblueColor,

                                          shape: RoundedRectangleBorder(
                                            borderRadius:BorderRadius.only(
                                              bottomRight: language == 'AR' ? Radius.circular(0) : Radius.circular(15),
                                              topRight: language == 'AR' ? Radius.circular(0) : Radius.circular(15),
                                              bottomLeft: language == 'AR' ? Radius.circular(15) : Radius.circular(0),
                                              topLeft: language == 'AR' ? Radius.circular(15) : Radius.circular(0),
                                            ),
                                          )
                                      ),
                                      icon:Icon(Icons.image,color: Colors.white,),
                                      label: Text(_language.Gallery(),style: TextStyle(color: Colors.white))),
                                  SizedBox(width: 10),
                                ],
                              ),


                              GridView.builder(
                                shrinkWrap: true,
                                itemCount: donationinsertPro.imageFileList?.length,
                                padding: const EdgeInsets.all(20),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 1 / 1,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                ),
                                itemBuilder: (context, index) {
                                  final String? image = donationinsertPro.imageFileList?[index].path ;

                                  return   Container(

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(File(image!)),
                                      ),
                                    ),
                                    child:   IconButton(
                                      iconSize: 25,
                                      alignment: Alignment.topRight,
                                      icon: const Icon(HeroIcons.trash,shadows: <Shadow>[Shadow(color: Colors.grey, blurRadius: 5.0)],),
                                      color: Colors.pink,
                                      onPressed: () {
                                        setState(() {
                                          donationinsertPro.deleteImage(index);

                                        });
                                      },
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: screenWidth - 20,
                                child:
                                DefaultButton(
                                  bkground: kblueColor,
                                  press: () {
                                    //_saveForm;
                                    if (_formKey.currentState!.validate()) {
                                      FocusScope.of(context).unfocus();
                                      _formKey.currentState!.save();



                                      if(donationinsertPro.imageFileList!.length > 0 ){
                                        donationinsertPro.uploadImage(donationinsertPro.donationbsktadded_item.last.id.toString() ,id!);



                                        AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.success,
                                            animType: AnimType.topSlide,
                                            showCloseIcon: true,
                                            title: _language.tAlertSuccess(),
                                            desc: _language.tAlertAddLostFoundDesc(),
                                            btnOkText: _language.tbtnYse(),
                                            btnOkColor: kblueColor,
                                            btnOkIcon: Icons.check,
                                            buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                                            btnOkOnPress: (){
                                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DonationsPage(donation: donationinsertPro.donationbsktadded_item.last)));
                                            }
                                        ).show();

                                      }else{
                                        AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.warning,
                                            animType: AnimType.topSlide,
                                            showCloseIcon: true,
                                            // title: _language.tAlertUnCompleted(),
                                            desc: _language.imagereq(),
                                            btnOkText: _language.tbtnYse(),
                                            btnOkColor: kblueColor,
                                            btnOkIcon: Icons.check,
                                            buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                                            btnOkOnPress: (){
                                            }
                                        ).show();
                                      }




                                      setState(() {


                                        // donationinsertPro.imageFileList=[];

                                        // donationinsertPro.uploadPhoto("21","1");

                                      });

                                      // print(donationinsertPro.donationbsktlist);
                                    }
                                  },
                                  text: _language.tadd(),
                                  txtstyle:
                                  TextStyle(fontSize: 15, color: kwhait),
                                  icon: Icon(Icons.add_circle_outline,
                                      color: Colors.white),
                                ),
                              ),


                            ],
                          )),

                      //------------------------------------------------------------------------------------------
                      Column(
                        children: [
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 20),
                              Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  _language.tNote(),
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              Expanded(child: Divider()),
                              SizedBox(width: 20),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(_language.dontnnote(),
                              textAlign: TextAlign.center,
                              style: TextStyleGray),
                          SizedBox(height: 40),
                        ],
                      )
                    ],
                  );
                }
                )
            ),
          );

  }
}
