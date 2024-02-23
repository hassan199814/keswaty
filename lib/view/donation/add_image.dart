

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keswaty/Widgets/colors.dart';

class AddImage extends StatefulWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {

  File? image;
  final imagepicker = ImagePicker();
  // late InsertLostFoundProvider inserProvider ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // inserProvider= Provider.of<InsertLostFoundProvider>(context,listen: false);
  }
  // دوال تحميل الصور من الاستوديو والكيمرا
  // uploadImage() async {
  //   var pickedImage = await  imagepicker.getImage(source: ImageSource.gallery);
  //   if (pickedImage != null){
  //     setState ((){
  //       image = File(pickedImage.path);
  //     });
  //     Navigator.pop(context);
  //   }
  //   else {
  //   }
  // }
  uploadImage2() async {

    // await inserProvider.pickImage(false,isCamara: true);
    //
    // if (inserProvider.pickedLogo != null) {
    //   setState(() {
    //     image = File(inserProvider.pickedLogo!.path);
    //   });
    //   Navigator.pop(context);
    // }
    // else {
    //
    // }
  }
  uploadImage() async {

    // await inserProvider.pickImage(false);
    // if (inserProvider.pickedLogo != null) {
    //   setState(() {
    //     image = File(inserProvider.pickedLogo!.path);
    //   });
    //   Navigator.pop(context);
    // }
    // else {
    //
    // }
  }
  _showOption(BuildContext context){
    return showDialog(context: context, builder: (context)=>
        AlertDialog(
          title: Text("Make a choice"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text('Gallery'),
                  onTap:() => uploadImage(),// uploadImage(),
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt_outlined),
                  title: Text('Camera'),
                  onTap:() => uploadImage2(),
                ),
              ],
            ),
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 120,
      width: 120,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            child:InkWell(
                onTap: () => _showOption(context),
                child:Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kblack38)
                    ),
                    // child: Center(
                    //     child:Consumer<InsertLostFoundProvider>(builder: (context, value, child) =>     Container(
                    //       child:
                    //       inserProvider.pickedLogo == null ? Icon(Icons.cloud_download_outlined,color: kblack38,size: 60,) :
                    //       Image.file(File(inserProvider.pickedLogo!.path)),
                    //     ),)
                    //
                    // )
                )
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 30,
              width: 30,
              child: InkWell(
                onTap: () {
                  _showOption(context);
                },
                child:Container(

                  // child: Icon(
                  //   Icons.camera_alt_outlined,
                  //   size: 25,
                  //   color: kblack38,
                  // ),

                ),
              ),

            ),
          )
        ],
      ),
    );
  }
}
