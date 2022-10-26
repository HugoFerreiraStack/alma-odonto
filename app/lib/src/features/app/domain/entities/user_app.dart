class UserApp {
  UserApp({
    this.status,
    this.data,
  });
  late final String? status;
  late final Usuario? data;

  UserApp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Usuario.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data?.toJson();
    return _data;
  }
}

class Usuario {
  Usuario({
    this.document,
    this.birthday,
    this.name,
    this.company,
    this.wallet,
    this.walletDate,
    this.mail,
    this.active,
    this.lastIp,
    this.lastLogin,
    this.creatAt,
    this.updateAt,
    this.token,
    this.dependentes,
  });
  late final String? document;
  late final String? birthday;
  late final String? name;
  late final String? company;
  late final String? wallet;
  late final String? walletDate;
  late final String? mail;
  late final bool? active;
  late final String? lastIp;
  late final String? lastLogin;
  late final String? creatAt;
  late final String? updateAt;
  late final String? token;
  late final List<Dependentes>? dependentes;

  Usuario.fromJson(Map<String, dynamic> json) {
    document = json['document'];
    birthday = json['birthday'];
    name = json['name'];
    company = json['company'];
    wallet = json['wallet'];
    walletDate = json['wallet_date'];
    mail = json['mail'];
    active = json['active'];
    lastIp = json['last_ip'];
    lastLogin = json['last_login'];
    creatAt = json['creat_at'];
    updateAt = json['update_at'];
    token = json['token'];
    dependentes = json['dependents'] != null ? List.from(json['dependents']).map((e) => Dependentes.fromJson(e)).toList() : [];
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
    _data['last_ip'] = lastIp;
    _data['last_login'] = lastLogin;
    _data['creat_at'] = creatAt;
    _data['update_at'] = updateAt;
    _data['token'] = token;
    _data['dependents'] = dependentes?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Dependentes {
  Dependentes({
    this.id,
    this.documentHolder,
    this.document,
    this.name,
    this.birthday,
  });
  late final String? id;
  late final String? documentHolder;
  late final String? document;
  late final String? name;
  late final String? birthday;

  Dependentes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    documentHolder = json['document_holder'];
    document = json['document'];
    name = json['name'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['document_holder'] = documentHolder;
    _data['document'] = document;
    _data['name'] = name;
    _data['birthday'] = birthday;
    return _data;
  }
}
