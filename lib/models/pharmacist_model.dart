class PharmacistModel {
  final int id;
  final String name;
  final String token;

  PharmacistModel({required this.id, required this.name, required this.token});

  factory PharmacistModel.fromJson(jsonDate) {
    return PharmacistModel(
        token: jsonDate['token'],
        id: jsonDate['pharmacist']['id'],
        name: jsonDate['pharmacist']['name']);
  }
}
