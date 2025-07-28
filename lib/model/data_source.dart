class DataSource {
  String? id;
  String? name;

  DataSource({this.id, this.name});
  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(id: json['id'], name: json['name']);
  }
}
