class SignuperrorModel {
  String? phone;
  String? email;

  SignuperrorModel({this.phone, this.email});

  SignuperrorModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}
