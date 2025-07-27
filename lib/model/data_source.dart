class DataSource {
  String id;
  String name;

  DataSource({required this.id, required this.name});

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(id: json['id'], name: json['name']);
  }
}
