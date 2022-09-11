class CheckLoginResult {
  CheckLoginResult({
    this.status,
    this.data,
  });
  late final String? status;
  late final Data? data;

  CheckLoginResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data?.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.name,
    required this.active,
  });
  late final String name;
  late final String active;

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['active'] = active;
    return _data;
  }
}
