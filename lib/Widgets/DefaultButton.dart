import 'package:flutter/material.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press, required this.icon, required this.bkground, required this.txtstyle,
  })
      : super(key: key);

  final String text;
  final  VoidCallback press;
  final Icon icon;
  final Color bkground;
  final TextStyle txtstyle;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // width: double.infinity,
        height: 45,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: bkground,
              fixedSize: const Size(100, 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              )
          ),

          icon:icon,
            onPressed: press,
          label: Text(
            text,
              style: txtstyle

          ),

        )
    );

  }
}