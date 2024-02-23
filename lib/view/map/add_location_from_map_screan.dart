

import 'dart:async';
import 'dart:io';

import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:geocoding/geocoding.dart';
import 'package:keswaty/Widgets/DefaultButton.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/data/models/map_model.dart';


import '../../widgets/My_Input_Them.dart';




double? MyLocationModelat;
double ?MyLocationModelLong;

class AddLocatonGoogleMapScreen extends StatefulWidget {
  // double ? lat;
  // double? long;
  // bool? from_main_my_location;
  final LocationModel ? locationModel;
  static const String routeName = 'add-locaton-screen';

  AddLocatonGoogleMapScreen({
    // @required this.lat,
    // this.long,
    required this.locationModel,
    // this.from_main_my_location,
  });

  

  @override
  _AddLocatonGoogleMapScreenState createState() =>
      _AddLocatonGoogleMapScreenState();
}

class _AddLocatonGoogleMapScreenState extends State<AddLocatonGoogleMapScreen> {
  double lat = 15.37031780931026;
  double long = 44.191657147476455;

  
  
  List<Placemark>? coordinates;
  GoogleMapController? _controller; 

  
  Set<Marker> markers = {};

  

  setlocationOld(BuildContext context) async {
    
    print("setlocation");
    coordinates = await placemarkFromCoordinates(lat, long);
    try {
      
      

      
      
      
      print(coordinates!.first.name);

      

      
      
    } catch (e) {
      
      
    }

    
    

    
  }

