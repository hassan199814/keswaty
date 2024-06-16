import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keswaty/Widgets/colors.dart';



class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {

  File? image;
  final imagepicker = ImagePicker();

  // دوال تحميل الصور من الاستوديو والكيمرا

  uploadImage() async {
    var pickedImage = await  imagepicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null){
      setState ((){
        image = File(pickedImage.path);
      });
      Navigator.pop(context);
    }
    else {
    }
  }
  uploadImage2() async {
    var pickedImage = await imagepicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
      Navigator.pop(context);
    }
    else {
    }
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
                  onTap:() => uploadImage(),
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
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child:
              Column(
                children: [
                SizedBox(
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
                              borderRadius: BorderRadius.circular(20),
                            //  border: Border.all(color: kblueColor),
                            //  color: kblueColor
                            //shape: BoxShape.circle,
                          ),
                          child: Center(
                            child : Container(
                              child:
                              image == null ? Icon(Icons.person,size: 80,color: kblueColor,) :
                              Image.file(image!),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child:InkWell(
                          onTap: () {
                            _showOption(context);
                          },
                          child:Container(

                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 20,
                              color: kblack38,
                            ),
                          ) ,
                        ),

                      ),
                    )
                  ],
                ),
              ),
                ],
              )
          ),
        ],
      ),
    );



  }
}


