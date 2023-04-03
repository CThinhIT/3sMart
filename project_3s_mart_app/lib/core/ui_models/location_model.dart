import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';

@JsonSerializable()
class ProvinceModel {
  String id;
  String? code;
  String name;
  List<DistrictModel>? districts;
  ProvinceModel({
    this.id = '',
    this.code,
    this.name = '',
    this.districts,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ProvinceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceModelToJson(this);
}

@JsonSerializable()
class DistrictModel {
  String id;
  String name;
  List<WardModel>? wards;

  DistrictModel({
    this.id = '',
    this.name = '',
    this.wards,
  });
  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);
  Map<String, dynamic> toJson() => _$DistrictModelToJson(this);
}

@JsonSerializable()
class WardModel {
  String id;
  String name;
  WardModel({
    this.id = '',
    this.name = '',
  });
  factory WardModel.fromJson(Map<String, dynamic> json) =>
      _$WardModelFromJson(json);
  Map<String, dynamic> toJson() => _$WardModelToJson(this);
}
