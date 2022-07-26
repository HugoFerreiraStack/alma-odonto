class LoginParams {
  LoginParams({
    required this.document,
    required this.password,
  });

  late final String document;
  late final String password;

  LoginParams.fromJson(Map<String, dynamic> json) {
    document = json['document'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['document'] = document;
    _data['password'] = password;
    return _data;
  }
}
