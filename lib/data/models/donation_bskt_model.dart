class DonationBsktModel {
  int? id;
  int? dontnStatus;
  String? phoneNo;
  String? bsktDscr;
  String? lngtd;
  String? latud;
  String? dlvryDate;
  int? clientID;
  String? notes;
  String? createdAt;
  String? updatedAt;

  DonationBsktModel(
      {this.id,
        this.dontnStatus,
        this.phoneNo,
        this.bsktDscr,
        this.lngtd,
        this.latud,
        this.dlvryDate,
        this.clientID,
        this.notes,
        this.createdAt,
        this.updatedAt});

  DonationBsktModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    dontnStatus = json['DontnStatus'];
    phoneNo = json['PhoneNo'];
    bsktDscr = json['BsktDscr'];
    lngtd = json['Lngtd'];
    latud = json['latud'];
    dlvryDate = json['DlvryDate'];
    clientID = int.parse(json['ClientID'].toString());
    notes = json['Notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['DontnStatus'] = this.dontnStatus;
    data['PhoneNo'] = this.phoneNo;
    data['BsktDscr'] = this.bsktDscr;
    data['Lngtd'] = this.lngtd;
    data['latud'] = this.latud;
    data['DlvryDate'] = this.dlvryDate;
    data['ClientID'] = this.clientID;
    data['Notes'] = this.notes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
