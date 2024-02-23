// import 'package:flutter/material.dart';
// import '../../../widgets/Colors.dart';
//
// class ProfileMenu extends StatelessWidget {
//   const ProfileMenu({
//     Key? key,
//     required this.text,
//     required this.kicon,
//     required this.press, required this.colorr, required this.txtStyle, required this.iconstyle,
//   }) : super(key: key);
//
//   final String text;
//   final Icon kicon;
//   final VoidCallback press;
//   final Color colorr;
//   final TextStyle txtStyle;
//   final Icon iconstyle;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
//       child: Container(
//         padding: EdgeInsets.all(2),
//         child: Column(
//           children: [
//             Material(
//               elevation: 8,
//               borderRadius: BorderRadius.circular(5),
//               clipBehavior: Clip.antiAliasWithSaveLayer,
//               child: InkWell(
//                 onTap: () => press,
//
//                 child: Container(
//                   decoration:  BoxDecoration(
//                       border: Border(
//                         left:BorderSide(color: kblueColor,width: 10) ,)
//                   ),
//                   child:  Column(
//                     children: [
//                       SizedBox(height: 15,),
//                       Row(
//                         children: [
//                           SizedBox(width: 7),
//                           kicon,
//                           SizedBox(width: 20),
//                           Expanded(child: Text(
//                             text,
//                             style: txtStyle,
//                           )
//                           ),
//                           iconstyle,
//                           SizedBox(width: 7),
//
//                         ],
//                       ),
//                       SizedBox(height: 15,),
//                     ],
//                   ) ,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }