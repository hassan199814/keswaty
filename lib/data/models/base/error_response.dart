/// errors : [{"code":"l_name","message":"The last name field is required."},{"code":"password","message":"The password field is required."}]
library;

class ErrorResponse {
  List<Errors>? _errors;

  List<Errors>? get errors => _errors;

  ErrorResponse({
      List<Errors>? errors}){
    _errors = errors;
}

  ErrorResponse.fromJson(dynamic json) {
    print(json);

    if(json != '' || json.toString().contains('<div id="header"><h1>Server Error</h1></div>')) {
      if (json["errors"] != null && json["errors"] is! String ) {
        _errors = [];
        json["errors"].forEach((v) {
          _errors?.add(Errors.fromJson(v));
        });
      }
    }else{
      _errors?.add(Errors(code: '1000',message: "api error "));
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_errors != null) {
      map["errors"] = _errors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// code : "l_name"
/// message : "The last name field is required."

class Errors {
  String? _code;
  String? _message;

  String? get code => _code;
  String? get message => _message;

  Errors({
      String? code,
      String? message}){
    _code = code;
    _message = message;
}

  Errors.fromJson(dynamic json) {
    _code = json["code"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["message"] = _message;
    return map;
  }

}