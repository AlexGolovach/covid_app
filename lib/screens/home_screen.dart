import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidapp/blocs/home_bloc.dart';
import 'package:covidapp/models/total_state.dart';
import 'package:covidapp/screens/countries_list_screen.dart';
import 'package:covidapp/screens/country_screen.dart';
import 'package:covidapp/ui/chart_data.dart';
import 'package:covidapp/ui/stats_chart.dart';
import 'package:covidapp/utils/bloc_state_and_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeScreen extends StatefulWidget {
  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = HomeBloc();
    _bloc.add(LoadData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home")),
        floatingActionButton: _buildFabBtn(),
        body: BlocBuilder<HomeBloc, BlocState>(
          bloc: _bloc,
          // ignore: missing_return
          builder: (BuildContext context, BlocState state) {
            if (state is DataLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is DataLoadSuccess) {
              return _buildScreen(state.item);
            }

            if (state is DataLoadError) {
              return Center(child: Text(state.error));
            }
          },
        ));
  }

  Widget _buildFabBtn() {
    return SpeedDial(
        overlayColor: Colors.grey,
        overlayOpacity: 0.5,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              child: Icon(Icons.my_location),
              label: "My country stats",
              backgroundColor: Colors.green,
              onTap: () => _navigateToCountryScreen()),
          SpeedDialChild(
              child: Icon(Icons.list),
              label: "Countries",
              backgroundColor: Colors.red,
              onTap: () => _navigateToCountriesListScreen())
        ]);
  }

  Widget _buildScreen(Global data) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      _buildCardWithStats(data),
      _buildChartCard(data)
    ]));
  }

  Widget _buildCardWithStats(Global data) {
    return Card(
        elevation: 4.0,
        child: Container(
            child: Wrap(children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text("Total confirmed: ${data.totalConfirmed}")),
                Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text("New confirmed: ${data.newConfirmed}")),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text("Total deaths: ${data.totalDeaths}")),
                Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text("New deaths: ${data.newDeaths}"))
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text("Total recovered: ${data.totalRecovered}")),
                Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text("New recovered: ${data.newRecovered}"))
              ])
        ])));
  }

  Widget _buildChartCard(Global total) {
    final List<ChartData> data = [
      ChartData(
          name: "Confirmed",
          value: total.totalConfirmed,
          barColor: charts.ColorUtil.fromDartColor(Colors.red)),
      ChartData(
          name: "Recovered",
          value: total.totalRecovered,
          barColor: charts.ColorUtil.fromDartColor(Colors.green))
    ];

    return StatsChart(data: data, title: "World stat");
  }

  _navigateToCountryScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CountryScreen()));
  }

  _navigateToCountriesListScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CountriesListScreen()));
  }
}
