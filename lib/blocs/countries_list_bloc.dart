import 'package:covidapp/data/result.dart';
import 'package:covidapp/models/country.dart';
import 'package:covidapp/repositories/countries_list_repository.dart';
import 'package:covidapp/utils/bloc_state_and_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadCountriesListEvent extends BlocEvent {}

class SearchEvent extends BlocEvent {
  final String text;

  SearchEvent({this.text});

  @override
  List<Object> get props => [text];
}

class CountriesListLoading extends BlocState {}

class CountriesListLoadSuccess extends BlocState {
  final List<CountryInfo> items;

  CountriesListLoadSuccess({this.items});

  @override
  List<Object> get props => items;
}

class CountriesListLoadError extends BlocState {
  final String error;

  CountriesListLoadError({this.error});

  @override
  List<Object> get props => [error];
}

class CountriesListBloc extends Bloc<BlocEvent, BlocState> {
  final _repository = CountriesListRepository();

  List<CountryInfo> countriesList;

  CountriesListBloc() : super(CountriesListLoading());

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is LoadCountriesListEvent) {
      yield* _processLoadCountriesEvent();
    } else if (event is SearchEvent) {
      yield* _processSearchEvent(event.text);
    }
  }

  Stream<BlocState> _processLoadCountriesEvent() async* {
    final Result result = await _repository.loadCountriesList();

    if (result is Success) {
      countriesList = result.value;

      yield CountriesListLoadSuccess(items: result.value);
    } else if (result is Error) {
      yield CountriesListLoadError(error: result.error);
    }
  }

  Stream<BlocState> _processSearchEvent(String text) async* {
    if (text.isEmpty) {
      yield CountriesListLoadSuccess(items: countriesList);
    }

    final list = List<CountryInfo>();

    countriesList.forEach((item) {
      if (item.country.toLowerCase().contains(text.toLowerCase())) {
        list.add(item);
      }
    });

    if (list.isNotEmpty) {
      yield CountriesListLoadSuccess(items: list);
    }
  }
}
