import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/main.dart';
class aboutpro extends StatefulWidget {
  const aboutpro({Key? key}) : super(key: key);
  @override
  _aboutproState createState() => _aboutproState();
}
class _aboutproState extends State<aboutpro> {

  Language _language = Language();

  @override
  Widget build(BuildContext context) {
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
          title:  Text(_language.taboutapp(),
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
       body: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Container(
               padding: EdgeInsets.fromLTRB(28, 35, 10, 15),
               child: Text( 'تطبيق كسوتي لجمع التبرعات',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)
                 ),

             ),
             Container(
               padding: EdgeInsets.only(right: 10,left: 10),
               child: Text( 'كسوتي هو تطبيق خيري يهدف إلى تسهيل عملية التبرع للجمعيات الخيرية في المملكة العربية السعودية. التطبيق متاح على أجهزة iOS وAndroid، ويقدم واجهة سهلة الاستخدام للتعامل مع عمليات التبرع',style:TextStyle(fontSize: 18)
                 ),

             ),
             SizedBox(height: 20),
             Container(
               padding: EdgeInsets.only(right: 10,left: 10),
               child: Text( 'مميزات التطبيق:',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)
                 ),

             ),
             SizedBox(height: 10),
             Container(
               padding: EdgeInsets.only(right: 10,left: 10),
               child: Text( '•	سهولة الاستخدام: يمكن للمتبرعين طلب استلام التبرعات من خلال التطبيق بسهولة، مع إمكانية تحديد الموقع والوقت المناسبين.',style:TextStyle(fontSize: 18)
                 ),

             ),Container(
               padding: EdgeInsets.only(right: 10,left: 10),
               child: Text( '•	التغطية الواسعة: يغطي التطبيق جميع أنحاء المملكة العربية السعودية، مما يسهل الوصول إلى أكبر عدد من المحتاجين.',style:TextStyle(fontSize: 18)
                 ),

             ),Container(
               padding: EdgeInsets.only(right: 10,left: 10),
               child: Text( '•	المساهمة في حماية البيئة: يساهم التطبيق في تقليل النفايات النسيجية من خلال إعادة استخدام الملابس المستعملة وغيرها.',style:TextStyle(fontSize: 18)
                 ),

             ),
             SizedBox(height: 20),
             Container(
               padding: EdgeInsets.only(right: 10,left: 10),
               child: Text( 'كيف يعمل التطبيق؟',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)
                 ),

             ),
             SizedBox(height: 10),

             Container(
               padding: EdgeInsets.only(right: 10,left: 10),
               child: Text( '•	طلب استلام تبرع: يقوم المتبرع بتقديم طلب استلام التبرعات عن طريق انشاء طلب استلام من خلال التطبيق، مع تحديد الموقع والوقت المناسبين.',style:TextStyle(fontSize: 18)
               ),

             ), Container(
               padding: EdgeInsets.only(right: 10,left: 10),
               child: Text( '•	استلام التبرع: يصلك مندوب كسوتي لباب منزلك لاستلام التبرعات خلال 24 ساعة.',style:TextStyle(fontSize: 18)
               ),

             ),Container(
               padding: EdgeInsets.only(right: 10,left: 10),
               child: Text( '•	دعم الجمعيات الخيرية: يتم توزيع التبرعات الصالحة على الجمعيات الخيرية المتعاقدة مع كسوتي.',style:TextStyle(fontSize: 18)
               ),

             ),

             SizedBox(height: 30),


             Container(
               padding: EdgeInsets.only(right: 10,left: 10),
               child: Text( _language.trights(),
                   textAlign: TextAlign.center,
                   style:TextStyle(fontSize: 12,color: kblack38)
               ),

             ),

             SizedBox(height: 20),

           ],
         ),
       ),
      ),
    );
  }
}

