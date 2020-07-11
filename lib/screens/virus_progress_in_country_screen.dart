import 'package:covidapp/blocs/virus_progress_in_country_bloc.dart';
import 'package:covidapp/models/stats_by_country.dart';
import 'package:covidapp/utils/bloc_state_and_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VirusProgressInCountryScreen extends StatefulWidget {
  final List<Info> list;

  VirusProgressInCountryScreen({this.list});

  @override
  createState() => _VirusProgressInCountryScreenState();
}

class _VirusProgressInCountryScreenState
    extends State<VirusProgressInCountryScreen> {
  VirusProgressInCountryBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = VirusProgressInCountryBloc();
    _bloc.add(FilterData(list: widget.list));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Virus progress")),
      body: BlocBuilder(
          bloc: _bloc,
          // ignore: missing_return
          builder: (BuildContext context, BlocState state) {
            if (state is DataLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is DataLoadSuccess) {
              return _buildListWidget(state.list);
            }

            if (state is DataLoadError) {
              return Center(child: Text(state.error));
            }
          }),
    );
  }

  Widget _buildListWidget(List<Info> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final _item = data[index];

          return Card(
              child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(_item.getDate()),
                        Column(children: <Widget>[
                          Text("Confirmed: ${_item.confirmed}"),
                          Text("Recovered: ${_item.recovered}"),
                          Text("Deaths: ${_item.deaths}")
                        ])
                      ])));
        });
  }
}
