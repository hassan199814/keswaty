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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['DontnStatus'] = dontnStatus;
    data['PhoneNo'] = phoneNo;
    data['BsktDscr'] = bsktDscr;
    data['Lngtd'] = lngtd;
    data['latud'] = latud;
    data['DlvryDate'] = dlvryDate;
    data['ClientID'] = clientID;
    data['Notes'] = notes;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
