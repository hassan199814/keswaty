import 'package:flutter/material.dart';
import 'package:keswaty/String_Extensions.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';

class EmailField extends StatefulWidget {

  TextEditingController controller1;
   EmailField({
     required this.controller1,
    Key? key,
  }) : super(key: key);

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  final Language _language = Language();

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
      controller: widget.controller1,
      keyboardType: TextInputType.emailAddress,
      validator: (s) {
        if (!s!.isValidEmail()){
          return _language.tPleaseEnterValidEmail() ;
        }
        return null;
      },
      decoration:  InputDecoration(
        labelText: _language.temail(),
        helperText: "",
        hintText: _language.tEnterYourEmail(),hintStyle: TextStyle(fontSize: 10),
        suffixIcon: Icon(Icons.email_outlined, color:kblack38)
      ),
    );
  }
}
