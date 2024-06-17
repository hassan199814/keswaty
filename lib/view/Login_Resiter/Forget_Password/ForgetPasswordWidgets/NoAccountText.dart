import 'package:flutter/material.dart';
import 'package:keswaty/Widgets/colors.dart';

import '../../Sgin_up/sgin_up.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key, required this.text1, required this.text2,
  });

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,style: const TextStyle(fontSize: 10,color: kblack38),textAlign: TextAlign.center,
        ),
        GestureDetector(
          onTap: ()=> {

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SginUpPage(),))
          },
          child:Text(
            text2,style: const TextStyle(fontSize: 15,color: kblueColor),
          ),
        ),
      ],
    );
  }
}