  Stream<List<Placemark>> setlocation() async* {
    
    print("setlocation");
    yield await placemarkFromCoordinates(lat, long, localeIdentifier: "egy")
        .catchError((e, s) {
      
      

      
      return coordinates;
    }).onError((e, s) {
      
      

      
      return coordinates!;
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    

    
  }

  Future<List<Placemark>> setlocationTow() async {
    
    print("setlocation");
    return await placemarkFromCoordinates(
      lat,
      long,
    ).catchError((e, s) {
      
      

      
      return coordinates;
    }).onError((e, s) {
      
      

      
      return coordinates!;
    });
    
    

    
  }

  @override
  void initState() {
    

    super.initState();
    if (widget.locationModel?.latitude == 0) {


      widget.locationModel?.latitude = 15.37031780931026;
      widget.locationModel!.longitude = 44.191657147476455;
    }
    setState(() {
      lat = widget.locationModel!.latitude!;
      long = widget.locationModel!.longitude!;
    });
    

    setlocationTow().then((value) {
      if (value != null && value.isNotEmpty)
        setState(() {
          coordinates = value;
          print(coordinates!.first.name);
        });
      return coordinates;
    }).catchError((e, s) {

      return coordinates;
    });
  }

  int counter = 0;

  
  Future<ui.Image> getImageFromPath(String imagePath) async {
    File imageFile = File(imagePath);

    Uint8List imageBytes = imageFile.readAsBytesSync();

    final Completer<ui.Image> completer = new Completer();

    ui.decodeImageFromList(imageBytes, (ui.Image img) {
      return completer.complete(img);
    });

    return completer.future;
  }

  bool isBressSave = false;

  Future<BitmapDescriptor> getMarkerIcon(String imagePath, Size size) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Radius radius = Radius.circular(size.width / 2);

    final Paint tagPaint = Paint()..color = Colors.blue;
    final double tagWidth = 40.0;

    final Paint shadowPaint = Paint()..color = Colors.blue.withAlpha(100);
    final double shadowWidth = 15.0;

    final Paint borderPaint = Paint()..color = Colors.white;
    final double borderWidth = 3.0;

    final double imageOffset = shadowWidth + borderWidth;

    
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        shadowPaint);

    
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(shadowWidth, shadowWidth,
              size.width - (shadowWidth * 2), size.height - (shadowWidth * 2)),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        borderPaint);

    
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(size.width - tagWidth, 0.0, tagWidth, tagWidth),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        tagPaint);

    
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = TextSpan(
      text: '1',
      style: const TextStyle(fontSize: 20.0, color: Colors.white),
    );

    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(size.width - tagWidth / 2 - textPainter.width / 2,
            tagWidth / 2 - textPainter.height / 2));

    
    Rect oval = Rect.fromLTWH(imageOffset, imageOffset,
        size.width - (imageOffset * 2), size.height - (imageOffset * 2));

    
    canvas.clipPath(Path()..addOval(oval));

    
    ui.Image image = await getImageFromPath(
        imagePath); 
    paintImage(canvas: canvas, image: image, rect: oval, fit: BoxFit.fitWidth);

    
    final ui.Image markerAsImage = await pictureRecorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());

    
    final ByteData? byteData =
        await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List uint8List = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }

  @override
  Widget build(BuildContext context) {
    
    
    

    markers.add(Marker(
      markerId: MarkerId("1"),
      position: gm.LatLng(widget.locationModel!.latitude!, widget.locationModel!.longitude!!),
      
      infoWindow: InfoWindow(title: "بقاله", anchor: Offset(5, 4)),
      icon: BitmapDescriptor.defaultMarkerWithHue(20),
    ));

    return Scaffold(
        extendBody: false,
        resizeToAvoidBottomInset: false,
        primary: true,
        extendBodyBehindAppBar: true,
        
        
        
        
        
        drawerEnableOpenDragGesture: false,
        endDrawerEnableOpenDragGesture: false,
        
        
        
        
        
        
        
        
        bottomNavigationBar: Container(
          width: AppTheme.fullWidth(context) - 20,
          
          height: 70,
          padding: const EdgeInsets.all(8.0),

          color: Theme.of(context).backgroundColor,
          alignment: Alignment.center,

          child: SizedBox(
              width: AppTheme.fullWidth(context) - 20,
              height: 70,
              child: isBressSave
                  ? Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.transparent,
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context)
                                .buttonTheme
                                .colorScheme!
                                .background,
                          ),
                        ),
                      ),
                    )
                  : DefaultButton(
                      
                      
                      
                      
                      
                      
                      




                      icon: Icon(Icons.add_location_rounded,),
                      // IconColor: Colors.white,
                      // textColor: Colors.white,
                      // borderColor: Theme.of(context)
                      //     .buttonTheme
                      //     .colorScheme!
                      //     .background,
                      //
                      // fontSize: 20,
                      // borderRadius: BorderRadius.circular(20),
                      // fontWeight: FontWeight.w400,
                      // offset: Offset(0, 0),
                      // iconSize: 20,
                      // width: AppTheme.fullWidth(context) - 20,
                      // height: 70,
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      // backgroundColor: Theme.of(context)
                      //     .buttonTheme
                      //     .colorScheme!
                      //     .background,

                      
                      

                      press: () async {
                        
                        

                        

                        
                        MyLocationModelat = lat;
                        MyLocationModelLong = long;

                        

                        LocationModel locusmo = new LocationModel(
                          latitude: MyLocationModelat,
                          longitude: MyLocationModelLong,
                          
                          
                          
                          
                          location_Name: coordinates != null
                              ? " ${coordinates == null || coordinates!.first.locality == null ? " " : coordinates!.first.street}"
                                  
                                  
                                  "${coordinates!.first == null || coordinates!.first.subThoroughfare == null ? " " : coordinates!.first.subThoroughfare},"
                                  "${coordinates!.first == null || coordinates!.first.thoroughfare == null ? " " : coordinates!.first.thoroughfare},"
                              : "",
                        );
                        Navigator.pop(context,locusmo);





























                      }, text: 'تأكيد الموقع', bkground: kblueColor, txtstyle: TextStyle(fontSize: 20,color: kwhait),
                    )),
        ),
        body: Container(
          width: AppTheme.fullWidth(context),
          height: AppTheme.fullHeight(context),
          child: Stack(children: [
            Container(
                width: AppTheme.fullWidth(context),
                height: AppTheme.fullHeight(context),
                child: GoogleMap(
                    // rotateGesturesEnabled: true,
                    // indoorViewEnabled: true,
                    // buildingsEnabled: true,
                    // trafficEnabled: true,
                    // liteModeEnabled: false,
                    // tiltGesturesEnabled: ,

                    

                    
                    
                    onCameraMove: ((pinPosition) async {
                      
                      counter = counter + 1;
                      
                      
                      
                      lat = pinPosition.target.latitude;

                      lat = pinPosition.target.latitude;
                      long = pinPosition.target.longitude;
                      

                      
                      
                      coordinates = coordinates;

                      
                      
                      
                      

                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      

                    }),
                    onCameraIdle: () async {
                      
                      
                      

                      try {
                        var stream = setlocation();
                        
                        stream.listen((value) => setState(() {
                              if (value != null) coordinates = value;

                              
                            }));
                        

                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        

                        
                        
                        
                        
                        
                        
                        
                        

                        

                        
                        
                      } catch (e) {
                        
                        
                      }
                    },
                    zoomControlsEnabled: true,
                    
                    
                    


                    
                    initialCameraPosition: gm.CameraPosition(
                        target: gm.LatLng(widget.locationModel!.latitude!, widget.locationModel!.longitude!),
                        
                        
                        zoom: 19),
                    mapType: MapType.normal,
                    
                    

                    
                    onMapCreated: (GoogleMapController controller) {
                      setState(() {
                        _controller = controller;
                      });

                      
                      
                      
                      
                    })



                ),
            coordinates != null && coordinates!.isNotEmpty
                ? Align(
                    
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.grey,
                              ),
                              Wrap(
                                direction: Axis.vertical,
                                verticalDirection: VerticalDirection.down,
                                alignment: WrapAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.2,
                                    child: Text(
                                      coordinates!.first.administrativeArea
                                              .toString() +
                                          ", " +
                                          coordinates!.first.street.toString(),
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                    ),
                                  ),
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
                : Container(),
            Container(
              width: AppTheme.fullWidth(context),
              
              height: AppTheme.fullHeight(context) - 200,
              
              
              
              child: Center(
                
                
                
                child: Container(
                  
                  
                  height: 70,
                  width: 120,
                  child: Image.asset(
                    "assets/images/map.png",
                    color: Theme.of(context).primaryColor,
                    height: 70,
                    width: 120,
                  ),
                  
                  
                  
                  
                  
                ),
              ),
            ),
          ]),
        ));




















































































































































































































































































































































































































































  }
}
