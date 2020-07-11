import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stats_by_country.g.dart';

@JsonSerializable()
class Info {
  @JsonKey(name: "Country")
  final String country;

  @JsonKey(name: "CountryCode")
  final String countryCode;

  @JsonKey(name: "Province")
  final String province;

  @JsonKey(name: "City")
  final String city;

  @JsonKey(name: "CityCode")
  final String cityCode;

  @JsonKey(name: "Lat")
  final String lat;

  @JsonKey(name: "Lon")
  final String lon;

  @JsonKey(name: "Confirmed")
  final int confirmed;

  @JsonKey(name: "Deaths")
  final int deaths;

  @JsonKey(name: "Recovered")
  final int recovered;

  @JsonKey(name: "Active")
  final int active;

  @JsonKey(name: "Date")
  final String date;

  Info(
      {this.country,
      this.countryCode,
      this.province,
      this.city,
      this.cityCode,
      this.lat,
      this.lon,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.active,
      this.date});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  String getDate() {
    DateFormat _dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ssZ");
    DateTime dateTime = _dateFormat.parse(date);

    return "${dateTime.day}.${dateTime.month}.${dateTime.year}";
  }
}
