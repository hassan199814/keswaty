import 'package:flutter/material.dart';
import 'package:keswaty/Widgets/colors.dart';

import '../../Sgin_up/sgin_up.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key, required this.text1, required this.text2,
  }) : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            text1,style: TextStyle(fontSize: 15,color: kblack38),textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: ()=> {

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SginUpPage(),))
          },
          child:Flexible(
            child: Text(
              text2,style: TextStyle(fontSize: 15,color: kblueColor),
            ),
          ),
        ),
      ],
    );
  }
}