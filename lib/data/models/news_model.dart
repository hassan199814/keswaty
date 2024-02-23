class NewsModel {
  int? id;
  int? sectn;
  String? hdLine;
  String? contnt;
  String? cvrImg;
  String? altTxt;
  int? proty;
  String? notes;
  int? actv;
  int? addBy;
  String? createdAt;
  String? updatedAt;

  NewsModel(
      {this.id,
        this.sectn,
        this.hdLine,
        this.contnt,
        this.cvrImg,
        this.altTxt,
        this.proty,
        this.notes,
        this.actv,
        this.addBy,
        this.createdAt,
        this.updatedAt});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    sectn = json['Sectn'];
    hdLine = json['HdLine'];
    contnt = json['Contnt'];
    cvrImg = json['CvrImg'];
    altTxt = json['AltTxt'];
    proty = json['Proty'];
    notes = json['Notes'];
    actv = json['Actv'];
    addBy = json['AddBy'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Sectn'] = this.sectn;
    data['HdLine'] = this.hdLine;
    data['Contnt'] = this.contnt;
    data['CvrImg'] = this.cvrImg;
    data['AltTxt'] = this.altTxt;
    data['Proty'] = this.proty;
    data['Notes'] = this.notes;
    data['Actv'] = this.actv;
    data['AddBy'] = this.addBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
