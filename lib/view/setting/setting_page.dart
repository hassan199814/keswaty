    import 'package:flutter/material.dart';
    import 'package:keswaty/Widgets/colors.dart';
    import 'package:keswaty/Widgets/langage.dart';
    import 'package:keswaty/main.dart';
    import 'package:keswaty/view/setting/setting_widgets/setting_page_body.dart';




    class SettingPage extends StatefulWidget {
    const SettingPage({super.key});

    @override
    State<SettingPage> createState() => _SettingPageState();
    }

    class _SettingPageState extends State<SettingPage> {

    final Language _language = Language();

    @override
    Widget build(BuildContext context) {
    return Directionality(
    textDirection: language == 'AR' ? TextDirection.rtl : TextDirection.ltr,

    child: Scaffold(
    backgroundColor:
    Theme.of(context).brightness == Brightness.dark
    ?  const Color.fromRGBO(33, 37, 25, 1)
        :  const Color.fromRGBO(240, 242, 245, 1),
    appBar: AppBar(
    backgroundColor: Theme.of(context).brightness == Brightness.dark
    ?  const Color.fromRGBO(33, 37, 25, 1)
        :  const Color.fromRGBO(240, 242, 245, 1),
    elevation: 0,
    title:  Text(_language.tSettings(),
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
         body: ListView(
             children: const [

               SettingPageBody(),



             ]
         ),
      ),
    );
  }
  String selectedLanguage(){
    if (_language.getLanguage() == 'AR'){
      return 'Arabic';

    }else if (_language.getLanguage() == 'EN'){
      return 'English';
    } else {
      return 'English';
    }
  }
}

