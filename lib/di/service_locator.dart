import 'package:covidapp/blocs/countries_list_bloc.dart';
import 'package:covidapp/blocs/country_bloc.dart';
import 'package:covidapp/blocs/home_bloc.dart';
import 'package:covidapp/blocs/virus_progress_in_country_bloc.dart';
import 'package:covidapp/data/covid_api_provider.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => CovidApiProvider());

  locator.registerFactory(() => HomeBloc());
  locator.registerFactory(() => CountriesListBloc());
  locator.registerFactory(() => CountryBloc());
  locator.registerFactory(() => VirusProgressInCountryBloc());
}
