class Clinicas {
  Clinicas({
    required this.status,
    required this.data,
  });
  late final String status;
  late final List<Clinica> data;

  Clinicas.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = List.from(json['data']).map((e) => Clinica.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Clinica {
  Clinica({
    required this.id,
    required this.name,
    required this.phone,
    required this.whatsapp,
    required this.email_1,
    required this.email_2,
    required this.site,
    required this.cep,
    required this.state,
    required this.city,
    required this.district,
    required this.address,
    required this.complement,
    required this.number,
    required this.specialty,
    required this.customText,
    required this.creatAt,
    required this.updatedAt,
  });
  late final String id;
  late final String name;
  late final String phone;
  late final String whatsapp;
  late final String email_1;
  late final String email_2;
  late final String site;
  late final String cep;
  late final String state;
  late final String city;
  late final String district;
  late final String address;
  late final String complement;
  late final String number;
  late final String specialty;
  late final String customText;
  late final String creatAt;
  late final String updatedAt;

  Clinica.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    email_1 = json['email_1'];
    email_2 = json['email_2'];
    site = json['site'];
    cep = json['cep'];
    state = json['state'];
    city = json['city'];
    district = json['district'];
    address = json['address'];
    complement = json['complement'];
    number = json['number'];
    specialty = json['specialty'];
    customText = json['custom_text'];
    creatAt = json['creat_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['whatsapp'] = whatsapp;
    _data['email_1'] = email_1;
    _data['email_2'] = email_2;
    _data['site'] = site;
    _data['cep'] = cep;
    _data['state'] = state;
    _data['city'] = city;
    _data['district'] = district;
    _data['address'] = address;
    _data['complement'] = complement;
    _data['number'] = number;
    _data['specialty'] = specialty;
    _data['custom_text'] = customText;
    _data['creat_at'] = creatAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
