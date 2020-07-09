// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryInfo _$CountryInfoFromJson(Map<String, dynamic> json) {
  return CountryInfo(
    country: json['Country'] as String,
    slug: json['Slug'] as String,
    iso2: json['ISO2'] as String,
  );
}

Map<String, dynamic> _$CountryInfoToJson(CountryInfo instance) =>
    <String, dynamic>{
      'Country': instance.country,
      'Slug': instance.slug,
      'ISO2': instance.iso2,
    };
