class DonationPicModel {
  int? id;
  int? dontnID;
  String? dontnPic;
  String? altTxt;
  int? clientID;
  String? createdAt;
  String? updatedAt;

  DonationPicModel(
      {this.id,
        this.dontnID,
        this.dontnPic,
        this.altTxt,
        this.clientID,
        this.createdAt,
        this.updatedAt});

  DonationPicModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    dontnID = json['DontnID'];
    dontnPic = json['DontnPic'];
    altTxt = json['AltTxt'];
    clientID = json['ClientID'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['DontnID'] = dontnID;
    data['DontnPic'] = dontnPic;
    data['AltTxt'] = altTxt;
    data['ClientID'] = clientID;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
