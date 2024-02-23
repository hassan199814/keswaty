import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/main.dart';

class PartNersPAge extends StatefulWidget {
   PartNersPAge({Key? key,
     required this.type_id
  }) : super(key: key);

  final int type_id;

  @override
  _PartNersPAgeState createState() => _PartNersPAgeState();
}

class _PartNersPAgeState extends State<PartNersPAge> {

  static var jsonList;

  @override
  void  initState() {
    // TODO: implement activate
    super.initState();

    getData();


  }


  Future getData() async{


    var response = await Dio().get('https://keswaty.com/api/partners?type='+widget.type_id.toString());

    try{

      if(response.statusCode==200){

        setState(() {
          jsonList=response.data;


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
    return Directionality(
      textDirection: language == 'AR' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(

          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ?  Color.fromRGBO(33, 37, 25, 1)
              :  Color.fromRGBO(240, 242, 245, 1),

          appBar: AppBar(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ?  Color.fromRGBO(33, 37, 25, 1)
                :  Color.fromRGBO(240, 242, 245, 1),
            elevation: 0,
            title:  Text(Language().Partners(),
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

          body:
          ListView.builder(
              padding: EdgeInsets.all(5),
              itemCount:jsonList==null?0: jsonList.length,
              itemBuilder: (context, int?i)=>
                  Card(

                    margin: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Theme.of(context).brightness == Brightness.dark
                        ?  Color.fromRGBO(33, 37, 25, 1)
                        : kwhait,

                    elevation: 1,
                    child:


                    Row(
                      children: [
                        Container(
                            height: 70,
                             width: 70,
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                 image: NetworkImage('https://keswaty.com/storage/${jsonList[i]['PrntrLogo'].toString()== null?jsonList[i]['PrntrLogo'].toString():jsonList[i]['PrntrLogo'].toString()}',),
                                 fit: BoxFit.cover,
                               ),
                               borderRadius: BorderRadius.only(
                                 bottomRight: language == 'AR' ? Radius.circular(15) : Radius.circular(0),
                                 topRight: language == 'AR' ? Radius.circular(15) : Radius.circular(0),
                                 bottomLeft: language == 'AR' ? Radius.circular(0) : Radius.circular(15),
                                 topLeft: language == 'AR' ? Radius.circular(0) : Radius.circular(15),
                               ),
                             ),

                           ),

                        // CircleAvatar(
                        //
                        //   radius: screenWidth /10,
                        //   backgroundImage: NetworkImage('https://keswaty.com/storage/${jsonList[i]['PrntrLogo'].toString()== null?jsonList[i]['PrntrLogo'].toString():jsonList[i]['PrntrLogo'].toString()}',),
                        //
                        // ),

                        Flexible(
                          child: Column(

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      jsonList[i]['PrntrName'].toString(),
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenWidth/25),
                                    ),
                                  )
                                ],
                              ),
                        )
                     
                      ],
                    ) ,


                  )






          )
      ),
    );


  }
}
