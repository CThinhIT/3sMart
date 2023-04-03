// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvinceModel _$ProvinceModelFromJson(Map<String, dynamic> json) =>
    ProvinceModel(
      id: json['id'] as String? ?? '',
      code: json['code'] as String?,
      name: json['name'] as String? ?? '',
      districts: (json['districts'] as List<dynamic>?)
          ?.map((e) => DistrictModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProvinceModelToJson(ProvinceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'districts': instance.districts,
    };

DistrictModel _$DistrictModelFromJson(Map<String, dynamic> json) =>
    DistrictModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      wards: (json['wards'] as List<dynamic>?)
          ?.map((e) => WardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DistrictModelToJson(DistrictModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'wards': instance.wards,
    };

WardModel _$WardModelFromJson(Map<String, dynamic> json) => WardModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$WardModelToJson(WardModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
