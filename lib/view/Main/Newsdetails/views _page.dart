import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/constant.dart';
import 'package:keswaty/main.dart';

class v_page extends StatefulWidget {
  v_page(
      {Key? key,
      required this.imge,
      required this.titel,
      required this.content,
      required this.Section})
      : super(key: key) {
    // TODO: implement v_page
  }

  String imge;
  String titel;
  String content;
  int Section;

  @override
  _v_pageState createState() => _v_pageState();
}

class _v_pageState extends State<v_page> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == 'AR' ? TextDirection.rtl : TextDirection.ltr,

      child: Directionality(
        textDirection: language == 'AR' ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ?  Color.fromRGBO(33, 37, 25, 1)
              :  Color.fromRGBO(240, 242, 245, 1),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ?  Color.fromRGBO(33, 37, 25, 1)
                    :  Color.fromRGBO(240, 242, 245, 1),
                    // pinned: true,
                collapsedHeight: 300,
                floating: true,
                stretch: true,


                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),

                      child: CachedNetworkImage(
                        placeholder: (ctx, url) => Image.asset(AppConstants.image),
                        // fit: BoxFit.cover,
                        errorWidget: (ctx, url, err) =>
                            Image.asset(AppConstants.image,
                              // fit: BoxFit.cover,

                            ),
                        imageUrl: '${AppConstants.BASE_URL}${AppConstants.DONATION_PIC_PATH}'+widget.imge,
                      ),
                    )
                  ),
                ),
              ),

              Directionality(
                textDirection: language == 'AR' ? TextDirection.rtl : TextDirection.ltr,
                child: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: 3,
                      ),
                      ListTile(
                        title: Text(

                          widget.titel,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: kblueColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          textAlign: language == 'AR' ? TextAlign.right : TextAlign.left,
                          widget.content,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
