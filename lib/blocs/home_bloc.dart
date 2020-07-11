import 'package:covidapp/data/result.dart';
import 'package:covidapp/models/total_state.dart';
import 'package:covidapp/repositories/home_repository.dart';
import 'package:covidapp/utils/bloc_state_and_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadData extends BlocEvent {}

class DataLoading extends BlocState {}

class DataLoadSuccess extends BlocState {
  final Global item;

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

class HomeBloc extends Bloc<BlocEvent, BlocState> {
  final _repository = HomeRepository();

  HomeBloc() : super(DataLoading());

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is LoadData) {
      Result result = await _repository.loadTotalStats();

      if (result is Success) {
        yield DataLoadSuccess(item: result.value);
      } else if (result is Error) {
        yield DataLoadError(error: result.error);
      }
    }
  }
}
