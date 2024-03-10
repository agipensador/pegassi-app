class ModelVehicleModel {
  const ModelVehicleModel({
    required this.id,
    required this.name,
  });

  factory ModelVehicleModel.fromJson(Map<String, dynamic> map) {
    return ModelVehicleModel(
      id: map['codigo'].toString(),
      name: map['nome'] ?? '',
    );
  }

  final String id;
  final String name;
}