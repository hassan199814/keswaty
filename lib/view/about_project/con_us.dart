import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/main.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;




class con_us extends StatefulWidget {
  const con_us({super.key});

  @override
  _con_usState createState() => _con_usState();
}

class _con_usState extends State<con_us> {

  final Language _language = Language();

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
    return Directionality(
      textDirection: language == 'AR' ? TextDirection.rtl: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ?  const Color.fromRGBO(33, 37, 25, 1)
            :  const Color.fromRGBO(240, 242, 245, 1),
        appBar: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ?  const Color.fromRGBO(33, 37, 25, 1)
              :  const Color.fromRGBO(240, 242, 245, 1),
          elevation: 0,
          title:  Text("",
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
                    :  kblueColor),),),


        body: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [


        // Consumer<InsertLostFoundProvider>(builder: (context, lostfound, child) {
        //   return lostfound.isloading ? Center(child: CircularProgressIndicator(),) :


        Container(
        child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        // padding: EdgeInsets.only(bottom: 70),
        decoration: const BoxDecoration(

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
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          children: [

            InkWell(
              onTap: () {
                launcher.launchUrl(
                  Uri.parse('tel:${jsonList[0]['PhoneNo']}'),
                  mode: launcher.LaunchMode.externalApplication,);
              },
              child: Material(
                  color: Theme
                      .of(context)
                      .brightness == Brightness.dark
                      ? const Color.fromRGBO(41, 45, 33, 1)
                      : kwhait,
                  elevation: 3,
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          hoverColor: greenColor,
                          onTap: () {
                            launcher.launchUrl(
                              Uri.parse('tel:${jsonList[0]['PhoneNo']}'),
                              mode: launcher.LaunchMode.externalApplication,);
                          },
                          child: Column(
                            children: [
                                Icon(Icons.call, color: kblueColor,size: screenWidth / 10),

                              Text(
                                _language.call(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                              ),

                            ],
                          )


                      ),


                    ],
                  )
              ),
            ), //phone
            InkWell(
              onTap: () {
                launcher.launchUrl(
                  Uri.parse('tel:${jsonList[0]['CSPhoneNo']}'),
                  mode: launcher.LaunchMode.externalApplication,);
                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddFound()));
              },
              child: Material(
                  color: Theme
                      .of(context)
                      .brightness == Brightness.dark
                      ? const Color.fromRGBO(41, 45, 33, 1)
                      : kwhait,
                  elevation: 3,
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          hoverColor: greenColor,
                          onTap: () {
                            launcher.launchUrl(
                              Uri.parse('tel:${jsonList[0]['CSPhoneNo']}'),
                              mode: launcher.LaunchMode.externalApplication,);
                            // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddFound()));
                          },
                          child: Column(
                            children: [

                                Icon(FontAwesome.headset_solid, color: kblueColor,size: screenWidth / 10),
                              Text(
                                _language.supp(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                              ),


                            ],
                          )


                      ),


                    ],
                  )
              ),
            ),
            InkWell(
              onTap: () {
                launcher.launchUrl(
                  Uri.parse('https://${jsonList[0]['WTSURL'].toString()}'),
                  mode: launcher.LaunchMode.externalApplication,);

              },
              child: Material(
                  color: Theme
                      .of(context)
                      .brightness == Brightness.dark
                      ? const Color.fromRGBO(41, 45, 33, 1)
                      : kwhait,
                  elevation: 3,
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          hoverColor: greenColor,
                          onTap: () {
                            launcher.launchUrl(
                              Uri.parse('https://${jsonList[0]['WTSURL'].toString()}'),
                              mode: launcher.LaunchMode.externalApplication,);

                          },
                          child: Column(
                            children: [
                                Icon(FontAwesomeIcons.squareWhatsapp, color: kblueColor,size: screenWidth / 10,),
                              Text(
                                _language.whatsapp(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                              ),

                            ],
                          )
                      ),


                    ],
                  )
              ),
            ),
            InkWell(
              onTap: () {
                launcher.launchUrl(
                  Uri.parse('https://${jsonList[0]['FBURL']}'),
                  mode: launcher.LaunchMode.externalApplication,);
                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddFound()));
              },
              child: Material(
                  color: Theme
                      .of(context)
                      .brightness == Brightness.dark
                      ? const Color.fromRGBO(41, 45, 33, 1)
                      : kwhait,
                  elevation: 3,
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          hoverColor: greenColor,
                          // splashColor: Colors.black26,
                          onTap: () {
                            launcher.launchUrl(
                              Uri.parse('https://${jsonList[0]['FBURL']}'),
                              mode: launcher.LaunchMode.externalApplication,);
                            // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddFound()));
                          },
                          child: Column(
                            children: [
                                Icon(FontAwesomeIcons.squareFacebook, color: kblueColor,size: screenWidth / 10,),
                              Text(
                                _language.FB(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                              ),

                            ],
                          )


                      ),


                    ],
                  )
              ),
            ),


            InkWell(
              onTap: () {
                launcher.launchUrl(
                  Uri.parse('https://${jsonList[0]['TWURL']}'),
                  mode: launcher.LaunchMode.externalApplication,);
                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddFound()));
              },
              child: Material(
                  color: Theme
                      .of(context)
                      .brightness == Brightness.dark
                      ? const Color.fromRGBO(41, 45, 33, 1)
                      : kwhait,
                  elevation: 3,
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          hoverColor: greenColor,
                          onTap: () {
                            launcher.launchUrl(
                              Uri.parse('https://${jsonList[0]['TWURL']}'),
                              mode: launcher.LaunchMode.externalApplication,);
                            // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddFound()));
                          },
                          child: Column(
                            children: [

                                Icon(FontAwesome.square_x_twitter_brand, color: kblueColor,size: screenWidth / 10,),

                              Text(
                                _language.X(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                              ),

                            ],
                          )


                      ),


                    ],
                  )
              ),
            ),

            InkWell(
              onTap: () {
                launcher.launchUrl(
                  Uri.parse('https://${jsonList[0]['SNAPURL'].toString()}'),
                  mode: launcher.LaunchMode.externalApplication,);
              },
              child: Material(
                  color: Theme
                      .of(context)
                      .brightness == Brightness.dark
                      ? const Color.fromRGBO(41, 45, 33, 1)
                      : kwhait,
                  elevation: 3,
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          hoverColor: greenColor,
                          onTap: () {
                            launcher.launchUrl(
                              Uri.parse('https://${jsonList[0]['SNAPURL'].toString()}'),
                              mode: launcher.LaunchMode.externalApplication,);
                          },
                          child: Column(
                            children: [

                                Icon(FontAwesomeIcons.squareSnapchat, color: kblueColor,size: screenWidth / 10,),

                              Text(
                                _language.Snapchat(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                              ),


                            ],
                          )


                      ),


                    ],
                  )
              ),
            ),
            InkWell(
              onTap: () {
                launcher.launchUrl(
                  Uri.parse('https://${jsonList[0]['INSTAURL'].toString()}'),
                  mode: launcher.LaunchMode.externalApplication,);
              },
              child: Material(
                  color: Theme
                      .of(context)
                      .brightness == Brightness.dark
                      ? const Color.fromRGBO(41, 45, 33, 1)
                      : kwhait,
                  elevation: 3,
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          hoverColor: greenColor,
                          onTap: () {
                            launcher.launchUrl(
                              Uri.parse('https://${jsonList[0]['INSTAURL'].toString()}'),
                              mode: launcher.LaunchMode.externalApplication,);
                          },
                          child: Column(
                            children: [

                              Icon(FontAwesomeIcons.squareInstagram, color: kblueColor,size: screenWidth / 10,),

                              Text(
                                _language.instagram(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                              ),

                            ],
                          )
                      ),


                    ],
                  )
              ),
            ),
            InkWell(
              onTap: () {
                launcher.launchUrl(
                  Uri.parse('https://${jsonList[0]['YTURL'].toString()}'),
                  mode: launcher.LaunchMode.externalApplication,);
              },
              child: Material(
                  color: Theme
                      .of(context)
                      .brightness == Brightness.dark
                      ? const Color.fromRGBO(41, 45, 33, 1)
                      : kwhait,
                  elevation: 3,
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          hoverColor: greenColor,
                          onTap: () {
                            launcher.launchUrl(
                              Uri.parse('https://${jsonList[0]['YTURL'].toString()}'),
                              mode: launcher.LaunchMode.externalApplication,);
                          },
                          child: Column(
                            children: [

                              Icon(FontAwesomeIcons.youtube, color: kblueColor,size: screenWidth / 10,),

                              Text(
                                _language.youtube(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                              ),


                            ],
                          )


                      ),


                    ],
                  )
              ),
            ),

            InkWell(
              onTap: () {
                launcher.launchUrl(
                  Uri.parse('mailto:${jsonList[0]['Email']}'),
                  mode: launcher.LaunchMode.externalApplication,);
                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddFound()));
              },
              child: Material(
                  color: Theme
                      .of(context)
                      .brightness == Brightness.dark
                      ? const Color.fromRGBO(41, 45, 33, 1)
                      : kwhait,
                  elevation: 3,
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          hoverColor: greenColor,
                          onTap: () {
                            launcher.launchUrl(
                              Uri.parse('mailto:${jsonList[0]['Email']}'),
                              mode: launcher.LaunchMode.externalApplication,);
                            // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddFound()));
                          },
                          child: Column(
                            children: [

                              Icon(HeroIcons.envelope, color: kblueColor,size: screenWidth / 10,),

                              Text(
                                _language.mail(),style: TextStyle(fontSize: screenWidth / 25,color: kblueColor),
                              ),
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

              const SizedBox(height: 5,)
            ],
        )

      ),
    );
  }


}