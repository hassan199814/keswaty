import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keswaty/String_Extensions.dart';
import 'package:keswaty/Widgets/DefaultButton.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/Widgets/map_card/add_location_bottom_navigation_bar.dart';
import 'package:keswaty/controller/donation_bskt_get_provider.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/data/models/donation_bskt_model.dart';
import 'package:keswaty/data/models/map_model.dart';
import 'package:intl/intl.dart';
import 'package:keswaty/view/donation/add_donation_page.dart';
import 'package:keswaty/view/map/add_location_from_map_screan.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class AddBasketsPage extends StatefulWidget {
  List<DonationBsktModel> donationbsktlist = [];

  AddBasketsPage({Key? key}) : super(key: key);

  @override
  _AddBasketsPageState createState() => _AddBasketsPageState();
}

class _AddBasketsPageState extends State<AddBasketsPage> {
  // int? id;
  // int? dontnStatus;
  String? phoneNo;
  String? bsktDscr;
  String? lngtd = "0";
  String? latud = "0";
  String? dlvryDate;
  // int? clientID;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _saveForm() {}
  final TextEditingController controllerLat = TextEditingController();
  final TextEditingController controllerLong = TextEditingController();

  Language _language = Language();
  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return
        // InitSharedPreferences.getID()==null?
        // SignInPage():

