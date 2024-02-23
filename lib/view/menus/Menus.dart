
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/view/Login_Resiter/Login/login.dart';
import 'package:keswaty/view/Main/Newsdetails/news_page.dart';
import 'package:keswaty/view/Main/gallery/gallery.dart';
import 'package:keswaty/view/about_project/About_project.dart';
import 'package:keswaty/view/about_project/con_us.dart';
import 'package:keswaty/view/donation/add_baskets_page.dart';
import 'package:keswaty/view/partners/partners_page.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class Menus extends StatefulWidget {
  const Menus({Key? key}) : super(key: key);

  @override
  _MenusState createState() => _MenusState();
}

class _MenusState extends State<Menus> {

  Language _language = Language();



  static var jsonList;


  @override
  void  initState() {
    // TODO: implement activate
    super.initState();

    getData();

  }

  Future getData() async{


    var response = await Dio().get('https://keswaty.com/api/info');



    try{

      if(response.statusCode==200){

        setState(() {
          jsonList = response.data;


        });
      }

    }catch(e){
      print(e);
    }

  }


  @override


  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return
      Scaffold(
      backgroundColor:
      Theme.of(context).brightness == Brightness.dark
          ?  Color.fromRGBO(33, 37, 25, 1)
          :  Color.fromRGBO(240, 242, 245, 1),



      body:ListView(
       padding: EdgeInsets.all(8.0),
        children: [
      Container(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          // padding: EdgeInsets.only(bottom: 70),
          decoration: BoxDecoration(

            borderRadius: BorderRadius.only(
              topRight: Radius.circular(70)
            )
          ),


      child:
      GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1,
        mainAxisSpacing: 30,
        crossAxisSpacing: 20,
        // childAspectRatio: screenHeight / 1000,
        //   crossAxisCount: 2,
        // crossAxisSpacing: 10, mainAxisSpacing: 1,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // childAspectRatio: 10,
        // mainAxisSpacing: 10,

        children: [

          InkWell(
            onTap: (){
              InitSharedPreferences.getID()==null?
              AwesomeDialog(
                  context: context,
                  dialogType: DialogType.info,
                  animType: AnimType.topSlide,
                  showCloseIcon: true,
                  desc: _language.tAlertinfor(),
                  btnOkText: _language.tbtnYse(),
                  btnOkColor: kblueColor,

                  buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                  btnOkOnPress: (){
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Login()));
                  },
                  btnCancelOnPress: (){}
              ).show():

              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddBasketsPage()));
            },
            child: Material(
                color: Theme.of(context).brightness == Brightness.dark
                    ?  greenColor
                    : greenColor,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        hoverColor: greenColor,
                        onTap: (){
                          InitSharedPreferences.getID()==null?
                          AwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              animType: AnimType.topSlide,
                              showCloseIcon: true,
                              desc: _language.tAlertinfor(),
                              btnOkText: _language.tbtnYse(),
                              btnOkColor: kblueColor,

                              buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                              btnOkOnPress: (){
                                FocusScope.of(context).unfocus();
                                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Login()));
                              },
                              btnCancelOnPress: (){}
                          ).show():

                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddBasketsPage()));
                        },
                        child: Column(
                          children: [

                              Icon(MingCute.truck_line,size: screenWidth / 10, color:kwhait, ),

                            Text(
                              _language.Createreceiptrequest(),style: TextStyle(fontSize:screenWidth / 25,color: kwhait),
                            ),


                          ],
                        )


                    ),

                  ],
                )
            ),
          ),
          InkWell(
            onTap: (){
              AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.topSlide,
                desc: _language.tAlertSoon(),
                btnOkText: _language.tbtnYse(),
                btnOkColor: kblueColor,
                buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                btnOkOnPress: (){
                },
              ).show();
              // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddFound()));
            },
            child: Material(
                color: Theme.of(context).brightness == Brightness.dark
                    ?  Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        hoverColor: greenColor,
                        onTap: (){
                          AwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              animType: AnimType.topSlide,
                              desc: _language.tAlertSoon(),
                              btnOkText: _language.tbtnYse(),
                              btnOkColor: kblueColor,
                              buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                              btnOkOnPress: (){
                              },
                          ).show();
                          // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddFound()));
                        },
                        child: Column(
                          children: [
                              Icon(Icons.map_outlined, color:kblueColor,size: screenWidth / 10, ),
                              // Ink.image(image: AssetImage("images/found.png"),
                            Text(
                              _language.Nearestpoint(),style: TextStyle(fontSize:screenWidth / 25,color: kblueColor),
                            ),


                          ],
                        )
                    ),
                  ],
                )
            ),
          ),
          InkWell(
            onTap: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>PartNersPAge(type_id: 1,)));
            },
            child: Material(
                color: Theme.of(context).brightness == Brightness.dark
                    ?  Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        hoverColor: greenColor,
                        onTap: (){

                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>PartNersPAge(type_id: 1,)));
                        },
                        child: Column(
                          children: [

                              Icon(HeroIcons.building_library , color:kblueColor,size: screenWidth / 10, ),

                            Text(
                              _language.Governmentagencies(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                            ),

                          ],
                        )


                    ),


                  ],
                )
            ),
          ),
          InkWell(
            onTap: () async {

              await Navigator.of(context).push(MaterialPageRoute(builder: (_)=>PartNersPAge(type_id: 2)));
            },
            child: Material(
                color: Theme.of(context).brightness == Brightness.dark
                    ?  Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        hoverColor: greenColor,

                        onTap: () async {

                          await Navigator.of(context).push(MaterialPageRoute(builder: (_)=>PartNersPAge(type_id: 2)));
                        },
                        child: Column(
                          children: [

                              Icon(HeroIcons.user_group, color:kblueColor,size: screenWidth / 10, ),

                            Text(
                              _language.Contractingassociations(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                            ),

                          ],
                        )


                    ),


                  ],
                )
            ),
          ),
          InkWell(
            onTap: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>galleryus()));
            },
            child: Material(
                color: Theme.of(context).brightness == Brightness.dark
                    ?  Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        hoverColor: greenColor,
                        onTap: (){

                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>galleryus()));
                        },
                        child: Column(
                          children: [
                              Icon(Icons.photo_library_outlined, color:kblueColor,size: screenWidth / 10, ),

                            Text(
                              _language.PhotoGallery(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                            ),

                          ],
                        )


                    ),


                  ],
                )
            ),
          ),
          // InkWell(
          //   onTap: (){
          //
          //     launcher.launchUrl(
          //       Uri.parse('mailto:${jsonList[0]['Email']}'),
          //       mode: launcher.LaunchMode.externalApplication,);
          //   },
          //   child: Material(
          //       color: Theme.of(context).brightness == Brightness.dark
          //           ?  Color.fromRGBO(41, 45, 33, 1)
          //           : kwhait,
          //       elevation: 3,
          //       borderRadius: BorderRadius.circular(15),
          //       clipBehavior: Clip.antiAliasWithSaveLayer,
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           InkWell(
          //               hoverColor: greenColor,
          //               onTap: (){
          //
          //                 launcher.launchUrl(
          //                   Uri.parse('mailto:${jsonList[0]['Email']}'),
          //                   mode: launcher.LaunchMode.externalApplication,);
          //               },
          //               child: Column(
          //                 children: [
          //                     Icon(Icons.video_library_outlined, color:kblueColor,size: screenWidth / 10, ),
          //
          //                   Text(
          //                     _language.VideoGallery(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
          //                   ),
          //
          //                 ],
          //               )
          //
          //
          //           ),
          //
          //
          //         ],
          //       )
          //   ),
          // ),
          InkWell(
            onTap: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>con_us()));
              // Navigator.pushNamed(context, "AddFound");
            },
            child: Material(
                color: Theme.of(context).brightness == Brightness.dark
                    ?  Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        hoverColor: greenColor,
                        onTap: (){

                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>con_us()));
                          // Navigator.pushNamed(context, "AddFound");
                        },
                        child: Column(
                          children: [
                            SizedBox(height: 5,),

                              Icon(FontAwesome.at_solid, color:kblueColor,size: screenWidth / 10, ),

                            Text(
                              _language.socialmedia(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                            ),

                          ],
                        )


                    ),


                  ],
                )
            ),
          ),
          InkWell(
            onTap: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>NewsPage()));
            },
            child: Material(
                color: Theme.of(context).brightness == Brightness.dark
                    ?  Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        hoverColor: greenColor,
                        onTap: (){

                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>NewsPage()));
                        },
                        child: Column(
                          children: [

                              Icon(Icons.article_outlined, color:kblueColor,size: screenWidth / 10, ),

                            Text(
                              _language.tnews(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                            ),

                          ],
                        )


                    ),


                  ],
                )
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>aboutpro()));
            },
            child: Material(
                color: Theme.of(context).brightness == Brightness.dark
                    ?  Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        hoverColor: greenColor,
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>aboutpro()));
                        },
                        child: Column(
                          children: [


                              Icon(Icons.info_outline, color:kblueColor,size: screenWidth / 10, ),

                            Text(
                              _language.AboutProject(),style: TextStyle(fontSize:screenWidth / 25,color: kblueColor),
                            ),
                            SizedBox(height: 6,)

                          ],
                        )


                    ),


                  ],
                )
            ),
          ),




        ],

      ),
    )
      ),

          SizedBox(height: 30,)
        ],
      )

    );
  }


}


