import 'dart:convert';

import 'package:covidapp/api/api.dart';
import 'package:covidapp/data/result.dart';
import 'package:covidapp/models/country.dart';
import 'package:covidapp/models/stats_by_country.dart';
import 'package:covidapp/models/total_state.dart';
import 'package:http/http.dart' show Client;

class CovidApiProvider {
  final Client _client = Client();

  Future<Result> loadTotalStats() async {
    final response = await _client.get(Api.getTotalStats());

    if (response.statusCode == 200) {
      return Result<Global>.success(
          TotalState.fromJson(jsonDecode(response.body)).global);
    } else {
      return Result<String>.error('Failed to load total stats');
    }
  }

  Future<Result> loadCountriesList() async {
    final response = await _client.get(Api.getCountriesList());

    if (response.statusCode == 200) {
      return Result<List<CountryInfo>>.success(jsonDecode(response.body)
          .map((item) => CountryInfo.fromJson(item))
          .toList()
          .cast<CountryInfo>());
    } else {
      return Result<String>.error('Failed to load countries list');
    }
  }

  Future<Result> loadStatsByCountry(String country) async {
    final response = await _client.get(Api.getStatsByCountry(country));

    if (response.statusCode == 200) {
      List<Info> data = jsonDecode(response.body)
          .map((item) => Info.fromJson(item))
          .toList()
          .cast<Info>();

      if (data.isNotEmpty) {
        return Result<List<Info>>.success(data);
      } else {
        return Result<String>.error(
            'No information about situation with covid in this country');
      }
    } else {
      return Result<String>.error('Failed to load stats by country');
    }
  }
}
