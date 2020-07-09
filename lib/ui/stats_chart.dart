import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidapp/ui/chart_data.dart';
import 'package:flutter/material.dart';

class StatsChart extends StatefulWidget {
  final List<ChartData> data;
  final String title;

  StatsChart({@required this.data, @required this.title});

  @override
  createState() => _StatsChartState();
}

class _StatsChartState extends State<StatsChart> {
  @override
  Widget build(BuildContext context) {
    final List<charts.Series<ChartData, String>> series = [
      charts.Series(
          id: "Stats",
          data: widget.data,
          fillPatternFn: (_, __) => charts.FillPatternType.solid,
          domainFn: (ChartData chartData, _) => chartData.name,
          measureFn: (ChartData chartData, _) => chartData.value,
          colorFn: (ChartData chartData, _) => chartData.barColor)
    ];

    return Padding(
        padding: EdgeInsets.all(2.0),
        child: Card(
            elevation: 4.0,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Text(widget.title,
                  style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              Flexible(
                  child: Container(
                      height: 400.0,
                      width: 400.0,
                      child: charts.BarChart(series, animate: true)))
            ])));
  }
}
