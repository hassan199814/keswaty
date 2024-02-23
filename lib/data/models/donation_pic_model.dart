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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['DontnID'] = this.dontnID;
    data['DontnPic'] = this.dontnPic;
    data['AltTxt'] = this.altTxt;
    data['ClientID'] = this.clientID;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
