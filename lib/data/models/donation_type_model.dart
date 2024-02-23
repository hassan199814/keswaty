



class DonationTypeModel {
  int? id;
  String? name;

  DonationTypeModel(
      { this.id,
        this.name});

  DonationTypeModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
