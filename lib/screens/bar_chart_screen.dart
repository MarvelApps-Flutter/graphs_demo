import 'package:flutter/material.dart';
import 'package:syncfusion_ex/constants/app_constants.dart';
import 'package:syncfusion_ex/models/time_track_chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/water_track_chart_data.dart';

class BarChartScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  BarChartScreen({Key? key}) : super(key: key);

  @override
  BarChartScreenState createState() => BarChartScreenState();
}

class BarChartScreenState extends State<BarChartScreen> {
  final List<TimeTrackChartData> timeTrackChartData = [
  
    TimeTrackChartData("12 AM", 100),
    TimeTrackChartData("1 AM", 100),
    TimeTrackChartData("2 AM", 200),
    TimeTrackChartData("3 AM", 300),
    TimeTrackChartData("4 AM", 500),
    TimeTrackChartData("5 AM", 1400),
    TimeTrackChartData("6 AM", 900),
    TimeTrackChartData("7 AM", 400),
    TimeTrackChartData("8 AM", 600),
    TimeTrackChartData("9 AM", 300),
    TimeTrackChartData("10 AM", 200),
    TimeTrackChartData("11 AM", 350),
    TimeTrackChartData("12 PM", 300),
    TimeTrackChartData("1 PM", 400),
    TimeTrackChartData("2 PM", 400),
    TimeTrackChartData("3 PM", 480),
    TimeTrackChartData("4 PM", 50),
    TimeTrackChartData("5 PM", 50),
    TimeTrackChartData("6 PM", 50),
    TimeTrackChartData("7 PM", 50),
    TimeTrackChartData("8 PM", 50),
    TimeTrackChartData("9 PM", 50),
    TimeTrackChartData("10 PM", 50),
    TimeTrackChartData("12 AM", 50),
  ];

  final List<WaterTrackChartData> waterTrackChartData = [
    WaterTrackChartData("Jan", 900),
    WaterTrackChartData("Feb", 400),
    WaterTrackChartData("Mar", 500),
    WaterTrackChartData("Apr", 1100),
    WaterTrackChartData("May", 400),
    WaterTrackChartData("Jun", 1350),
    WaterTrackChartData("Jul", 600),
    WaterTrackChartData("Aug", 1100),
    WaterTrackChartData("Sep", 300),
    WaterTrackChartData("Oct", 700),
    WaterTrackChartData("Nov", 100),
    WaterTrackChartData("Dec", 1200),
  ];
  late TooltipBehavior _trackballBehavior;
  late TooltipBehavior _trackballBehavior1;

  @override
  void initState() {
    _trackballBehavior = TooltipBehavior(enable: true);
    _trackballBehavior1 = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            AppConstants.barChart,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(AppConstants.timeTrack),
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.transparent,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(100)),
                              ),
                              child: const Text(AppConstants.steps)),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              margin: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              ),
                              child: const Text(
                                AppConstants.calories,
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(AppConstants.caloriesBurnt),
                  SfCartesianChart(
                      tooltipBehavior: _trackballBehavior,
                      primaryXAxis: CategoryAxis(
                        interval: 4,
                        labelPlacement: LabelPlacement.betweenTicks,
                      ),
                      primaryYAxis: NumericAxis(
                          minimum: 0,
                          maximum: 2000,
                          interval: 500,
                          opposedPosition: true),
                      series: <ChartSeries<TimeTrackChartData, String>>[
                        ColumnSeries<TimeTrackChartData, String>(
                            borderRadius: BorderRadius.circular(10),
                            spacing: 0.1,
                            width: 0.5,
                            enableTooltip: true,
                            selectionBehavior: SelectionBehavior(
                                enable: true,
                                selectedColor: Color(0xFF4f51fe),
                                unselectedColor: Colors.black),
                            color: Colors.black,
                            dataSource: timeTrackChartData,
                            xValueMapper: (TimeTrackChartData data, _) =>
                                data.x,
                            yValueMapper: (TimeTrackChartData data, _) =>
                                data.y),
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(AppConstants.waterTrack),
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              margin: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              ),
                              child: const Text(
                                AppConstants.water,
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(AppConstants.april),
                  SfCartesianChart(
                      tooltipBehavior: _trackballBehavior1,
                      primaryXAxis: CategoryAxis(
                        interval: 1,
                        labelPlacement: LabelPlacement.betweenTicks,
                      ),
                      primaryYAxis: NumericAxis(
                          minimum: 0,
                          maximum: 2000,
                          interval: 500,
                          opposedPosition: true),
                      series: <ChartSeries<WaterTrackChartData, String>>
                          [
                        ColumnSeries<WaterTrackChartData, String>(
                            enableTooltip: true,
                            borderRadius: BorderRadius.circular(10),
                            spacing: 0.01,
                            width: 0.2,
                            color: Colors.black,
                            dataSource: waterTrackChartData,
                            xValueMapper: (WaterTrackChartData data, _) =>
                                data.x,
                            yValueMapper: (WaterTrackChartData data, _) =>
                                data.y),
                      ]),
                ],
              ),
            ),
          ),
        ));
  }
}
