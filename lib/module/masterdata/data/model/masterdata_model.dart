import 'dart:convert';

class MasterDataModel {
  final String code;
  final String name;

  MasterDataModel({
    required this.code,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
    };
  }

  factory MasterDataModel.fromMap(Map<String, dynamic> map) {
    return MasterDataModel(
      code: map['code'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MasterDataModel.fromJson(String source) =>
      MasterDataModel.fromMap(json.decode(source));
}