        Scaffold(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Color.fromRGBO(33, 37, 25, 1)
                : Color.fromRGBO(240, 242, 245, 1),
            appBar: AppBar(
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Color.fromRGBO(33, 37, 25, 1)
                  : Color.fromRGBO(240, 242, 245, 1),
              elevation: 0,
              // title:  Text(_language.tAddLost(),
              //     style: TextStyle(
              //         color:Theme.of(context).brightness == Brightness.dark
              //             ?  kwhait
              //             :  kblueColor,
              //         fontSize: 15)),
              // leading: IconButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   icon: Icon(
              //     Icons.arrow_back,
              //     color: Theme.of(context).brightness == Brightness.dark
              //         ? kwhait
              //         : kblueColor,
              //   ),
              // ),
            ),
            body: Consumer<DonationBsktGetProvider>(
                builder: (context, donationinsertPro, child) {
              return donationinsertPro.isloading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      children: [
                        //-----------------------------------------------------------------------------------------------------------
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
                                              MingCute.truck_line,
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
                                _language.Createreceiptrequest(),
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
                                  child: DateTimeField(
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                          Icons.date_range_outlined,
                                          color: kblack38),
                                      labelText: _language.tDateandTime(),
                                      hintText: _language.tChoseDateandTime(),
                                    ),
                                    format: format,
                                    onShowPicker:
                                        (context, currentValue) async {
                                      final date = await showDatePicker(
                                          context: context,
                                          firstDate: DateTime(0),
                                          initialDate:
                                              currentValue ?? DateTime.now(),
                                          lastDate: DateTime(2100));
                                      if (date != null) {
                                        return DateTime.utc(
                                          date.year,
                                          date.month,
                                          date.day,
                                        );
                                      } else {
                                        return currentValue;
                                      }
                                    },
                                    onChanged: (value) {
                                      dlvryDate = value.toString();
                                    },
                                    validator: (value) {
                                      if (value == null) {
                                        return _language
                                            .tPleaseselectadateandtime();
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    width: screenWidth - 20,
                                    child: TextFormField(
                                      onChanged: (value) {
                                        bsktDscr = value;
                                      },
                                      validator: (value) {
                                        if (!value!.isNotEmpty) {
                                          return _language.DonationDscrHint();
                                        }
                                        return null;
                                      },
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                          helperText: "",
                                          hintText:
                                              _language.taddlostfounddescr(),
                                          //suffixIcon: Icon(Icons., color: Colors.black38),
                                          label: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(_language.donationdscr()),
                                            ],
                                          )),
                                    )),
                                Container(
                                    width: screenWidth - 20,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              greenColor.withOpacity(0.5),
                                          fixedSize: const Size(80, 40),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      icon: Icon(Icons.location_on_outlined,
                                          color: Colors.white),
                                      onPressed: () async {
                                        AddLocationLocationModelNavigationBar
                                            .Show(
                                                context,
                                                LocationModel(
                                                    latitude: 15.37031780931026,
                                                    longitude:
                                                        44.191657147476455),
                                                () async {
                                          Location location = new Location();

                                          bool serviceEnabled;
                                          PermissionStatus permissionGranted;
                                          LocationData locationData;

                                          serviceEnabled =
                                              await location.serviceEnabled();
                                          if (!serviceEnabled) {
                                            serviceEnabled =
                                                await location.requestService();
                                            if (!serviceEnabled) {
                                              return;
                                            }
                                          }

                                          permissionGranted =
                                              await location.hasPermission();
                                          if (permissionGranted ==
                                              PermissionStatus.denied) {
                                            permissionGranted = await location
                                                .requestPermission();
                                            if (permissionGranted !=
                                                PermissionStatus.granted) {
                                              return;
                                            }
                                          }

                                          locationData =
                                              await location.getLocation();

                                          setState(() {
                                            lngtd = locationData!.longitude
                                                .toString();
                                            latud = locationData!.latitude
                                                .toString();
                                            controllerLong.text = lngtd!;
                                            controllerLat.text = latud!;
                                          });
                                        }, () async {
                                          final result = await Navigator.of(
                                                  context)
                                              .push(MaterialPageRoute(
                                                  builder: (_) =>
                                                      AddLocatonGoogleMapScreen(
                                                        locationModel: LocationModel(
                                                            latitude:
                                                                15.37031780931026,
                                                            longitude:
                                                                44.191657147476455),
                                                      )));
                                          if (result != null) {
                                            final LocationModel? locationModel =
                                                result;
                                            setState(() {
                                              lngtd = locationModel!.longitude
                                                  .toString();
                                              latud = locationModel!.latitude
                                                  .toString();
                                              controllerLong.text = lngtd!;
                                              controllerLat.text = latud!;
                                            });
                                          }
                                        });
                                        // await  AwesomeDialog(
                                        //     context: context,
                                        //     dialogType: DialogType
                                        //         .warning,
                                        //     animType: AnimType
                                        //         .leftSlide,
                                        //     showCloseIcon: true,
                                        //     // title: _language.tAlertUnCompleted(),
                                        //     desc: _language
                                        //         .locationpermission() +"\n"+_language.locationpermission2(),
                                        //     btnOkText: _language
                                        //         .agree(),
                                        //
                                        //     btnCancelText:_language.cancel() ,
                                        //     btnOkColor: kblueColor,
                                        //     btnOkIcon: Icons
                                        //         .check,
                                        //     // btnCancelIcon: Icons.cancel_outlined,
                                        //     buttonsBorderRadius: const BorderRadius
                                        //         .all(
                                        //         Radius.circular(
                                        //             10)),
                                        //     btnOkOnPress: () {
                                        //
                                        //     }
                                        // ).show();
                                      },
                                      label: Text(
                                        _language.Determinedeliverylocation(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                    //DefaultButton(text: "Map", press: (){}, icon: Icon(Icons.add_circle, color: Colors.white),),

                                    ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: screenWidth / 3,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (!value!.isNotEmpty) {
                                            return "";
                                          }
                                        },
                                        controller: controllerLong,
                                        decoration: InputDecoration(
                                            enabled: false,
                                            labelText: _language.tLongitude(),
                                            helperText: "",
                                            hintText: "",
                                            suffixIcon: Icon(
                                                Icons.location_on_outlined,
                                                color: kblack38)),
                                        onChanged: (value) {
                                          // lostfound_address = value!;
                                        },
                                      ),
                                      // Address_Field(
                                      //   controller1: TextEditingController(
                                      //     text: lostfound_address
                                      //   ),
                                      // )
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      width: screenWidth / 3,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (!value!.isNotEmpty) {
                                            return _language.dlvryloc();
                                          }
                                        },
                                        controller: controllerLat,
                                        decoration: InputDecoration(
                                            enabled: false,
                                            labelText: _language.tLatitude(),
                                            helperText: "",
                                            hintText: "",
                                            suffixIcon: Icon(
                                                Icons.location_on_outlined,
                                                color: kblack38)),
                                        onChanged: (value) {
                                          // lostfound_address = value!;
                                        },
                                      ),
                                      // Address_Field(
                                      //   controller1: TextEditingController(
                                      //     text: lostfound_address
                                      //   ),
                                      // )
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: screenWidth - 20,
                                  child: DefaultButton(
                                    bkground: kblueColor,
                                    press: () {
                                      //_saveForm;
                                      if (_formKey.currentState!.validate()) {
                                        FocusScope.of(context).unfocus();
                                        _formKey.currentState!.save();

                                        DonationBsktModel donationBsktModel =
                                            DonationBsktModel(
                                          phoneNo: InitSharedPreferences
                                              .getPhoneUser()!,
                                          bsktDscr: bsktDscr,
                                          dlvryDate: dlvryDate,
                                          latud: latud,
                                          lngtd: lngtd,
                                          clientID:
                                              InitSharedPreferences.getID()!,
                                        );

                                        Provider.of<DonationBsktGetProvider>(
                                                context,
                                                listen: false)
                                            .insertbasket(donationBsktModel);
                                        Get.snackbar(_language.Success(),
                                            _language.doneaddbaskests());

                                        // donationinsertPro.insertbasket(donationBsktModel);
                                        print(donationBsktModel.toString());
                                        // print( donationinsertPro.donationbsktlist.last.id);
                                        FocusScope.of(context).unfocus();

                                        AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.success,
                                            animType: AnimType.topSlide,
                                            showCloseIcon: true,
                                            title: _language.tAlertSuccess(),
                                            desc: _language.tAlertbasketsDesc(),
                                            btnOkText: _language.tbtnYse(),
                                            btnOkColor: kblueColor,
                                            btnOkIcon: Icons.check,
                                            buttonsBorderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(10)),
                                            btnOkOnPress: () {
                                              FocusScope.of(context).unfocus();
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          AddDonationPage()));
                                            }).show();
                                      }
                                    },
                                    text: _language.Next(),
                                    txtstyle:
                                        TextStyle(fontSize: 15, color: kwhait),
                                    icon: Icon(Icons.next_plan_outlined,
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
            }));
  }
}
