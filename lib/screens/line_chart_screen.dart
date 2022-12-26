import 'package:flutter/material.dart';
import 'package:syncfusion_ex/constants/app_constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/line_chart_data.dart';

class LineChartScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LineChartScreen({Key? key}) : super(key: key);

  @override
  LineChartScreenState createState() => LineChartScreenState();
}

class LineChartScreenState extends State<LineChartScreen> {
  final List<LineChartData> lineChartData = [
    LineChartData(2017, 25),
    LineChartData(2018, 40),
    LineChartData(2019, 50),
    LineChartData(2020, 20),
    LineChartData(2021, 40),
    LineChartData(2022, 75),
  ];

  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            AppConstants.lineChart,
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: FractionallySizedBox(
              widthFactor: 0.93,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SfCartesianChart(
                      title: ChartTitle(text: AppConstants.yearlyAnalyse),
                      tooltipBehavior: tooltipBehavior,
                      primaryXAxis: CategoryAxis(
                          interval: 1,
                          title: AxisTitle(text: AppConstants.year),
                          edgeLabelPlacement: EdgeLabelPlacement.shift),
                      primaryYAxis: NumericAxis(
                          minimum: 0,
                          maximum: 200,
                          interval: 50,
                          opposedPosition: true),
                      series: <ChartSeries<LineChartData, double>>[
                        LineSeries<LineChartData, double>(
                          color: Colors.black,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true),
                          name: AppConstants.sales,
                          enableTooltip: true,
                          dataSource: lineChartData,
                          xValueMapper: (LineChartData sales, _) => sales.year,
                          yValueMapper: (LineChartData sales, _) => sales.sales,
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ));
  }
}
