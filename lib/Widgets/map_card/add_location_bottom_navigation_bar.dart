import 'package:flutter/material.dart';
import 'package:keswaty/Widgets/My_Input_Them.dart';
import 'package:keswaty/Widgets/colors.dart';
import 'package:keswaty/Widgets/langage.dart';
import 'package:keswaty/data/models/map_model.dart';
import 'package:keswaty/view/map/add_location_from_map_screan.dart';

class _AddLocationLocationModelNavigationBarWidget extends StatelessWidget {
  Language _language = Language();

  LocationModel locationModel;
  BuildContext contextLocationModel;
  Function onPressedfromMyLocation;
  Function onPressedfromMapAddLocation;

  _AddLocationLocationModelNavigationBarWidget(
      this.locationModel,
      this.contextLocationModel,
      this.onPressedfromMyLocation,
      this.onPressedfromMapAddLocation);

  Widget MyLocationButton(
          BuildContext context, BuildContext contextLocationModel) =>
      TextButton(
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.location_pin,
                  color: Theme.of(context).iconTheme.color),
              SizedBox(
                width: 5,
              ),
              Text("موقعك الحالي",
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          onPressed: () async {
            Navigator.of(
              context,
            ).pop();

            onPressedfromMyLocation();
          });

  Widget CameraButton(
          BuildContext context, BuildContext contextLocationModel) =>
      TextButton(
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.map, color: Theme.of(context).iconTheme.color),
              SizedBox(
                width: 5,
              ),
              Text("تحديد على الخرائط",
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          onPressed: () async {
            Navigator.of(
              context,
            ).pop();

            onPressedfromMapAddLocation();
          });

  Widget headers(BuildContext context, bool isBottom) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).pop();
      },
      child: Icon(
        isBottom ? Icons.cancel_outlined : Icons.arrow_back_ios,
        color: Theme.of(context).iconTheme.color,
        size: 30,
      ),
    );
  }

  Widget newAppBar(BuildContext context, bool isBottom) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFFE3E2E2),
      child: Card(
        elevation: 5,
        semanticContainer: true,
        borderOnForeground: true,
        clipBehavior: Clip.none,
        color: Theme.of(context).cardColor,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(children: [
                Navigator.canPop(context)
                    ? Container(
                        alignment: Alignment.centerRight,
                        child: headers(context, isBottom))
                    : Container(),
                Container(
                  alignment: Navigator.canPop(context)
                      ? Alignment.center
                      : Alignment.centerRight,
                  child: Text(_language.tlocationfrommap()),
                  width: 170,
                  height: 70,
                ),
              ]),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullHeight(context),
      child: Column(
        textDirection: TextDirection.rtl,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: AppTheme.fullWidth(context),
            height: 25,
          ),
          newAppBar(context, true),
          MyLocationButton(context, contextLocationModel),
          CameraButton(context, contextLocationModel),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}

class AddLocationLocationModelNavigationBar {
  static Future<LocationModel?> onPressedfromMapAddLocation(
      BuildContext context, LocationModel locationModel) async {
    try {
      LocationModel? LocationModelActivieReturn;
      final result = await Navigator.of(
        context,
      ).push(MaterialPageRoute(
          builder: (contextLocationModel) => AddLocatonGoogleMapScreen(
                locationModel: locationModel,

                // lat: locationModel.latitude != null &&
                //     locationModel.latitude != 0.0
                //     ? locationModel.latitude
                //
                //
                //     : 28.464738901118412,
                // long: locationModel.longitude != null &&
                //     locationModel.longitude != 0.0
                //     ? locationModel.longitude
                //

                // : 42.52408919660993,
              )));
      print("result.runtimeType");
      print(result.runtimeType);
      if (result != null && result.runtimeType == LocationModel) {
        LocationModelActivieReturn = result;
      }
      return LocationModelActivieReturn!;
    } on ArgumentError catch (e) {
      print(e.message);
      if (e.message == 'No element') {}
    } on UnimplementedError catch (e) {
      print(e.message);

      if (e.message == 'No element') {}
    } catch (e) {}
  }

