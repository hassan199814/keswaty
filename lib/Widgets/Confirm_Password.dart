import 'package:flutter/material.dart';
import 'package:keswaty/String_Extensions.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({Key? key}) : super(key: key);



  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  bool obscurePassWord = true;
  late String password;
  late String confrom_password;

  final List<String> errors =[];

  void addError({required String error}){
    if(!error.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removError({required String error}){
    if(!error.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (newValue) => confrom_password = newValue!,

      onChanged: (value){
        if(password == confrom_password){
          removError(error: KMatchPassError);
        }
        return null;
      },

      validator: (value){
        if (value!.isEmpty){
          return"";
        }
        else if(password != value){
          addError(error: KMatchPassError);
          return"";
        }
        return null;
      },






      // validator: (s) {
      //   if (s!.isEmpty) {
      //     return "This is a required field";
      //   }
      //   else if (s.length < 8) {
      //     return "The password must not be less than 8 characters";
      //   }
      //   else if (password != confrom_password) {
      //     return " ليس متطابق";
      //   }
      //   else {
      //     password == confrom_password;
      //     return"";
      //   }
      // },

      obscureText: obscurePassWord,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "Confirm Password",
        helperText: "",
        hintText: "Re-enter your password",

        suffixIcon: IconButton(
          onPressed: () => setState(() => obscurePassWord = !obscurePassWord),
          icon: Icon(
            obscurePassWord ? Icons.visibility : Icons.visibility_off,
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
