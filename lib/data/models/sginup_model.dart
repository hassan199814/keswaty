class SginUpModel {
  String? userName;
  String? Email;
  String? phoneNo;
  String? password;
  String? rstrQstn;
  String? rstrAnsr;
  String? adrs;
  // String? lngtd;
  // String? latud;
  // String? updatedAt;
  // String? createdAt;
  int? id;

  SginUpModel(
      {this.userName,
        this.Email,
        this.phoneNo,
        this.password,
        this.rstrQstn,
        this.rstrAnsr,
        this.adrs,
        // this.lngtd,
        // this.latud,
        // this.updatedAt,
        // this.createdAt,
        this.id});

  SginUpModel.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    Email = json['Email'];
    phoneNo = json['PhoneNo'];
    password = json['password'];
    rstrQstn = json['RstrQstn'];
    rstrAnsr = json['RstrAnsr'];
    adrs = json['Adrs'];
    // lngtd = json['Lngtd'];
    // latud = json['latud'];
    // updatedAt = json['updated_at'];
    // createdAt = json['created_at'];
    id = int.parse(json['id'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.userName;
    data['Email'] = this.Email;
    data['PhoneNo'] = this.phoneNo;
    data['password'] = this.password;
    data['RstrQstn'] = this.rstrQstn;
    data['RstrAnsr'] = this.rstrAnsr;
    data['Adrs'] = this.adrs;
    // data['Lngtd'] = this.lngtd;
    // data['latud'] = this.latud;
    // data['updated_at'] = this.updatedAt;
    // data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
