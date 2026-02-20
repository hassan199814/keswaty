
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:google_maps_flutter/google_maps_flutter.dart' as gom;
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/map_model.dart';
import '../My_Input_Them.dart';


class GoogleMapProdactCard extends StatefulWidget {
  LocationModel ? locationModel;
  GoogleMapProdactCard({super.key, 
    this.locationModel,
  }){
    locationModel ??= LocationModel(
      latitude: 15.355247719587306,
      longitude: 44.20541518870799,
      location_Name:           "صنعاء - التحرير - جوار برج تيليمن",
    );
  }

  @override
  _GoogleMapProdactCardState createState() => _GoogleMapProdactCardState();
}

class _GoogleMapProdactCardState extends State<GoogleMapProdactCard> {
  GoogleMapController? _controller;

  @override
  void initState() {
    addCustomIcon();
    super.initState();

    if (widget.locationModel!.latitude! != 0 &&
        widget.locationModel!.longitude! != 0) {
      if (mounted && _controller != null) {
        setState(() {
          if (_controller != null) {
            _controller?.animateCamera(gom.CameraUpdate.newLatLngZoom(
                gom.LatLng(widget.locationModel!.latitude!, widget.locationModel!.longitude!),
                15.151926040649414));
          }
        });
      }
    }
  }

  onTap() async {
    // if (ConfigPermissionMethod.CheckHaveAccount()) {
    //   await TaskInterstitialAd.ShowInterstitialAd(
    //           () {}
    //   );
    // }
    String WebBageHome;
    // if (Platform.isAndroid) {
      WebBageHome =
      'https://www.google.com/maps/search/?api=1&query=${widget.locationModel!.latitude!},${widget.locationModel!.longitude!}';

      // Uri uri = Uri.parse(
      //   WebBageHome,
      // );

      WebBageHome =
      'https://www.google.com/maps/search/?api=1&query=${widget.locationModel!.latitude!},${widget.locationModel!.longitude!}';
      // String url =
      //     'comgooglemaps://?saddr=&daddr=${widget.locationModel!.latitude!},${widget.locationModel!.longitude!}&directionsmode=driving';

      Uri uri = Uri.parse(
        WebBageHome,
      );
      if (await canLaunchUrl(
        uri,
      )) {
        await launchUrl(
          uri,
          mode: LaunchMode.platformDefault,
        );

        // await launch(url);
      } else if (await canLaunchUrl(Uri.parse(WebBageHome))) {
        await launchUrl(Uri.parse(WebBageHome));
      } else {
        // throw 'Could not launch $url';
      }
    // }
  }

  CameraPosition() {
    return  gm.CameraPosition(
        target: gm.LatLng(widget.locationModel!.latitude!, widget.locationModel!.longitude!),
        tilt: 40.440717697143555,
        zoom: 19.151926040649414);
  }

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  void addCustomIcon() {}

  Widget _location() {
    return Row(
      children: [
        SizedBox(
          height: 50.0,
          width: 30,
          child: SizedBox(
            height: 50.0,
            width: 30,
            child: Icon(
              Icons.location_pin,
              size: 22,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
        ),
        Text(
          widget.locationModel!.location_Name!,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: () async {
          onTap();
        },
        child: Column(
      children: [
        Card(
          elevation: 5.0,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          clipBehavior: Clip.hardEdge,
          child: Container(
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        constraints: const BoxConstraints(maxHeight: 150),
                        child:  Container(
                            width: MediaQuery.of(context).size.width,
                            constraints: const BoxConstraints(maxHeight: 150),
                            child: _location(),

                        ),
                      )),
                 Stack(children: [
                      widget.locationModel!.latitude! == 0.0 ||
                          widget.locationModel!.longitude! == 0.0
                          ? Container()
                          : SizedBox(
                          width: MediaQuery.of(context).size.width - 6,
                          height: 250,
                          child: GoogleMap(
                              liteModeEnabled: true,
                              rotateGesturesEnabled: false,
                              buildingsEnabled: false,
                              myLocationEnabled: false,
                              indoorViewEnabled: false,
                              myLocationButtonEnabled: false,
                              zoomControlsEnabled: false,
                              onCameraIdle: () {},
                              initialCameraPosition: CameraPosition(),
                              mapType: MapType.normal,
                              trafficEnabled: false,
                              scrollGesturesEnabled: false,
                              tiltGesturesEnabled: false,
                              onTap: (lat){
                                onTap();
                              },
                              mapToolbarEnabled: false,
                              onCameraMove: ((pinPosition) async {
                                if (mounted && _controller != null) {
                                  setState(() {
                                    if (_controller != null) {
                                      _controller?.animateCamera(
                                          gom.CameraUpdate.newLatLng(
                                            gom.LatLng(widget.locationModel!.latitude!,
                                                widget.locationModel!.longitude!),
                                          ));
                                    }
                                  });
                                }
                              }),
                              compassEnabled: false,
                              zoomGesturesEnabled: false,
                              onMapCreated: (GoogleMapController controller) {
                                setState(() {
                                  _controller = controller;

                                  _controller?.animateCamera(
                                      gom.CameraUpdate.newLatLngZoom(
                                          gom.LatLng(widget.locationModel!.latitude!,
                                              widget.locationModel!.longitude!),
                                          19.151926040649414));
                                });
                              })),
                      SizedBox(
                        width: AppTheme.fullWidth(context) - 6,
                        height: 250,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 60),
                            child: Image.asset(
                              "images/map.png",
                              color: Theme.of(context).primaryColor,
                              height: 70,
                              width: 120,
                            ),
                          ),
                        ),
                      ),
                    ]),

                ],
              )),
        ),
      ],
    ));
  }
}
