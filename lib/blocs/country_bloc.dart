import 'package:covidapp/data/result.dart';
import 'package:covidapp/models/country.dart';
import 'package:covidapp/models/stats_by_country.dart';
import 'package:covidapp/repositories/country_repository.dart';
import 'package:covidapp/utils/bloc_state_and_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class LoadData extends BlocEvent {
  final CountryInfo country;

  LoadData({this.country});
}

class DataLoading extends BlocState {}

class DataLoadSuccess extends BlocState {
  final CountryData item;

  DataLoadSuccess({this.item});

  @override
  List<Object> get props => [item];
}

class DataLoadError extends BlocState {
  final String error;

  DataLoadError({this.error});

  @override
  List<Object> get props => [error];
}

class CountryData {
  final List<Info> info;
  final String country;

  CountryData({this.info, this.country});
}

class CountryBloc extends Bloc<BlocEvent, BlocState> {
  final _repository = CountryRepository();
  final Geolocator _geolocator = Geolocator()..forceAndroidLocationManager;

  CountryBloc() : super(DataLoading());

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is LoadData) {
      if (event.country != null) {
        yield* _loadCountryStats(
            country: event.country.country, slug: event.country.slug);
      } else {
        yield* _loadMyCountryInfo();
      }
    }
  }

  Stream<BlocState> _loadMyCountryInfo() async* {
    Position position = await _geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    List<Placemark> p = await _geolocator.placemarkFromCoordinates(
        position.latitude, position.longitude,
        localeIdentifier: "en");

    Placemark place = p[0];

    yield* _loadCountryStats(country: place.country);
  }

  Stream<BlocState> _loadCountryStats(
      {String country, String slug = ""}) async* {
    Result result;

    if (slug.isEmpty) {
      result = await _repository.loadStatsByCountry(country);
    } else {
      result = await _repository.loadStatsByCountry(slug);
    }

    if (result is Success) {
      yield DataLoadSuccess(
          item: CountryData(info: result.value, country: country));
    } else if (result is Error) {
      yield DataLoadError(error: result.error);
    }
  }
}
