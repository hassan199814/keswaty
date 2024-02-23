// class LostsFounds {
//   LostsFounds({
//     this.LostFoundID,
//     this.VisitorID,
//     this.lostOrFound,
//     this.lostfoundType,
//     this.lostfoundName,
//     this.lostfoundImg,
//     this.lostfoundDscr,
//     this.lostfoundCity,
//     this.lostfoundAddress,
//     this.Longitude,
//     this.Latitude,
//     required this.LostFoundDate,
//     this.addingTime,
//    this.LostFoundState,
//    this.StateNote,
//   //    this.ID,
//      this.VisitorName,
//      this.VisitorPhone,
//      this.VisitorEmail,
//      this.VisitorPass,
//      this.VisitorAddress,
//
//      this.Rspns,
//   });
//    int? LostFoundID;
//   late final int? VisitorID;
//   late final String? lostOrFound;
//   late final String? lostfoundType;
//   late final String? lostfoundName;
//     String? lostfoundImg;
//     String? lostfoundDscr;
//     String? lostfoundCity;
//   late final String? lostfoundAddress;
//    String? Longitude;
//    String? Latitude;
//   late final String LostFoundDate;
//    String? StateNote;
//    String? addingTime;
//    int? LostFoundState;
//    String? VisitorName;
//    String? VisitorPhone;
//    String? VisitorEmail;
//    String? VisitorPass;
//    String? VisitorAddress;
//    int? Rspns;
//
//
//   LostsFounds.fromJson(Map<String, dynamic> json){
//     LostFoundID = int.parse(json['LostFound_ID'].toString());
//     VisitorID = int.parse(json['Visitor_ID'].toString());
//     lostOrFound = json['lost_or_found'];
//     lostfoundType = json['lostfound_type'];
//     lostfoundName = json['lostfound_name'];
//     lostfoundImg = json['lostfound_img'];
//     lostfoundDscr = json['lostfound_dscr'];
//     lostfoundCity = json['lostfound_city'];
//     lostfoundAddress = json['lostfound_address'];
//     Longitude = json['Longitude'];
//     Latitude = json['Latitude'];
//     LostFoundDate = json['LostFoundDate'];
//     StateNote = json['StateNote'];
//     // LostFoundState = json['LostFoundState'];
//     // ID = json['ID'];
//     VisitorName = json['VisitorName'];
//     VisitorPhone = json['VisitorPhone'];
//     VisitorEmail = json['VisitorEmail'];
//     VisitorPass = json['VisitorPass'];
//     VisitorAddress = json['VisitorAddress'];
//     addingTime = json['addingTime'];
//     LostFoundState = int.parse(json['LostFoundState'].toString());
//     Rspns = int.parse(json['Rspns'].toString());
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['LostFound_ID'] = LostFoundID;
//     _data['Visitor_ID'] = VisitorID;
//     _data['lost_or_found'] = lostOrFound;
//     _data['lostfound_type'] = lostfoundType;
//     _data['lostfound_name'] = lostfoundName;
//     _data['lostfound_img'] = lostfoundImg;
//     _data['lostfound_dscr'] = lostfoundDscr;
//     _data['lostfound_city'] = lostfoundCity;
//     _data['lostfound_address'] = lostfoundAddress;
//     _data['Longitude'] = Longitude;
//     _data['Latitude'] = Latitude;
//      _data['LostFoundDate'] = LostFoundDate;
//     _data['addingTime'] = addingTime;
//     _data['LostFoundState'] = LostFoundState;
//     _data['StateNote'] = StateNote;
//
//
//     _data['Rspns'] = Rspns;
//     return _data;
//   }
// }
//
//
//
//
//
