class EstadoEntity {
  EstadoEntity({
    this.state,
  });
  late final String? state;

  EstadoEntity.fromJson(Map<String, dynamic> json) {
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['state'] = state;
    return _data;
  }
}
