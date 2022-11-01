class CidadeEstado {
  CidadeEstado({
    this.status,
    this.data,
  });
  late final String? status;
  late final List<StateCity>? data;

  CidadeEstado.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = List.from(json['data']).map((e) => StateCity.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class StateCity {
  StateCity({
    this.state,
    this.city,
  });
  late final String? state;
  late final String? city;

  StateCity.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['state'] = state;
    _data['city'] = city;
    return _data;
  }
}
