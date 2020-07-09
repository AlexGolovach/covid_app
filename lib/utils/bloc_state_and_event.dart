import 'package:equatable/equatable.dart';

abstract class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  List<Object> get props => [];
}

abstract class BlocState extends Equatable {
  const BlocState();

  @override
  List<Object> get props => [];
}
