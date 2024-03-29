import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/constant.dart';
import 'package:keswaty/controller/main_gellary_provider.dart';
import 'package:keswaty/main.dart';
import 'package:keswaty/view/Main/Newsdetails/views%20_page.dart';
import 'package:keswaty/view/Main/gallery/gallery.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // final _advancedDrawerController = AdvancedDrawerController();

  //

  int index = 0;

  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // _load();
  //
  //   // setState(() => _language.getLanguage());
  // }

  Language _language = Language();

  void initState() {

    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MainGellaryProvider>(context, listen: false).getgellarymain();
      Provider.of<MainGellaryProvider>(context, listen: false).getnews();
    });
  }

  // var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Color.fromRGBO(33, 37, 25, 1)
          : Color.fromRGBO(240, 242, 245, 1),
      body: RefreshIndicator(
        onRefresh: ()async{
         await Provider.of<MainGellaryProvider>(context, listen: false).getgellarymain();
         await Provider.of<MainGellaryProvider>(context, listen: false).getnews();
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            // LostFoundAppBAr(name: ""),
            Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Color.fromRGBO(33, 37, 25, 1)
                  : Color.fromRGBO(240, 242, 245, 1),
              child: Column(
                children: [


                  Consumer<MainGellaryProvider>(
                    builder: (context, gellarypro, child) {
                      return gellarypro.isloading
                          ? Center()
                          : gellarypro.gellaryList.length == 0
                              ? Center(
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text(_language.NoPicFound())],
                                ))
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 0),
                                          child: Row(
                                            children: [
                                              // VerticalDivider(),
                                              Material(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Color.fromRGBO(
                                                          41, 45, 33, 1)
                                                      : Color.fromRGBO(
                                                          240, 242, 245, 1),
                                                  elevation: 0,
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  clipBehavior:
                                                      Clip.antiAliasWithSaveLayer,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.black26,
                                                        onTap: () {
                                                           Navigator.of(context).push(MaterialPageRoute(builder: (_) => galleryus()));
                                                          // Navigator.pushNamed(context, "AddFoundLost");
                                                        },
                                                        child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .transparent,
                                                              // border: Border.all(color: kblueColor),
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius.circular(0),
                                                                  topLeft: Radius.circular(0)),
                                                            ),
                                                            child: Container(
                                                              height: screenheight / 3.5,
                                                              width: screenWidth,
                                                              child: Swiper(
                                                                autoplay: true,
                                                                allowImplicitScrolling:
                                                                    true,
                                                                itemBuilder:(BuildContextcontext, int index) {
                                                                  return
                                                                    gellarypro.gellaryList.length != 0
                                                                      ? CachedNetworkImage(placeholder: (ctx, url) =>
                                                                      Image.asset(AppConstants.image),
                                                                          height: 250,
                                                                          fit: BoxFit.cover,
                                                                          width: screenWidth,
                                                                          errorWidget: (ctx, url, err) => Image.asset(AppConstants.image,
                                                                            fit: BoxFit.cover,
                                                                            height: 200,

                                                                          ),
                                                                          imageUrl: '${AppConstants.BASE_URL}${AppConstants.DONATION_PIC_PATH}${gellarypro.gellaryList[index].postPic}',
                                                                        )
                                                                      : Image.asset('{AppConstants.image}');
                                                                },
                                                                itemCount: gellarypro.gellaryList.length > 5 ?  5 : gellarypro.gellaryList.length,
                                                                viewportFraction:
                                                                    1,
                                                                scale: 0.3,
                                                              ),
                                                            )),
                                                      ),

                                                      //
                                                    ],
                                                  )),
                                            ],
                                          )),
                                    ],
                                  ),
                                );
                    },
                  ),


                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(_language.tnews(),
                          style: TextStyle(
                              fontSize: 20,
                              color: kblueColor,
                              fontWeight: FontWeight.bold))
                    ],
                  ),

                  Consumer<MainGellaryProvider>(builder: (context, newsypro, child) {
                      return newsypro.isloading
                          ? Center(child: CircularProgressIndicator(),)
                          : newsypro.newslist.length == 0
                              ? Center(
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text(_language.NoNews())],
                                ))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: newsypro.newslist.length > 6 ? 6 : newsypro.newslist.length,
                                  itemBuilder: (context, index) {
                                    return

                                      SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          children: [

                                            SizedBox(
                                              height: 7,
                                            ),
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>v_page(
                                                content: newsypro.newslist[index].contnt.toString(),
                                                imge: newsypro.newslist[index].cvrImg.toString(),
                                                Section: newsypro.newslist[index].sectn!,
                                                titel: newsypro.newslist[index].hdLine.toString()


                                            )
                                            )
                                            );

                                          },
                                          child: Card(
                                            color: Theme.of(context).brightness == Brightness.dark
                                                ? Color.fromRGBO(35, 40, 30, 1)
                                                : kCamera,

                                            elevation: 0,
                                            margin: EdgeInsets.all(0),
                                            child: Column(
                                              children: [


                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Column(
                                                        children: [

                                                          SizedBox(height: 10),
                                                          //العنوان
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 15,
                                                              ),
                                                              Flexible(
                                                                child: Text(
                                                                  newsypro.newslist[index].hdLine.toString(),
                                                                  maxLines: 1,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.justify,
                                                                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 3),

                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 15,
                                                              ),
                                                              Container(
                                                                  padding: EdgeInsets.only(left: 5,right: 5),
                                                                  decoration: BoxDecoration(color:
                                                                      newsypro.newslist[index].sectn == 0 ? kblack38.withOpacity(0.3)
                                                                      : newsypro.newslist[index].sectn == 1 ? kblack38.withOpacity(0.3)
                                                                      : Colors.transparent,
                                                                    // border: Border.all(color: kblueColor),
                                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      newsypro.newslist[index].sectn == 0
                                                                          ? Text(_language.AboutFoundation(),
                                                                        style: TextStyle(fontWeight: FontWeight.bold, color: kblack380,fontSize: 13),)
                                                                          : newsypro.newslist[index].sectn == 1
                                                                          ? Text(_language.AboutDonations(),
                                                                        style: TextStyle(fontWeight: FontWeight.bold, color: kblack380,fontSize: 13),)
                                                                          : Text('',
                                                                      ),
                                                                    ],
                                                                  )),
                                                              SizedBox(width: 3),
                                                            ],
                                                          ),
                                                          // محتوى الخبر
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(width: 5,),
                                                              Expanded(
                                                                flex: 3,
                                                                child:
                                                                Padding(
                                                                  padding: const EdgeInsets.all(10),
                                                                  child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                    children: [
                                                                      SizedBox(height: 8),

                                                                      Text(
                                                                        textAlign: language == 'AR' ? TextAlign.right : TextAlign.left,
                                                                        maxLines: 2,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        newsypro.newslist[index].contnt.toString(),
                                                                        style: TextStyle(fontSize: 16),
                                                                      ),
                                                                      SizedBox(height: 10),
                                                                      // more read
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // صورة الخبر
                                                    Expanded(
                                                      flex: 1,
                                                      child: Column(

                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.only(top: 8, right: 8,left: 8),

                                                            child:
                                                            newsypro.newslist.length != 0 ?
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(15),

                                                              child: CachedNetworkImage(
                                                                placeholder: (ctx, url) => Image.asset(AppConstants.image),
                                                                height: 100,
                                                                width: 120,
                                                                fit: BoxFit.contain,

                                                                errorWidget: (ctx, url, err) =>
                                                                    Image.asset(AppConstants.image,
                                                                  fit: BoxFit.cover,

                                                                ),
                                                                imageUrl: '${AppConstants.BASE_URL}${AppConstants.DONATION_PIC_PATH}${newsypro.newslist[index].cvrImg}',
                                                              ),
                                                            )
                                                                : Image.asset(AppConstants.image,
                                                              fit: BoxFit.cover,
                                                             )

                                                          ),
                                                            SizedBox(height: 5,),
                                                          Padding(
                                                            padding: const EdgeInsets.all(2.0),
                                                            child:  Text(newsypro.newslist[index].createdAt.toString().substring(0,10),style: TextStyle(color: Colors.black38),
                                                              textAlign: language == 'AR' ? TextAlign.right : TextAlign.left,),

                                                            // InkWell(
                                                            //   onTap: (){
                                                            //     Navigator.push(context, MaterialPageRoute(builder: (context) =>v_page(
                                                            //         content: newsypro.newslist[index].contnt.toString(),
                                                            //         imge: newsypro.newslist[index].cvrImg.toString(),
                                                            //         Section: newsypro.newslist[index].sectn!,
                                                            //         titel: newsypro.newslist[index].hdLine.toString()
                                                            //
                                                            //
                                                            //     )
                                                            //     )
                                                            //     );
                                                            //
                                                            //   },
                                                            //   child: Text(_language.NavNews(),
                                                            //       style: TextStyle(color: Colors.blue,fontSize: screenWidth / 30),
                                                            //       textDirection: Language == "AR" ? TextDirection.ltr : TextDirection.rtl),
                                                            // ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),


                                                SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                          ],
                                        ),
                                      );




                                  });
                    },
                  ),




                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


