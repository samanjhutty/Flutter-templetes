class DBmodel {
  String? name;
  int? mobile;
  String? email;

  DBmodel({required this.name, required this.email, required this.mobile});

  DBmodel.toJson(Map<String, dynamic> json) {
    name = json['Name'];
    email = json['EmailAddress'];
    mobile = json['MobileNumber'];
  }

  Map<String, dynamic> fromJson() {
    Map<String, dynamic> _data = <String, dynamic>{};
    _data['Name'] = name;
    _data['EmailAddress'] = email;
    _data['MobileNumber'] = mobile;

    return _data;
  }
}
