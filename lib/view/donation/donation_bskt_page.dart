import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/controller/donation_bskt_get_provider.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/data/models/donation_bskt_model.dart';
import 'package:keswaty/data/models/donation_type_model.dart';
import 'package:keswaty/main.dart';
import 'package:keswaty/view/Login_Resiter/Login/login.dart';
import 'package:keswaty/view/donation/donations_page.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';


class donation extends StatefulWidget {
  List<DonationBsktModel> donationbsktlist = [];
  List<DonationTypeModel> donationtypelist = [];

  donation({Key? key}) : super(key: key);

  @override
  _donationState createState() => _donationState();
}

class _donationState extends State<donation> {
  @override
  Language _language = Language();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DonationBsktGetProvider>(context, listen: false).donationbskt(clnt_id: InitSharedPreferences.getID()!);

    });

  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: language == 'AR' ? TextDirection.rtl: TextDirection.ltr,

      child: Scaffold(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Color.fromRGBO(33, 37, 25, 1)
              : Color.fromRGBO(240, 242, 245, 1),
          body:
          RefreshIndicator(
            onRefresh: () async{
            await  Provider.of<DonationBsktGetProvider>(context, listen: false).donationbskt(clnt_id: InitSharedPreferences.getID()!);
            },
            child: Consumer<DonationBsktGetProvider>(
                builder: (context, donationbsktpro, child) {
                  return donationbsktpro.isloading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : donationbsktpro.donationbsktlist.length == 0
                      ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(_language.NoBasketFound())],
                      ))
                      : ListView.builder(

                    physics: BouncingScrollPhysics(),
                    itemCount: donationbsktpro.donationbsktlist.length,
                    itemBuilder: (context, index) {

                      return

                        Column(
                        children: [

                          SizedBox(
                            height: 1,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SizedBox(width: 5,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 0),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    child: Row(
                                      children: [
                                        Material(
                                            color: Theme.of(context)
                                                .brightness ==
                                                Brightness.dark
                                                ? Color.fromRGBO(
                                                41, 45, 33, 1)
                                                : kwhait,
                                            elevation: 0,
                                            borderRadius:
                                            BorderRadius.circular(0),
                                            clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                            child: Column(
                                              // mainAxisSize: MainAxisSize.min,
                                              children: [
                                                InkWell(
                                                  splashColor: kCamera,
                                                  onTap: () {
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
                                                        btnOkIcon: Icons.check,
                                                        buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                                                        btnOkOnPress: (){
                                                          FocusScope.of(context).unfocus();
                                                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Login()));
                                                        },
                                                        btnCancelOnPress: (){}
                                                    ).show():
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DonationsPage(donation: donationbsktpro.donationbsktlist[index])));
                                                    // Navigator.pushNamed(context, "AddFoundLost");
                                                  },
                                                  child: Container(
                                                      decoration: BoxDecoration(color: Colors.transparent,
                                                        // border: Border.all(color: kblueColor),
                                                        borderRadius:
                                                        BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                                                      ),

                                                        child: Container(
                                                          // height: 160,
                                                          width: screenWidth,
                                                          child: Column(
                                                            children: [
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: 15,
                                                                  ),
                                                                  Icon(MingCute.truck_line, color: kblueColor, size: 25),
                                                                  SizedBox(width: 3,),
                                                                  Expanded(
                                                                    flex: 4,
                                                                    child: Text(_language.BasketNO() + donationbsktpro.donationbsktlist[index].id.toString()!,
                                                                      style: TextStyle(fontSize: 15, color: kblueColor, fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                      flex: 3,
                                                                      child:
                                                                      Container(
                                                                          decoration:
                                                                          BoxDecoration(
                                                                            color: (donationbsktpro.donationbsktlist[index].dontnStatus == 0 ) ? kredf:
                                                                            (donationbsktpro.donationbsktlist[index].dontnStatus == 1 ) ?  kyallow:
                                                                            (donationbsktpro.donationbsktlist[index].dontnStatus == 2 ) ?  kblack38:
                                                                            greenColor,
                                                                            border: Border.all(
                                                                              color: (donationbsktpro.donationbsktlist[index].dontnStatus == 0 ) ? kredf:
                                                                              (donationbsktpro.donationbsktlist[index].dontnStatus == 1 ) ?  kyallow:
                                                                              greenColor,

                                                                            ),
                                                                            // border: Border.all(color: kblueColor),

                                                                            borderRadius: BorderRadius.only(
                                                                              bottomRight: language == 'AR' ? Radius.circular(10) : Radius.circular(0),
                                                                                topRight: language == 'AR' ? Radius.circular(10) : Radius.circular(0),
                                                                                bottomLeft: language == 'AR' ? Radius.circular(0) : Radius.circular(10),
                                                                                topLeft: language == 'AR' ? Radius.circular(0) : Radius.circular(10),
                                                                          )),
                                                                          // color: kblueColor,
                                                                          width: 15,
                                                                          height: 40,
                                                                          child:
                                                                          Row(
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            children: [


                                                                              donationbsktpro.donationbsktlist[index].dontnStatus ==0? Text(_language.Uncomplate(),style: TextStyle(fontWeight: FontWeight.bold,color: kwhait),):
                                                                              donationbsktpro.donationbsktlist[index].dontnStatus ==1? Text(_language.UnConfirm(),style: TextStyle(fontWeight: FontWeight.bold,color: kwhait),):
                                                                              donationbsktpro.donationbsktlist[index].dontnStatus ==2? Text(_language.Confirmed(),style: TextStyle(fontWeight: FontWeight.bold,color: kwhait),):
                                                                              Text(_language.Delivered(),style: TextStyle(fontWeight: FontWeight.bold,color: kwhait),),
                                                                              SizedBox(width: 3),
                                                                              donationbsktpro.donationbsktlist[index].dontnStatus ==0? Icon(Icons.dangerous, color: kwhait, size: 25,):
                                                                              donationbsktpro.donationbsktlist[index].dontnStatus ==1? Icon(HeroIcons.clock, color: kwhait, size: 25,):
                                                                              donationbsktpro.donationbsktlist[index].dontnStatus ==2? Icon(HeroIcons.check, color: kwhait, size: 25,):
                                                                              Icon(HeroIcons.check_badge, color: kwhait, size: 25,),

                                                                            ],
                                                                          )

                                                                      )
                                                                  ),
                                                                ],
                                                              ),


                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [


                                                                  Text(
                                                                    donationbsktpro.donationbsktlist[index].bsktDscr.toString(),style: TextStyle(color: kblueColor), ),


                                                                 donationbsktpro.donationbsktlist[index].dontnStatus! < 3 ?

                                                                 InkWell(
                                                                   focusColor: kblueColor,
                                                                   onTap: (){
                                                                     final dio = Dio();
                                                                     setState(() {
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
                                                                           btnOkIcon: Icons.check,
                                                                           buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                                                                           btnOkOnPress: (){
                                                                             FocusScope.of(context).unfocus();
                                                                             Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Login()));
                                                                           },
                                                                           btnCancelOnPress: (){}
                                                                       ).show():

                                                                       AwesomeDialog(
                                                                           context: context,
                                                                           dialogType: DialogType.warning,
                                                                           animType: AnimType.topSlide,
                                                                           showCloseIcon: true,
                                                                           // title: _language.tAlertUnCompleted(),
                                                                           desc: _language.tAlertWrongdelete(),
                                                                           btnOkText: _language.tbtnYse(),
                                                                           btnCancelText: _language.tbtnCancel(),
                                                                           btnOkColor: kred,
                                                                           btnCancelColor: kblack38,
                                                                           // btnOkIcon: Icons.check,
                                                                           buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                                                                           btnOkOnPress: (){
                                                                             dio!.get("https://keswaty.com/api/donation/delete?id=${donationbsktpro.donationbsktlist[index].id}");
                                                                             AwesomeDialog(
                                                                                 context: context,
                                                                                 dialogType: DialogType.warning,
                                                                                 animType: AnimType.topSlide,
                                                                                 showCloseIcon: true,
                                                                                 // title: _language.tAlertUnCompleted(),
                                                                                 desc: _language.tAlertDleteDone(),
                                                                                 btnOkText: _language.tbtnYse(),
                                                                                 btnOkColor: kblueColor,
                                                                                 btnOkIcon: Icons.check,
                                                                                 buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                 btnOkOnPress: (){
                                                                                   Provider.of<DonationBsktGetProvider>(context, listen: false).donationbskt(clnt_id: InitSharedPreferences.getID()!);
                                                                                 }
                                                                             ).show();
                                                                           },
                                                                         btnCancelOnPress:(){}

                                                                       ).show();

                                                                     });
                                                                   },
                                                                   child: Container(
                                                                     width: 80,
                                                                     height: 50,
                                                                     margin: EdgeInsets.only(
                                                                       left: language == 'AR' ? 15 : 0,
                                                                       right: language == 'AR' ? 0 : 15
                                                                     ),

                                                                       child: Icon(Icons.delete_forever_rounded,color: kred,)),
                                                                 ):
                                                                     SizedBox()


                                                                ],
                                                              ),


                                                              SizedBox(height: 10,)
                                                            ],

                                                          ),
                                                        ),


                                                    // child: Ink.image(
                                                    //   image: AssetImage("images/lost.png"),
                                                    //   height: 130,
                                                    //   width: 150,
                                                    //   fit: BoxFit.cover,
                                                    // ),
                                                  ),
                                                ),

                                                //
                                              ],
                                            )),

                                      ],
                                    )),



                                //---------------------------------------------------------------------------------------------------------------------------------------------------------

                                //----------------------------------------------------------------------------------------------------------------------------------------------------------
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );

                }),
          )

      ),
    );
  }

}
