
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/constant.dart';
import 'package:keswaty/controller/main_gellary_provider.dart';
import 'package:keswaty/main.dart';
import 'package:keswaty/view/Main/Newsdetails/views%20_page.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {


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


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: language == 'AR' ? TextDirection.rtl : TextDirection.ltr,

      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Color.fromRGBO(33, 37, 25, 1)
            : Color.fromRGBO(240, 242, 245, 1),

        appBar: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Color.fromRGBO(33, 37, 25, 1)
              : Color.fromRGBO(240, 242, 245, 1),
          elevation: 0,
          title:  Text(_language.tnews(),
              style: TextStyle(
                  color:Theme.of(context).brightness == Brightness.dark
                      ?  kwhait
                      :  kblueColor,
                  fontSize: 15,fontWeight: FontWeight.bold)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).brightness == Brightness.dark
                  ? kwhait
                  : kblueColor,
            ),
          ),
        ),

        body: ListView(
          shrinkWrap: true,
          children: [
            // LostFoundAppBAr(name: ""),
            Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Color.fromRGBO(33, 37, 25, 1)
                  : Color.fromRGBO(240, 242, 245, 1),
              child: Column(
                children: [



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
                        itemCount: newsypro.newslist.length ,
                        itemBuilder: (context, index) {
                          return

                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.only(right: 15,left: 10),
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


                                                      ],
                                                    ),
                                                    SizedBox(height: 3),

                                                    Row(
                                                      children: [

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
                                                    )
                                                  ],
                                                ),
                                              ),
                                              // صورة الخبر
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  children: [

                                                    Container(
                                                        margin: EdgeInsets.only(top: 8, right: 8),
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
                                                          fit: BoxFit.fill,
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
                                                      //        textDirection: Language == "AR" ? TextDirection.ltr : TextDirection.rtl),
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