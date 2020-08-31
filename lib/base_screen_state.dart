import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class BaseScreenState<TBloc extends Bloc, T extends StatefulWidget>
    extends State<T> {
  TBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I.get<TBloc>();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
