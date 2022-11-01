class Especialidades {
  Especialidades({
    this.status,
    this.data,
  });
  late final String? status;
  late final List<Especialidade>? data;

  Especialidades.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = List.from(json['data']).map((e) => Especialidade.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Especialidade {
  Especialidade({
    required this.specialty,
  });
  late final String specialty;

  Especialidade.fromJson(Map<String, dynamic> json) {
    specialty = json['specialty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['specialty'] = specialty;
    return _data;
  }
}
