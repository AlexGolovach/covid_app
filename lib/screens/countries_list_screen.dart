import 'package:covidapp/blocs/countries_list_bloc.dart';
import 'package:covidapp/models/country.dart';
import 'package:covidapp/screens/country_screen.dart';
import 'package:covidapp/utils/bloc_state_and_event.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesListScreen extends StatefulWidget {
  @override
  createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  CountriesListBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = CountriesListBloc();
    _bloc.add(LoadCountriesListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<CountriesListBloc, BlocState>(
            bloc: _bloc,
            // ignore: missing_return
            builder: (BuildContext context, BlocState state) {
              if (state is CountriesListLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state is CountriesListLoadSuccess) {
                return _buildSearchBar(state.items);
              }

              if (state is CountriesListLoadError) {
                return Center(child: Text(state.error));
              }
            }));
  }

  Widget _buildSearchBar(List<CountryInfo> data) {
    return FloatingSearchBar.builder(
      pinned: true,
      padding: EdgeInsets.only(top: 10.0),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final _item = data[index];

        return Card(
            child: Padding(
                padding: EdgeInsets.all(2.0),
                child: ListTile(
                    onTap: () {
                      _navigateToCountryScreen(_item);
                    },
                    title: Text(_item.country))));
      },
      onChanged: (String value) {
        _bloc.add(SearchEvent(text: value));
      },
      decoration: InputDecoration.collapsed(hintText: "Search..."),
    );
  }

  _navigateToCountryScreen(CountryInfo country) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CountryScreen(country: country)));
  }
}
