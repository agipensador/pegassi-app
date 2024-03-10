class KeyModel {
  final String? model;
  final String? marca;
  final String? categoria;
  final List<dynamic>? adaptation;
  final String? gold;
  final String? dovale;
  final String? land;
  final String? jas;
  final String? silca;
  final String? tools;
  final String? rca;
  final String? jsa;
  final String? iza;
  final String? image;

  KeyModel(
      {
      this.model,
      this.marca,
      this.categoria,
      this.adaptation,
      this.gold,
      this.dovale,
      this.land,
      this.jas,
      this.silca,
      this.tools,
      this.rca,
      this.jsa,
      this.iza,
      this.image});

  factory KeyModel.fromJson(Map<String, dynamic> json) {
    return KeyModel(
      model: json['model'],
      marca: json['marca'],
      categoria: json['categoria'],
      adaptation: json['adaptations'],
      gold: json['gold'],
      dovale: json['dovale'],
      land: json['land'],
      jas: json['jas'],
      silca: json['silca'],
      tools: json['tools'],
      rca: json['rca'],
      jsa: json['jsa'],
      iza: json['iza'],
      image: json['image'],
    );
  }
}
