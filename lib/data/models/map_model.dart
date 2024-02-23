
class LocationModel {
  LocationModel({

    this.location_Name="unknown",
    
    this.latitude=0.0,
    this.longitude=0.0,

    this.postalCode = "unknown",
    this.administrativeArea = "unknown",
    this.country = "unknown",
    this.ipAddress = "unknown",
    // this.administrativeArea,

  });


  // String? locality = "unknown";
  String? postalCode;
  String? administrativeArea;
  String? country;
  // double? latitude = 0;
  // double? longitude = 0;
  String? ipAddress ;

  String ? location_Name;
  double ?longitude;
  double ?latitude;
}