class UserApp {
  UserApp({
    this.status,
    this.data,
  });
  late final String? status;
  late final Data? data;

  UserApp.fromJson(Map<String, dynamic> json) {
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
    required this.document,
    required this.birthday,
    required this.name,
    required this.company,
    required this.wallet,
    required this.walletDate,
    required this.mail,
    required this.active,
    required this.dp1Name,
    required this.dp1Document,
    required this.dp1Birthday,
    required this.dp2Name,
    required this.dp2Document,
    required this.dp2Birthday,
    required this.dp3Name,
    required this.dp3Document,
    required this.dp3Birthday,
    required this.lastIp,
    required this.lastLogin,
    required this.creatAt,
    required this.updateAt,
    required this.token,
  });
  late final String document;
  late final String birthday;
  late final String name;
  late final String company;
  late final String wallet;
  late final String walletDate;
  late final String mail;
  late final String active;
  late final String dp1Name;
  late final String dp1Document;
  late final String dp1Birthday;
  late final String dp2Name;
  late final String dp2Document;
  late final String dp2Birthday;
  late final String dp3Name;
  late final String dp3Document;
  late final String dp3Birthday;
  late final String lastIp;
  late final String lastLogin;
  late final String creatAt;
  late final String updateAt;
  late final String token;

  Data.fromJson(Map<String, dynamic> json) {
    document = json['document'];
    birthday = json['birthday'];
    name = json['name'];
    company = json['company'];
    wallet = json['wallet'];
    walletDate = json['wallet_date'];
    mail = json['mail'];
    active = json['active'];
    dp1Name = json['dp1_name'];
    dp1Document = json['dp1_document'];
    dp1Birthday = json['dp1_birthday'];
    dp2Name = json['dp2_name'];
    dp2Document = json['dp2_document'];
    dp2Birthday = json['dp2_birthday'];
    dp3Name = json['dp3_name'];
    dp3Document = json['dp3_document'];
    dp3Birthday = json['dp3_birthday'];
    lastIp = json['last_ip'];
    lastLogin = json['last_login'];
    creatAt = json['creat_at'];
    updateAt = json['update_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['document'] = document;
    _data['birthday'] = birthday;
    _data['name'] = name;
    _data['company'] = company;
    _data['wallet'] = wallet;
    _data['wallet_date'] = walletDate;
    _data['mail'] = mail;
    _data['active'] = active;
    _data['dp1_name'] = dp1Name;
    _data['dp1_document'] = dp1Document;
    _data['dp1_birthday'] = dp1Birthday;
    _data['dp2_name'] = dp2Name;
    _data['dp2_document'] = dp2Document;
    _data['dp2_birthday'] = dp2Birthday;
    _data['dp3_name'] = dp3Name;
    _data['dp3_document'] = dp3Document;
    _data['dp3_birthday'] = dp3Birthday;
    _data['last_ip'] = lastIp;
    _data['last_login'] = lastLogin;
    _data['creat_at'] = creatAt;
    _data['update_at'] = updateAt;
    _data['token'] = token;
    return _data;
  }
}
