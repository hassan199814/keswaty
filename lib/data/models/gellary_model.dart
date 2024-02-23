class GellaryModel {
  int? id;
  String? postTitle;
  int? mdiaType;
  String? postPic;
  String? altTxt;
  String? postVdURL;
  String? notes;
  int? actv;
  int? addBy;
  String? createdAt;
  String? updatedAt;

  GellaryModel(
      {this.id,
        this.postTitle,
        this.mdiaType,
        this.postPic,
        this.altTxt,
        this.postVdURL,
        this.notes,
        this.actv,
        this.addBy,
        this.createdAt,
        this.updatedAt});

  GellaryModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    postTitle = json['PostTitle'];
    mdiaType = json['MdiaType'];
    postPic = json['PostPic'];
    altTxt = json['AltTxt'];
    postVdURL = json['PostVdURL'];
    notes = json['Notes'];
    actv = json['Actv'];
    addBy = json['AddBy'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['PostTitle'] = this.postTitle;
    data['MdiaType'] = this.mdiaType;
    data['PostPic'] = this.postPic;
    data['AltTxt'] = this.altTxt;
    data['PostVdURL'] = this.postVdURL;
    data['Notes'] = this.notes;
    data['Actv'] = this.actv;
    data['AddBy'] = this.addBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
