// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_by_country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(
    country: json['Country'] as String,
    countryCode: json['CountryCode'] as String,
    province: json['Province'] as String,
    city: json['City'] as String,
    cityCode: json['CityCode'] as String,
    lat: json['Lat'] as String,
    lon: json['Lon'] as String,
    confirmed: json['Confirmed'] as int,
    deaths: json['Deaths'] as int,
    recovered: json['Recovered'] as int,
    active: json['Active'] as int,
    date: json['Date'] as String,
  );
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'Country': instance.country,
      'CountryCode': instance.countryCode,
      'Province': instance.province,
      'City': instance.city,
      'CityCode': instance.cityCode,
      'Lat': instance.lat,
      'Lon': instance.lon,
      'Confirmed': instance.confirmed,
      'Deaths': instance.deaths,
      'Recovered': instance.recovered,
      'Active': instance.active,
      'Date': instance.date,
    };
