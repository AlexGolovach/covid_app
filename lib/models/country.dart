import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class CountryInfo {
  @JsonKey(name: "Country")
  final String country;

  @JsonKey(name: "Slug")
  final String slug;

  @JsonKey(name: "ISO2")
  final String iso2;

  CountryInfo({this.country, this.slug, this.iso2});

  factory CountryInfo.fromJson(Map<String, dynamic> json) =>
      _$CountryInfoFromJson(json);
}
