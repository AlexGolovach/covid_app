import 'package:covidapp/data/covid_api_provider.dart';
import 'package:covidapp/data/result.dart';
import 'package:covidapp/di/service_locator.dart';

class CountriesListRepository {
  final _api = locator<CovidApiProvider>();

  Future<Result> loadCountriesList() => _api.loadCountriesList();
}
