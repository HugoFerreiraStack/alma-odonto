class CheckLoginParams {
  CheckLoginParams({
    required this.document,
    required this.birthday,
  });
  late final String document;
  late final String birthday;

  CheckLoginParams.fromJson(Map<String, dynamic> json) {
    document = json['document'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['document'] = document;
    _data['birthday'] = birthday;
    return _data;
  }
}
