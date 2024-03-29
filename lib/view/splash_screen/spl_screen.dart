
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keswaty/view/navigationbar/nav.dart';



class splsh extends StatelessWidget {
  const splsh({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   useMaterial3: true,
      // ),
      home: const mysplsh(),
    );
  }
}

class mysplsh extends StatefulWidget {
  const mysplsh({Key? key}) : super(key: key);

  @override
  State<mysplsh> createState() => _mysplshState();
}

class _mysplshState extends State<mysplsh> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: AnimatedSplashScreen(
        splash: Theme
          .of(context)
          .brightness == Brightness.dark
          ? Image.asset('assets/images/splshblack.gif'):Image.asset('assets/images/splshwhite.gif'),
        nextScreen: nav(),
        duration: 2300,
        backgroundColor:  Theme
            .of(context)
            .brightness == Brightness.dark?Colors.black:Colors.white,
        splashIconSize: double.infinity,


      )
    );
  }


}

