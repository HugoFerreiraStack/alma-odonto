class SearchClinicParams {
  SearchClinicParams({
    this.specialty,
    this.state,
    this.search,
  });

  late final String? specialty;
  late final String? state;
  late final String? search;

  SearchClinicParams.fromJson(Map<String, dynamic> json) {
    specialty = json['specialty'] ?? "";
    state = json['state'] ?? '';
    search = json['search'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['specialty'] = specialty;
    _data['state'] = state;
    _data['search'] = search;
    return _data;
  }
}
