import 'package:covidapp/data/covid_api_provider.dart';
import 'package:covidapp/data/result.dart';
import 'package:covidapp/di/service_locator.dart';

class CountryRepository {
  final _api = locator<CovidApiProvider>();

  Future<Result> loadStatsByCountry(String country) =>
      _api.loadStatsByCountry(country);
}
