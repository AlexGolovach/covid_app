import 'package:json_annotation/json_annotation.dart';

part 'total_state.g.dart';

@JsonSerializable()
class TotalState {
  @JsonKey(name: "Global")
  final Global global;

  @JsonKey(name: "Countries")
  final List<Country> countries;

  TotalState({this.global, this.countries});

  factory TotalState.fromJson(Map<String, dynamic> json) => _$TotalStateFromJson(json);
}

@JsonSerializable()
class Global {
  @JsonKey(name: "NewConfirmed")
  final int newConfirmed;

  @JsonKey(name: "TotalConfirmed")
  final int totalConfirmed;

  @JsonKey(name: "NewDeaths")
  final int newDeaths;

  @JsonKey(name: "TotalDeaths")
  final int totalDeaths;

  @JsonKey(name: "NewRecovered")
  final int newRecovered;

  @JsonKey(name: "TotalRecovered")
  final int totalRecovered;

  Global(
      {this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered});

  factory Global.fromJson(Map<String, dynamic> json) => _$GlobalFromJson(json);
}

@JsonSerializable()
class Country {
  @JsonKey(name: "Country")
  final String country;

  @JsonKey(name: "CountryCode")
  final String countryCode;

  @JsonKey(name: "Slug")
  final String slug;

  @JsonKey(name: "NewConfirmed")
  final int newConfirmed;

  @JsonKey(name: "TotalConfirmed")
  final int totalConfirmed;

  @JsonKey(name: "NewDeaths")
  final int newDeaths;

  @JsonKey(name: "TotalDeaths")
  final int totalDeaths;

  @JsonKey(name: "NewRecovered")
  final int newRecovered;

  @JsonKey(name: "TotalRecovered")
  final int totalRecovered;

  @JsonKey(name: "Date")
  final String date;

  Country(
      {this.country,
      this.countryCode,
      this.slug,
      this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered,
      this.date});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
