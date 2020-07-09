import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartData {
  final String name;
  final int value;
  final charts.Color barColor;

  ChartData(
      {@required this.name, @required this.value, @required this.barColor});
}
