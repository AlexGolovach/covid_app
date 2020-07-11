import 'package:covidapp/models/stats_by_country.dart';
import 'package:covidapp/utils/bloc_state_and_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterData extends BlocEvent {
  final List<Info> list;

  FilterData({this.list});
}

class DataLoading extends BlocState {}

class DataLoadSuccess extends BlocState {
  final List<Info> list;

  DataLoadSuccess({this.list});

  @override
  List<Object> get props => list;
}

class DataLoadError extends BlocState {
  final String error;

  DataLoadError({this.error});

  @override
  List<Object> get props => [error];
}

class VirusProgressInCountryBloc extends Bloc<BlocEvent, BlocState> {
  VirusProgressInCountryBloc() : super(DataLoading());

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is FilterData) {
      yield* _filterList(event.list);
    }
  }

  Stream<BlocState> _filterList(List<Info> list) async* {
    var filteredList = List<Info>();

    list.forEach((item) {
      if (item.confirmed != 0) {
        filteredList.add(item);
      }
    });

    if (filteredList.isNotEmpty) {
      yield DataLoadSuccess(list: filteredList);
    } else {
      yield DataLoadError(error: "No confirmed people");
    }
  }
}
