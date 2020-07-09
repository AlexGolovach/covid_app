// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalState _$TotalStateFromJson(Map<String, dynamic> json) {
  return TotalState(
    global: json['Global'] == null
        ? null
        : Global.fromJson(json['Global'] as Map<String, dynamic>),
    countries: (json['Countries'] as List)
        ?.map((e) =>
            e == null ? null : Country.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TotalStateToJson(TotalState instance) =>
    <String, dynamic>{
      'Global': instance.global,
      'Countries': instance.countries,
    };

Global _$GlobalFromJson(Map<String, dynamic> json) {
  return Global(
    newConfirmed: json['NewConfirmed'] as int,
    totalConfirmed: json['TotalConfirmed'] as int,
    newDeaths: json['NewDeaths'] as int,
    totalDeaths: json['TotalDeaths'] as int,
    newRecovered: json['NewRecovered'] as int,
    totalRecovered: json['TotalRecovered'] as int,
  );
}

Map<String, dynamic> _$GlobalToJson(Global instance) => <String, dynamic>{
      'NewConfirmed': instance.newConfirmed,
      'TotalConfirmed': instance.totalConfirmed,
      'NewDeaths': instance.newDeaths,
      'TotalDeaths': instance.totalDeaths,
      'NewRecovered': instance.newRecovered,
      'TotalRecovered': instance.totalRecovered,
    };

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    country: json['Country'] as String,
    countryCode: json['CountryCode'] as String,
    slug: json['Slug'] as String,
    newConfirmed: json['NewConfirmed'] as int,
    totalConfirmed: json['TotalConfirmed'] as int,
    newDeaths: json['NewDeaths'] as int,
    totalDeaths: json['TotalDeaths'] as int,
    newRecovered: json['NewRecovered'] as int,
    totalRecovered: json['TotalRecovered'] as int,
    date: json['Date'] as String,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'Country': instance.country,
      'CountryCode': instance.countryCode,
      'Slug': instance.slug,
      'NewConfirmed': instance.newConfirmed,
      'TotalConfirmed': instance.totalConfirmed,
      'NewDeaths': instance.newDeaths,
      'TotalDeaths': instance.totalDeaths,
      'NewRecovered': instance.newRecovered,
      'TotalRecovered': instance.totalRecovered,
      'Date': instance.date,
    };
