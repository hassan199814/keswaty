class SignuperrorModel {
  String? phone;
  String? email;

  SignuperrorModel({this.phone, this.email});

  SignuperrorModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}
