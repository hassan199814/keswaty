import 'package:flutter/material.dart';
import 'package:keswaty/String_Extensions.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/data/ini_shard.dart';
import 'package:keswaty/main.dart';



class PersonalData extends StatefulWidget {
  PersonalData( {Key? key,

  }) : super(key: key);


  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  Language _language = Language();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Directionality(
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
          title:  Text(_language.tProfile(),
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

        body: Column(
          children: [
            SizedBox(height: 20,),

            // Consumer<UserProvider>(builder: (context, userdprov, child) {
            //   return userdprov.isloading ? Center(child: CircularProgressIndicator(),) :
              Expanded(
                  flex: 5,
                  child:  ListView(
                    // reverse: true,
                    //   physics: BouncingScrollPhysics(),
                      // itemCount: userdprov.userlist.length,
                      // itemBuilder: (context, index) {
                        children: [
                          Container(
                              child: Column(
                                children: [
                                  Column(
                                      children: [
                                        Container(
                                          width: screenWidth,
                                          padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                                          child: Column(
                                            children: [
                                              Material(
                                                  color: Theme.of(context).brightness == Brightness.dark
                                                      ? Color.fromRGBO(41, 45, 33, 1)
                                                      : kwhait,
                                                  elevation: 2,
                                                  borderRadius: BorderRadius.circular(5),
                                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                                  child:
                                                  Column(
                                                    children: [

                                                      Center(
                                                          child: Column(
                                                            children: [
                                                              Container(

                                                                decoration: BoxDecoration(
                                                                  // borderRadius: BorderRadius.only(
                                                                  //     bottomLeft: Radius.circular(65),
                                                                  //     topLeft: Radius.circular(65)),
                                                                  color:
                                                                  Theme.of(context).brightness == Brightness.dark
                                                                      ? kblueColor
                                                                      : kblueColor,
                                                                ),
                                                                padding: EdgeInsets.only(left: 0,),
                                                                margin: EdgeInsets.only(left: 0,top: 0),


                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [
                                                                    SizedBox(width: 20,),
                                                                    Container(
                                                                      width: 60.0,
                                                                      height: 60.0,
                                                                      margin: const EdgeInsets.only(
                                                                        top: 10.0,
                                                                        bottom: 10.0,
                                                                      ),
                                                                      alignment: Alignment.center,
                                                                      clipBehavior: Clip.antiAlias,
                                                                      decoration: BoxDecoration(
                                                                        gradient: LinearGradient(
                                                                          begin: Alignment.topLeft,
                                                                          end: Alignment.bottomRight,
                                                                          colors: [kblack38.withOpacity(0.5),kblack38.withOpacity(0.5), kblack38.withOpacity(0.5)],
                                                                        ),
                                                                        borderRadius: BorderRadius.circular(20),
                                                                        color: kblack38,
                                                                        // shape: BoxShape.circle,
                                                                      ),
                                                                      child : Text(
                                                                        overflow: TextOverflow.ellipsis,
                                                                        InitSharedPreferences.getNameUser()!.substring(0,1).toUpperCase(),
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontSize: screenWidth / 20,
                                                                            color: Theme.of(context).brightness == Brightness.dark
                                                                                ? kwhait
                                                                                : kwhait,
                                                                        ),
                                                                      ),),
                                                                    SizedBox(width: 15),
                                                                    Column(
                                                                      children: [
                                                                              if(InitSharedPreferences.getNameUser()!=null&&InitSharedPreferences.getNameUser()!.isNotEmpty)
                                                                                Container(
                                                                                  width: screenWidth / 2,
                                                                                  child: Text(InitSharedPreferences.getNameUser()!, style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenWidth / 30,
                                                                                    color: Theme.of(context).brightness == Brightness.dark
                                                                                        ? kwhait
                                                                                        : kwhait,),
                                                                                    overflow: TextOverflow.ellipsis,

                                                                                  ),
                                                                                ),
                                                                              //Text("Hassan alalie",style: TextStyle(color: kblack38,fontWeight: FontWeight.bold,fontSize: 20),),

                                                                      ],
                                                                    ),
                                                                    SizedBox(width: 10),
                                                                  ],
                                                                ) ,
                                                              ),
                                                              // SizedBox(height: 20,),
                                                            ],
                                                          )

                                                      ),
                                                      Container(
                                                        decoration:  BoxDecoration(
                                                          // border: Border(
                                                          //   left:BorderSide(color: kblueColor,width: 5) ,),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            SizedBox(height: 15,),
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SizedBox(width: 15,),
                                                                    Icon(Icons.person_outline_sharp,size: 20,),
                                                                    SizedBox(width: 5),
                                                                    Text(_language.tNamee()),
                                                                  ],
                                                                ),
                                                                const SizedBox(height: 10),
                                                                Row(children: [
                                                                  SizedBox(width: 40),

                                                                  if(InitSharedPreferences.getNameUser()!=null&&InitSharedPreferences.getNameUser()!.isNotEmpty)
                                                                    Flexible(child: Text(
                                                                      InitSharedPreferences.getNameUser()!, style: TextStyle(fontSize: 13,color: kblack38),

                                                                    ))
                                                                ],),
                                                              ],
                                                            ),
                                                            SizedBox(height: 7,),
                                                            buildDivider(),
                                                            SizedBox(height: 7,),
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SizedBox(width: 15,),
                                                                    Icon(Icons.phone_outlined,size: 20,),
                                                                    SizedBox(width: 5),
                                                                    Text(_language.tPhonee()),
                                                                  ],
                                                                ),
                                                                SizedBox(height: 10),
                                                                Row(children: [
                                                                  SizedBox(width: 40),
                                                                  if(InitSharedPreferences.getPhoneUser()!=null&&InitSharedPreferences.getPhoneUser()!.isNotEmpty)
                                                                    Flexible(child: Text(InitSharedPreferences.getPhoneUser().toString(), style: TextStyle(fontSize: 13,color: kblack38),))
                                                                ],),
                                                              ],
                                                            ),
                                                            SizedBox(height: 7,),
                                                            buildDivider(),
                                                            SizedBox(height: 7,),
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SizedBox(width: 15,),
                                                                    Icon(Icons.email_outlined,size: 20,),
                                                                    SizedBox(width: 5),
                                                                    Text(_language.tEmaill()),
                                                                  ],
                                                                ),
                                                                SizedBox(height: 10),
                                                                Row(children: [
                                                                  SizedBox(width: 40),
                                                                  if(InitSharedPreferences.getEmailUser()!=null&&InitSharedPreferences.getEmailUser()!.isNotEmpty)
                                                                    Flexible(child: Text(InitSharedPreferences.getEmailUser()!, style: TextStyle(fontSize: 13,color: kblack38),))
                                                                  //Text("hassan@gmail.com",style: TextStyle(fontSize: 13, color: kblack38)),
                                                                ],),
                                                              ],
                                                            ),
                                                        
                                                            SizedBox(height: 7,),
                                                            buildDivider(),
                                                            SizedBox(height: 7,),

                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SizedBox(width: 15,),
                                                                    Icon(Icons.location_on_outlined,size: 20,),
                                                                    SizedBox(width: 5),
                                                                    Text(_language.tadress()),
                                                                  ],
                                                                ),
                                                                SizedBox(height: 10),
                                                                Row(children: [
                                                                  SizedBox(width: 40),
                                                                  if(InitSharedPreferences.getAddressUser()!=null&&InitSharedPreferences.getAddressUser()!.isNotEmpty)
                                                                    Flexible(child: Text(InitSharedPreferences.getAddressUser()!, style: TextStyle(fontSize: 13,color: kblack38)))
                                                                  //Text("sana'a al jaraf",style: TextStyle(fontSize: 13,color: kblack38)),
                                                                ],),
                                                              ],
                                                            ),


                                                            SizedBox(height: 15,),


                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),

                              


                                        SizedBox(height: 10),

                                      ]
                                  ),

                                ],
                              )
                          )

                        ],







                  )
              ),


            // }
            // )

          ],
        ),





      ),
    );
  }
}
