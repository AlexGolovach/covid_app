import 'package:covidapp/blocs/country_bloc.dart';
import 'package:covidapp/models/country.dart';
import 'package:covidapp/ui/chart_data.dart';
import 'package:covidapp/ui/stats_chart.dart';
import 'package:covidapp/utils/bloc_state_and_event.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

class CountryScreen extends StatefulWidget {
  final CountryInfo country;

  CountryScreen({this.country});

  @override
  createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  CountryBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = CountryBloc();

    if (widget.country == null) {
      _checkGps();
      _bloc.add(LoadData());
    } else {
      _bloc.add(LoadData(country: widget.country));
    }
  }

  _checkGps() async {
    final location = Location();

    if (!await location.serviceEnabled()) {
      location.requestService();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Country")),
        body: BlocBuilder<CountryBloc, BlocState>(
            bloc: _bloc,
            // ignore: missing_return
            builder: (BuildContext context, BlocState state) {
              if (state is CountryLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state is CountryLoadSuccess) {
                return _buildScreen(state.item);
              }

              if (state is CountryLoadError) {
                return Center(
                    child: Text(state.error,
                        maxLines: 2, textAlign: TextAlign.center));
              }
            }));
  }

  Widget _buildScreen(CountryData data) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(2.0),
        child: Column(children: <Widget>[
          _buildCardWithStats(data),
          _buildChartWidget(data)
        ]));
  }

  Widget _buildCardWithStats(CountryData data) {
    return Card(
        elevation: 4.0,
        child: Container(
            child: Column(children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("Actual stat",
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold)))),
              Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text("Confirmed people: ${data.info.last.confirmed}")),
              Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text("Recovered people: ${data.info.last.recovered}")),
              Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text("Deaths: ${data.info.last.deaths}"))
            ])));
  }

  Widget _buildChartWidget(CountryData countryData) {
    final List<ChartData> data = [
      ChartData(
          name: "Confirmed",
          value: countryData.info.last.confirmed,
          barColor: charts.ColorUtil.fromDartColor(Colors.red)),
      ChartData(
          name: "Recovered",
          value: countryData.info.last.recovered,
          barColor: charts.ColorUtil.fromDartColor(Colors.green)),
      ChartData(
          name: "Deaths",
          value: countryData.info.last.deaths,
          barColor: charts.ColorUtil.fromDartColor(Colors.brown))
    ];

    return StatsChart(data: data, title: "${countryData.country} stats");
  }
}