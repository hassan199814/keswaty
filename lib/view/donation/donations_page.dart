import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/constant.dart';
import 'package:keswaty/controller/donation_bskt_get_provider.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/data/models/donation_bskt_model.dart';
import 'package:keswaty/data/models/donation_pic_model.dart';
import 'package:keswaty/main.dart';
import 'package:keswaty/view/Login_Resiter/Login/login.dart';
import 'package:keswaty/view/donation/add_donation_page2.dart';
import 'package:provider/provider.dart';


class DonationsPage extends StatefulWidget {
  List<DonationPicModel> donationpiclist = [];

  DonationsPage({super.key, required this.donation});

  DonationBsktModel donation;

  @override
  _DonationsPageState createState() => _DonationsPageState();
}

class _DonationsPageState extends State<DonationsPage> {
  final Language _language = Language();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DonationBsktGetProvider>(context, listen: false).donationbskttype(type_id: widget.donation.id);
      Provider.of<DonationBsktGetProvider>(context, listen: false).donationpic(bskt_id: widget.donation.id);
      // Provider.of<DonationBsktGetProvider>(context, listen: false).donationpicdelete(pic_id: widget.donationpiclist.);
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: language == 'AR' ? TextDirection.rtl: TextDirection.ltr,
      child:
        Scaffold(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromRGBO(33, 37, 25, 1)
              : const Color.fromRGBO(240, 242, 245, 1),
          appBar: AppBar(
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromRGBO(33, 37, 25, 1)
                  : const Color.fromRGBO(240, 242, 245, 1),
              elevation: 0,

          ),
          body: RefreshIndicator(
            onRefresh: ()async{

             await Provider.of<DonationBsktGetProvider>(context, listen: false).donationbskttype(type_id: widget.donation.id);
             await Provider.of<DonationBsktGetProvider>(context, listen: false).donationpic(bskt_id: widget.donation.id);

            },

            child:
            SingleChildScrollView(
              // scrollDirection: Axis.vertical,
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                ),
                child:
                Column(

                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // SizedBox(width: 5,),
                    Container(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            Material(
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? greenColor
                                    : kblueColor,
                                elevation: 0,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.black26,
                                      onTap: () {
                                        // Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddFoundLost()));
                                        // Navigator.pushNamed(context, "AddFoundLost");
                                      },
                                      child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                            // border: Border.all(color: kblueColor),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(0),
                                                topLeft: Radius.circular(0)),
                                          ),
                                          child: SizedBox(
                                              height: 45,
                                              width: screenWidth - 40,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    _language.BasketInfo(),
                                                    style: const TextStyle(
                                                        color: kwhait,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20),
                                                  )
                                                ],
                                              )
                                          )
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            Row(
                              children: [
                                // VerticalDivider(),
                                Material(
                                    color:
                                    Theme.of(context).brightness == Brightness.dark
                                        ? const Color.fromRGBO(41, 45, 33, 1)
                                        : kwhait,
                                    elevation: 0,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0)),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          splashColor: kCamera,
                                          onTap: () {
                                            // Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddFoundLost()));
                                            // Navigator.pushNamed(context, "AddFoundLost");
                                          },
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                                // border: Border.all(color: kblueColor),
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(15),
                                                    topLeft: Radius.circular(15)),
                                              ),
                                              child: SizedBox(

                                                // height: 0,
                                                width: screenWidth  - 40,
                                                child: Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const SizedBox(width: 15,),
                                                            const Icon(Icons.info_outline, color: kblueColor, size: 25),
                                                            const SizedBox(width: 3,),
                                                            Row(
                                                              children: [
                                                                Container(
                                                                    width: 100,
                                                                    height: 25,
                                                                    decoration: BoxDecoration(color:
                                                                         widget.donation.dontnStatus == 0 ? kredf.withOpacity(0.3)
                                                                        : widget.donation.dontnStatus == 1 ? kyallow.withOpacity(0.3)
                                                                        : widget.donation.dontnStatus == 2 ? kblack38.withOpacity(0.3)
                                                                          : greenColor.withOpacity(0.3),
                                                                      // border: Border.all(color: kblueColor),
                                                                      borderRadius: const BorderRadius
                                                                          .all(Radius
                                                                          .circular(
                                                                          10)),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment.center,
                                                                      children: [
                                                                        widget.donation.dontnStatus == 0 ? Text(_language.Uncomplate(),
                                                                          style: const TextStyle(fontWeight: FontWeight.bold, color: kred),)
                                                                            : widget.donation.dontnStatus == 1 ? Text(_language.UnConfirm(),
                                                                          style: const TextStyle(fontWeight: FontWeight.bold, color: kyallow),)
                                                                            : widget.donation.dontnStatus == 2 ? Text(_language.Confirmed(),
                                                                          style: const TextStyle(fontWeight: FontWeight.bold, color: kwhait),)
                                                                            : Text(_language.Delivered(),
                                                                          style: const TextStyle(fontWeight: FontWeight.bold, color: greenColor),
                                                                        ),
                                                                      ],
                                                                    )),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(height: 10,),
                                                        Row(
                                                          children: [
                                                            const SizedBox(
                                                              width: 15,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .description_outlined,

                                                              color: kblueColor,
                                                              size: 25,
                                                            ),
                                                            const SizedBox(
                                                              width: 3,
                                                            ),
                                                            Text(widget.donation.bsktDscr.toString() ,
                                                              style: const TextStyle(
                                                                fontSize: 17,
                                                                color: kblueColor,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            )
                                                          ],
                                                        ),

                                                        const SizedBox(
                                                          height: 10,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),


                                      ],
                                    )
                                ),
                              ],
                            ),
                          ],
                        )),


                    Consumer<DonationBsktGetProvider>(
                      builder: (context, donationbsktpro, child) {
                        return donationbsktpro.isloading
                            ? const Center(

                        )
                            : donationbsktpro.donationtypelist.isEmpty
                            ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [



                                    SizedBox(
                                      width: screenWidth / 2.5,
                                      child: ElevatedButton.icon(onPressed:  () {
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
                                            buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
                                            btnOkOnPress: (){
                                              FocusScope.of(context).unfocus();
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Login()));
                                            },
                                            btnCancelOnPress: (){}
                                        ).show():
                                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddDonationPage2(bskt_id: widget.donation)));
                                      },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:  kblueColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:BorderRadius.only(
                                                  bottomRight: language == 'AR' ? const Radius.circular(15) : const Radius.circular(0),
                                                  topRight: language == 'AR' ? const Radius.circular(15) : const Radius.circular(0),
                                                  bottomLeft: language == 'AR' ? const Radius.circular(0) : const Radius.circular(15),
                                                  topLeft: language == 'AR' ? const Radius.circular(0) : const Radius.circular(15),
                                                ),
                                              )
                                          ),
                                          icon:const Icon(MingCute.hand_heart_line,color: Colors.white),
                                          label: Text(_language.AddDonation(),style: TextStyle(color: Colors.white,fontSize: screenWidth / 30),)),
                                    ),
                                    const SizedBox(width: 1),
                                    SizedBox(
                                      width: screenWidth / 2.5,
                                      child: ElevatedButton.icon(onPressed:  () {

                                        final dio = Dio();

                                        setState(() async {
                                          if(donationbsktpro.donationtypelist.isNotEmpty){
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
                                                buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
                                                btnOkOnPress: (){
                                                  FocusScope.of(context).unfocus();
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Login()));
                                                },
                                                btnCancelOnPress: (){}
                                            ).show():
                                            await dio.get("https://keswaty.com/api/donation/status?id=${widget.donation.id}&status=2");
                                            AwesomeDialog(
                                                context: context,
                                                dialogType: DialogType.warning,
                                                animType: AnimType.topSlide,
                                                showCloseIcon: true,
                                                // title: _language.tAlertUnCompleted(),
                                                desc: _language.tInformCompleted(),
                                                btnOkText: _language.tbtnYse(),
                                                btnOkColor: kblueColor,
                                                btnOkIcon: Icons.check,
                                                buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
                                                btnOkOnPress: (){
                                                  setState(() {

                                                  });
                                                }
                                            ).show();
                                          }else{
                                            AwesomeDialog(
                                                context: context,
                                                dialogType: DialogType.warning,
                                                animType: AnimType.topSlide,
                                                showCloseIcon: true,
                                                // title: _language.tAlertUnCompleted(),
                                                desc: _language.tAlertUnCompleted(),
                                                btnOkText: _language.tbtnYse(),
                                                btnOkColor: kblueColor,
                                                btnOkIcon: Icons.check,
                                                buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
                                                btnOkOnPress: (){
                                                }
                                            ).show();

                                          }
                                        });

                                      },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:  greenColor,

                                              shape: RoundedRectangleBorder(
                                                borderRadius:BorderRadius.only(
                                                  bottomRight: language == 'AR' ? const Radius.circular(0) : const Radius.circular(15),
                                                  topRight: language == 'AR' ? const Radius.circular(0) : const Radius.circular(15),
                                                  bottomLeft: language == 'AR' ? const Radius.circular(15) : const Radius.circular(0),
                                                  topLeft: language == 'AR' ? const Radius.circular(15) : const Radius.circular(0),
                                                ),
                                              )
                                          ),
                                          icon:const Icon(Icons.check_circle,color: Colors.white,),
                                          label: Text(_language.Confirmdeliveryofdonation(),style: TextStyle(color: Colors.white,fontSize: screenWidth / 35))),
                                    ),

                                  ],
                                ),


                              ],
                            ))
                            : Container(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Column(
                              children: [

                                widget.donation.dontnStatus != 3 ?
                                Container(
                                  width: screenWidth,
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? const Color.fromRGBO(33, 37, 25, 1)
                                      : kwhait,
                                  child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [

                                      SizedBox(
                                        width: screenWidth / 2.5,
                                        child: ElevatedButton.icon(

                                            onPressed:  () {

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
                                              buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
                                              btnOkOnPress: (){
                                                FocusScope.of(context).unfocus();
                                                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Login()));
                                              },
                                              btnCancelOnPress: (){}
                                          ).show():
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AddDonationPage2(bskt_id: widget.donation)));
                                        },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:  kblueColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:BorderRadius.only(
                                                    bottomRight: language == 'AR' ? const Radius.circular(15) : const Radius.circular(0),
                                                    topRight: language == 'AR' ? const Radius.circular(15) : const Radius.circular(0),
                                                    bottomLeft: language == 'AR' ? const Radius.circular(0) : const Radius.circular(15),
                                                    topLeft: language == 'AR' ? const Radius.circular(0) : const Radius.circular(15),
                                                  ),
                                                )
                                            ),
                                            icon:const Icon(MingCute.hand_heart_line,color: Colors.white),
                                            label: Text(_language.AddDonation(),style: TextStyle(color: Colors.white,fontSize: screenWidth / 30),)),
                                      ),
                                      const SizedBox(width: 1),


                                      widget.donation.dontnStatus == 2 ?
                                      SizedBox(
                                        width: screenWidth / 2.5,
                                        child: ElevatedButton.icon(onPressed:  () {
                                          final dio = Dio();

                                          setState(() async {
                                            if(donationbsktpro.donationtypelist.isNotEmpty){
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
                                                  buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
                                                  btnOkOnPress: (){
                                                    FocusScope.of(context).unfocus();
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Login()));
                                                  },
                                                  btnCancelOnPress: (){}
                                              ).show():

                                              AwesomeDialog(
                                                  context: context,
                                                  dialogType: DialogType.warning,
                                                  animType: AnimType.topSlide,
                                                  showCloseIcon: true,
                                                  // title: _language.tAlertUnCompleted(),
                                                  desc: _language.Doyouwanttoconfirmdbasket(),
                                                  btnOkText: _language.tbtnYse(),
                                                  btnOkColor: kblueColor,
                                                  btnOkIcon: Icons.check,
                                                  buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
                                                  btnOkOnPress: (){
                                                    setState(() {

                                                       dio.get("https://keswaty.com/api/donation/status?id=${widget.donation.id}&status=3");
                                                       AwesomeDialog(
                                                           context: context,
                                                           dialogType: DialogType.warning,
                                                           animType: AnimType.topSlide,
                                                           showCloseIcon: true,
                                                           // title: _language.tAlertUnCompleted(),
                                                           desc: _language.Basketdeliveryconfirmed(),
                                                           btnOkText: _language.tbtnYse(),
                                                           btnOkColor: kblueColor,
                                                           btnOkIcon: Icons.check,
                                                           buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
                                                           btnOkOnPress: (){
                                                             setState(() {

                                                             });
                                                           },
                                                       ).show();
                                                    });
                                                  },
                                                btnCancelOnPress: (){}
                                              ).show();
                                            }else{
                                              AwesomeDialog(
                                                  context: context,
                                                  dialogType: DialogType.warning,
                                                  animType: AnimType.topSlide,
                                                  showCloseIcon: true,
                                                  // title: _language.tAlertUnCompleted(),
                                                  desc: _language.tAlertUnCompleted(),
                                                  btnOkText: _language.tbtnYse(),
                                                  btnOkColor: kblueColor,
                                                  btnOkIcon: Icons.check,
                                                  buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
                                                  btnOkOnPress: (){
                                                  }
                                              ).show();

                                            }
                                          });

                                        },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:  greenColor,

                                                shape: RoundedRectangleBorder(
                                                  borderRadius:BorderRadius.only(
                                                    bottomRight: language == 'AR' ? const Radius.circular(0) : const Radius.circular(15),
                                                    topRight: language == 'AR' ? const Radius.circular(0) : const Radius.circular(15),
                                                    bottomLeft: language == 'AR' ? const Radius.circular(15) : const Radius.circular(0),
                                                    topLeft: language == 'AR' ? const Radius.circular(15) : const Radius.circular(0),

                                                  ),
                                                )
                                            ),
                                            icon:const Icon(Icons.check_circle,color: Colors.white,),
                                            label: Text(_language.Confirmdeliveryofdonation(),style: TextStyle(color: Colors.white,fontSize: screenWidth / 30))),
                                      ):
                                      SizedBox(
                                        width: screenWidth / 2.5,
                                        child: ElevatedButton.icon(onPressed:  () {
                                          final dio = Dio();

                                          setState(() async {
                                            if(donationbsktpro.donationtypelist.isNotEmpty){

                                              AwesomeDialog(
                                                  context: context,
                                                  dialogType: DialogType.warning,
                                                  animType: AnimType.topSlide,
                                                  showCloseIcon: true,
                                                  // title: _language.tAlertUnCompleted(),
                                                  desc: _language.Doyouwanttoconfirmyourdonationothibasket(),
                                                  btnOkText: _language.tbtnYse(),
                                                  btnOkColor: kblueColor,
                                                  btnOkIcon: Icons.check,
                                                  buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
                                                  btnOkOnPress: (){
                                                    setState(() {

                                                       dio.get("https://keswaty.com/api/donation/status?id=${widget.donation.id}&status=2");

                                                       AwesomeDialog(
                                                           context: context,
                                                           dialogType: DialogType.warning,
                                                           animType: AnimType.topSlide,
                                                           showCloseIcon: true,
                                                           // title: _language.tAlertUnCompleted(),
                                                           desc: _language.tInformCompleted(),
                                                           btnOkText: _language.tbtnYse(),
                                                           btnOkColor: kblueColor,
                                                           btnOkIcon: Icons.check,
                                                           buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
                                                           btnOkOnPress: (){
                                                             setState(() {

                                                             });
                                                           },
                                                       ).show();
                                                    });
                                                  },
                                                btnCancelOnPress: (){}
                                              ).show();
                                            }else{
                                              AwesomeDialog(
                                                  context: context,
                                                  dialogType: DialogType.warning,
                                                  animType: AnimType.topSlide,
                                                  showCloseIcon: true,
                                                  // title: _language.tAlertUnCompleted(),
                                                  desc: _language.tAlertUnCompleted(),
                                                  btnOkText: _language.tbtnYse(),
                                                  btnOkColor: kblueColor,
                                                  btnOkIcon: Icons.check,
                                                  buttonsBorderRadius: const BorderRadius.all(Radius.circular(10)),
                                                  btnOkOnPress: (){
                                                  }
                                              ).show();

                                            }
                                          });

                                        },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:  kblack38,

                                                shape: RoundedRectangleBorder(
                                                  borderRadius:BorderRadius.only(
                                                    bottomRight: language == 'AR' ? const Radius.circular(0) : const Radius.circular(15),
                                                    topRight: language == 'AR' ? const Radius.circular(0) : const Radius.circular(15),
                                                    bottomLeft: language == 'AR' ? const Radius.circular(15) : const Radius.circular(0),
                                                    topLeft: language == 'AR' ? const Radius.circular(15) : const Radius.circular(0),
                                                  ),
                                                )
                                            ),
                                            icon:const Icon(Icons.check_circle,color: Colors.white,),
                                            label: Text(_language.ConfirmBasket(),style: TextStyle(color: Colors.white,fontSize: screenWidth / 30 ))),
                                      ),

                                    ],
                                  ),
                                ):

                                Container(
                                    width: screenWidth,
                                  color: Theme.of(context).brightness == Brightness.dark
                                  ? greenColor.withOpacity(0.3)
                                  : greenColor.withOpacity(0.3),
                                    child: Text(_language.Thisbaskethasbeen(),textAlign: TextAlign.center,style: const TextStyle(
                                      color: greenColor,fontWeight: FontWeight.bold
                                    ),)
                                ),


                                Material(
                                    color: Theme.of(context).brightness ==
                                        Brightness.dark
                                        ? const Color.fromRGBO(41, 45, 33, 1)
                                        : kwhait,
                                    elevation: 0,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(0),
                                        topLeft: Radius.circular(0)),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.black26,
                                          onTap: () {
                                            // Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddFoundLost()));
                                            // Navigator.pushNamed(context, "AddFoundLost");
                                          },
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                                // border: Border.all(color: kblueColor),
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                    Radius.circular(0),
                                                    topLeft:
                                                    Radius.circular(0)),
                                              ),
                                              child: SizedBox(
                                                  height: 45,
                                                  width: screenWidth - 40,
                                                  child:
                                                  Row(
                                                    children: [
                                                      Expanded(child: Divider(
                                                        color: Theme.of(context).brightness ==
                                                            Brightness.dark
                                                            ? kwhait
                                                            : kblueColor,
                                                      )),
                                                      Padding(padding: const EdgeInsets.symmetric(horizontal:10),
                                                        child:
                                                        Text(
                                                          _language
                                                              .DonationsType(),
                                                          style: TextStyle(
                                                              color: Theme.of(context).brightness ==
                                                                  Brightness.dark
                                                                  ? kwhait
                                                                  : kblueColor,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: 20),
                                                        ),),
                                                      Expanded(child: Divider(
                                                        color: Theme.of(context).brightness ==
                                                            Brightness.dark
                                                            ? kwhait
                                                            : kblueColor,
                                                      )),
                                                    ],),
                                              )),
                                        ),
                                      ],
                                    )),
                                Row(
                                  children: [
                                    // VerticalDivider(),
                                    Material(
                                        color: Theme.of(context).brightness ==
                                            Brightness.dark
                                            ? const Color.fromRGBO(41, 45, 33, 1)
                                            : kwhait,
                                        elevation: 0,
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0)),
                                        clipBehavior:
                                        Clip.antiAliasWithSaveLayer,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [

                                              Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.transparent,
                                                    // border: Border.all(color: kblueColor),
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        topRight: Radius
                                                            .circular(15),
                                                        topLeft:
                                                        Radius.circular(
                                                            15)),
                                                  ),
                                                  child: SizedBox(
                                                    // height: 160,
                                                    width: screenWidth - 40,
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 15,
                                                        ),

                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics: const BouncingScrollPhysics(),
                                                            // itemCount: donationbsktpro.donationbsktlist==null?0:donationbsktpro.donationbsktlist.length,
                                                            itemCount:
                                                            donationbsktpro.donationtypelist.length,
                                                            itemBuilder: (context, index) {
                                                              return
                                                                Column(
                                                                  children: [
                                                                    Container(
                                                                      margin: const EdgeInsets.only(bottom: 10 , left: 10),
                                                                      decoration: const BoxDecoration(

                                                                          border:
                                                                          Border(left: BorderSide(width: 3 , color: kblueColor),
                                                                          )
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        children: [

                                                                          const SizedBox(
                                                                            width:
                                                                            3,
                                                                          ),

                                                                          SizedBox(
                                                                            width: screenWidth - 150,
                                                                            child:  Text(

                                                                              donationbsktpro.donationtypelist[index].name.toString(),
                                                                              style: const TextStyle(
                                                                                  fontSize:
                                                                                  17,
                                                                                  color:
                                                                                  kblueColor,
                                                                                  fontWeight:
                                                                                  FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                          widget.donation.dontnStatus != 3 ?
                                                                          InkWell(
                                                                              onTap:() {
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
                                                                                    desc: _language.tAlertWrongdelete(),
                                                                                    btnOkText: _language.tDelete(),
                                                                                    btnCancelText: _language.tbtnCancel(),
                                                                                    btnOkColor: kred,
                                                                                    btnCancelColor: kblack38,
                                                                                    btnOkIcon: Icons.delete,
                                                                                    buttonsBorderRadius:
                                                                                    const BorderRadius.all(Radius.circular(10)),
                                                                                    btnOkOnPress: () {
                                                                                      Provider.of<DonationBsktGetProvider>(context, listen: false).donationtypedelete(bskt_id: widget.donation.id,type_id: donationbsktpro.donationtypelist[index].id);
                                                                                      setState(() {
                                                                                        donationbsktpro.isloading = false;
                                                                                        Provider.of<DonationBsktGetProvider>(context, listen: false).donationbskttype(type_id: widget.donation.id);
                                                                                        Provider.of<DonationBsktGetProvider>(context, listen: false).donationpic(bskt_id: widget.donation.id);

                                                                                      });
                                                                                    },

                                                                                    btnCancelOnPress: () {}
                                                                                )
                                                                                    .show();
                                                                              },
                                                                              child:
                                                                              const Icon(Icons.delete , color: kred, size: 30)):


                                                                          const SizedBox(
                                                                            width:
                                                                            3,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),

                                                                  ],
                                                                );
                                                            }),



                                                      ],
                                                    ),
                                                  )),


                                            //
                                          ],
                                        )),
                                  ],
                                ),
                              ],
                            ));
                      },
                    ),


                    Consumer<DonationBsktGetProvider>(builder: (context, donationpicpro, child) {
                        return donationpicpro.isloading
                            ? const Center(
                          child: CircularProgressIndicator(),
                        )
                            : donationpicpro.donationpiclist.isEmpty
                            ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text(
                                textAlign: TextAlign.center,
                                _language.NoMaterialsFound(),style: const TextStyle(
                                  fontWeight: FontWeight.bold
                              ),)],
                            ))
                            :

                        Container(
                            padding: const EdgeInsets.only(right: 10,left: 10),
                            child: Column(
                              children: [
                                Material(
                                    color: Theme.of(context).brightness ==
                                        Brightness.dark
                                        ? const Color.fromRGBO(41, 45, 33, 1)
                                        : kwhait,
                                    elevation: 0,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(0),
                                        topLeft: Radius.circular(0)),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.black26,
                                          onTap: () {
                                            // Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddFoundLost()));
                                            // Navigator.pushNamed(context, "AddFoundLost");
                                          },
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                                // border: Border.all(color: kblueColor),
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                    Radius.circular(0),
                                                    topLeft:
                                                    Radius.circular(0)),
                                              ),
                                              child: SizedBox(
                                                  height: 45,
                                                  width: screenWidth - 40,
                                                  child:
                                                  Row(
                                                    children: [
                                                      Expanded(child: Divider(
                                                        color: Theme.of(context).brightness ==
                                                            Brightness.dark
                                                            ? kwhait
                                                            : kblueColor,
                                                      )),
                                                      Padding(padding: const EdgeInsets.symmetric(horizontal:10),
                                                        child:
                                                        Text(
                                                          _language
                                                              .DonationsPic(),
                                                          style: TextStyle(
                                                              color: Theme.of(context).brightness ==
                                                                  Brightness.dark
                                                                  ? kwhait
                                                                  : kblueColor,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: 20),
                                                        ),),
                                                      Expanded(child: Divider(
                                                        color: Theme.of(context).brightness ==
                                                            Brightness.dark
                                                            ? kwhait
                                                            : kblueColor,
                                                      )),
                                                    ],),
                                              )),
                                        ),
                                      ],
                                    )),
                                Row(
                                  children: [
                                    // VerticalDivider(),
                                    Material(
                                        color: Theme.of(context).brightness ==
                                            Brightness.dark
                                            ? const Color.fromRGBO(41, 45, 33, 1)
                                            : kwhait,
                                        elevation: 0,
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        clipBehavior:
                                        Clip.antiAliasWithSaveLayer,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                                // border: Border.all(color: kblueColor),
                                                borderRadius:
                                                BorderRadius.only(
                                                    topRight: Radius
                                                        .circular(15),
                                                    topLeft:
                                                    Radius.circular(
                                                        15)),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    // height: 160,
                                                    width: screenWidth - 40,
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 15,
                                                        ),

                                                        ListView.builder(
                                                            shrinkWrap:
                                                            true,
                                                            physics:
                                                            const BouncingScrollPhysics(),
                                                            // itemCount: donationbsktpro.donationbsktlist==null?0:donationbsktpro.donationbsktlist.length,
                                                            itemCount: donationpicpro.donationpiclist.length,
                                                            itemBuilder: (context, index) {
                                                              // setState(() {
                                                              //   Provider.of<DonationBsktGetProvider>(context,listen: false).donationbskttype(type_id: donationbsktpro.donationbskttype[index].id! );
                                                              //
                                                              // });
                                                              return
                                                                Container(
                                                                  margin: const EdgeInsets.only(bottom: 10 , left: 10),
                                                                  decoration: const BoxDecoration(

                                                                      border:
                                                                      Border(left: BorderSide(width: 3 , color: kblueColor),
                                                                      )
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [


                                                                      const SizedBox(
                                                                        width:
                                                                        3,
                                                                      ),
                                                                      donationpicpro.donationpiclist.isNotEmpty ? CachedNetworkImage(
                                                                        placeholder: (ctx, url) => Image.asset(AppConstants.image),
                                                                        height: 200,
                                                                        fit: BoxFit.cover,
                                                                        width: 200,

                                                                        errorWidget: (ctx,url,err) => Image.asset(AppConstants.image,fit: BoxFit.cover, height: 200,width: 200,),
                                                                        // imageUrl: '${AppConstants.product_thumbnail_url}/${brandProvider.brandList[index].image!}',)
                                                                        imageUrl:'${AppConstants.BASE_URL}${AppConstants.DONATION_PIC_PATH}${donationpicpro.donationpiclist[index].dontnPic}',

                                                                      ): Image.asset('{AppConstants.image}'),


                                                                      widget.donation.dontnStatus != 3 ?
                                                                      InkWell(
                                                                          onTap:() {
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
                                                                                desc: _language.tAlertWrongdelete(),
                                                                                btnOkText: _language.tDelete(),
                                                                                btnCancelText: _language.tbtnCancel(),
                                                                                btnOkColor: kred,
                                                                                btnCancelColor: kblack38,
                                                                                btnOkIcon: Icons.delete,
                                                                                buttonsBorderRadius:
                                                                                const BorderRadius.all(Radius.circular(10)),
                                                                                btnOkOnPress: () {
                                                                                  Provider.of<DonationBsktGetProvider>(context, listen: false).donationpicdelete(pic_id: donationpicpro.donationpiclist[index].id,);
                                                                                  // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DonationsPage(donation: widget.donation)));
                                                                                  setState(() {
                                                                                    donationpicpro.isloading = false;
                                                                                    Provider.of<DonationBsktGetProvider>(context, listen: false).donationpic(bskt_id: widget.donation.id);
                                                                                    Provider.of<DonationBsktGetProvider>(context, listen: false).donationbskttype(type_id: widget.donation.id);



                                                                                  });
                                                                                  },

                                                                                btnCancelOnPress: () {}
                                                                                )
                                                                                .show();
                                                                          },
                                                                          child:
                                                                          const Icon(Icons.delete , color: kred, size: 30)):
                                                                      const SizedBox(
                                                                        width:
                                                                        3,
                                                                      )
                                                                    ],
                                                                  ),
                                                                );
                                                            })
                                                        ,

                                                      ],
                                                    ),
                                                  ),

                                                ],

                                              ))

                                            //
                                          ],
                                        )),
                                  ],
                                ),
                              ],
                            ));
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),

    );
  }
}
