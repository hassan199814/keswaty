import 'package:flutter/material.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';


class PassWordField extends StatefulWidget {
   PassWordField({required this.controller1 ,Key? key}) : super(key: key);
  TextEditingController controller1  ;
  @override
  State<PassWordField> createState() => PassWordFieldState();
}

class PassWordFieldState extends State<PassWordField> {

  // final _formkey = GlobalKey<FormState>();


  bool obscurePassWord = true;
  late String password;
  late String confrom_password;

  // final List<String> errors =[];
  //
  // void addError({required String error}){
  //   if(!error.contains(error))
  //     setState(() {
  //       errors.add(error);
  //     });
  // }
  //
  // void removError({required String error}){
  //   if(!error.contains(error))
  //     setState(() {
  //       errors.remove(error);
  //     });
  // }
  final Language _language = Language();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller1,
      onSaved: (newValue) => password = newValue!,
      validator: (value){
        if (value!.isEmpty){

          return _language.tPleaseEnteryourpassword();
        }
        else if(value.length < 8){

          return _language.tPasswordistooshort();
        }
        password = value;
        return null;
      },
      obscureText: obscurePassWord,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: _language.tpassword(),
        helperText: "",
        hintText: _language.tPleaseEnteryourpassword(),hintStyle: TextStyle(fontSize: 10),

        suffixIcon: IconButton(
          onPressed: () => setState(() => obscurePassWord = !obscurePassWord),
          icon: Icon(
            obscurePassWord ? Icons.visibility : Icons.visibility_off,
            color: kblack38,
          ),
        ),
      ),
    );
  }
}
