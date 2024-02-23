import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/main.dart';


class galleryus extends StatefulWidget {
  const galleryus({Key? key}) : super(key: key);

  @override
  _galleryusState createState() => _galleryusState();
}

class _galleryusState extends State<galleryus> {
  Language _language = Language();
   static var storage;
  static var jsonList;

  @override
  void initState() {
    // TODO: implement activate
    super.initState();
    getData();

  }
  void getData() async{
    try{


      var response = await Dio().get('https://keswaty.com/api/gallery');
      storage='https://keswaty.com/storage/';



      if(response.statusCode==200){

        setState(() {
          jsonList =response.data;

        });
      }





    }catch(e){
      print(e);
    }

  }


  @override
  Widget build(BuildContext context) {


    return  Directionality(
      textDirection: language == 'AR' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.dark
            ? Color.fromRGBO(33, 37, 25, 1)
            : Color.fromRGBO(240, 242, 245, 1),
          appBar: AppBar(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ?  Color.fromRGBO(33, 37, 25, 1)
                :  Color.fromRGBO(240, 242, 245, 1),
            elevation: 0,
            title:  Text(_language.Gallery(),
                style: TextStyle(
                    color:Theme.of(context).brightness == Brightness.dark
                        ?  kwhait
                        :  kblueColor,
                    fontSize: 15)
            ),
            leading: IconButton(
              onPressed: (){Navigator.pop(context);},
              icon: Icon( Icons.arrow_back,
                  color:Theme.of(context).brightness == Brightness.dark
                      ?  kwhait
                      :  kblueColor),
            ),
          ),
          body: ListView.builder(
              itemCount: _galleryusState.jsonList==null?0: _galleryusState
                  .jsonList.length,
              itemBuilder: (context, i) =>
                  Container(padding: const EdgeInsets.all(3.0),
                    child:
                        Column(

                          children: [
                            Container(
                              child: Card(
                                color: Theme
                                    .of(context)
                                    .brightness == Brightness.dark
                                    ? Color.fromRGBO(41, 45, 33, 1)
                                    : kwhait,


                                child: Column(
                                  children: [
                                    Image.network('${_galleryusState.storage}${_galleryusState.jsonList[i]['PostPic'].toString()}', height: 250,
                                        width: MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover),
                                    Padding(padding: EdgeInsets.all(2),
                                        child: Column(
                                          children: [
                                            Text(_galleryusState.jsonList[i]['PostTitle'].toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 10,),
                                          ],
                                        )
                                    )
                                  ],
                                ),
                                elevation: 1,
                                margin: const EdgeInsets.all(0.5),
                              ),
                              width: double.infinity,
                              margin: const EdgeInsets.all(0.5),
                            )

                          ],
                        )


                  )



          ),),

    );
  }
}