  // static Future<LocationModel>onPressedfromMyLocation(BuildContext context, LocationModel locationModel) async {
  //
  //
  //
  //   var location = locations.Location();
  //
  //
  //
  //
  //   locations.PermissionStatus  permissionStatus=await location.hasPermission();
  //   print("permissionStatus.index");
  //   print(permissionStatus.index);
  //   print("permissionStatus.name");
  //   print(permissionStatus.name);
  //
  //   if(permissionStatus.index==PermissionStatus.denied.index||
  //       permissionStatus.index==PermissionStatus.permanentlyDenied.index||
  //       permissionStatus.index==PermissionStatus.restricted.index
  //
  //   )
  //     permissionStatus= await location.requestPermission();
  //   bool  serviceEnabled=await location.serviceEnabled();
  //   print("serviceEnabled");
  //   print(serviceEnabled);
  //   if(!serviceEnabled)
  //     serviceEnabled=await location.requestService();
  //   print("permissionStatus.index");
  //   print(permissionStatus.index);
  //   print("permissionStatus.name");
  //   print(permissionStatus.name);
  //   print("serviceEnabled");
  //   print(serviceEnabled);
  //   print("(permissionStatus.index==PermissionStatus.granted.index||"
  //       "permissionStatus.index==PermissionStatus.limited.index"
  //
  //       ")&&serviceEnabled");
  //   print((permissionStatus.index==PermissionStatus.granted.index||
  //       permissionStatus.index==PermissionStatus.limited.index
  //
  //   )&&serviceEnabled);
  //
  //   if (serviceEnabled) {
  //
  //     locations.LocationData locationData =
  //         await location.getLocation();
  //     locationData = await location.getLocation();
  //     locationData = await location.getLocation();
  //     print("locationData.longitude");
  //     print(locationData.longitude);
  //     print("locationData.latitude");
  //     print(locationData.latitude);
  //     print("locationData.isMock");
  //     print(locationData.isMock);
  //
  //
  //
  //     LocationModel locusmo = new LocationModel(
  //       latitude: locationData.latitude,
  //       longitude: locationData.longitude,
  //
  //       location_Name: " ",
  //     );
  //
  //
  //
  //
  //     locationModel.latitude = locationData.latitude;
  //     locationModel.longitude = locationData.longitude;
  //
  //
  //     locationModel.latitude = locationData.latitude;
  //     locationModel.longitude = locationData.longitude;
  //
  //
  //
  //
  //
  //
  //
  //
  //     if ( locationData.latitude != null &&
  //         locationData.longitude != null) {
  //       LocationModel _LocationModelActivie =
  //       new LocationModel(
  //
  //         latitude:  locationData.latitude,
  //         longitude:  locationData.longitude,
  //         location_Name:locationModel.location_Name,
  //       );
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
  //     }
  //     LocationModel? LocationModelActivieReturn;
  //     final result = await
  //     Navigator.of(context,
  //     )
  //         .push(MaterialPageRoute(
  //         builder: (contextLocationModel) =>
  //             AddLocatonGoogleMapScreen(
  //               locationModel: locationModel,
  //
  //
  //               lat: locationModel?.latitude != null &&
  //                   locationModel?.latitude != 0.0
  //                   ? locationModel?.latitude
  //
  //
  //
  //                   : 28.464738901118412,
  //               long: locationModel.longitude != null &&
  //                   locationModel.longitude != 0.0
  //                   ? locationModel.longitude
  //
  //
  //                   : 42.52408919660993,
  //               from_main_my_location: true,
  //             )))
  //     ;
  //     print("result.runtimeType");
  //     print(result.runtimeType);
  //     if(result!=null&&result.runtimeType==LocationModel){
  //       LocationModelActivieReturn=result;
  //     }
  //     return LocationModelActivieReturn!;

  //   } else{
  //     LocationModel ?LocationModelActivieReturn;
  //     final result = await
  //     Navigator.of(context,
  //     )
  //         .push(MaterialPageRoute(
  //         builder: (contextLocationModel) =>
  //             AddLocatonGoogleMapScreen(
  //               locationModel: locationModel,
  //
  //
  //               lat: locationModel?.latitude != null &&
  //                   locationModel?.latitude != 0.0
  //                   ? locationModel?.latitude
  //
  //
  //
  //                   : 28.464738901118412,
  //               long: locationModel.longitude != null &&
  //                   locationModel.longitude != 0.0
  //                   ? locationModel.longitude
  //
  //
  //                   : 42.52408919660993,
  //               from_main_my_location: true,
  //             )))
  //     ;
  //     print("result.runtimeType");
  //     print(result.runtimeType);
  //     if(result!=null&&result.runtimeType==LocationModel){
  //       LocationModelActivieReturn=result;
  //     }
  //     return LocationModelActivieReturn!;
  //   }
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
  //
  //
  //
  //
  //
  // }

  static Future Show(
    BuildContext contextLocationModel,
    LocationModel locationModel,
    Function onPressedfromMyLocation,
    Function onPressedfromMapAddLocation,
  ) async {
    await showModalBottomSheet(
      context: contextLocationModel,
      isScrollControlled: false,
      isDismissible: false,
      elevation: 5,
      enableDrag: true,
      constraints: BoxConstraints.loose(
          Size.fromHeight(AppTheme.fullHeight(contextLocationModel))),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34.0), topRight: Radius.circular(34.0)),
      ),
      backgroundColor: const Color(0xFFE3E2E2),
      builder: (BuildContext context) {
        return _AddLocationLocationModelNavigationBarWidget(
            locationModel,
            contextLocationModel,
            onPressedfromMyLocation,
            onPressedfromMapAddLocation);
      },
    );
  }
}
