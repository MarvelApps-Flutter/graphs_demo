import 'package:flutter/material.dart';
import 'package:syncfusion_ex/constants/app_constants.dart';
import 'bar_chart_screen.dart';
import 'line_chart_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  BaseScreenState createState() => BaseScreenState();
}

class BaseScreenState extends State<BaseScreen> {
  var currentIndex = 0;
  List pagesList = [
    BarChartScreen(),
    LineChartScreen(),
  ];

  List<IconData> iconsList = [
    Icons.bar_chart,
    Icons.stacked_line_chart,
  ];

  List<String> titleList = [AppConstants.barChart, AppConstants.lineChart];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: pagesList[currentIndex],
      bottomNavigationBar: Container(
        height: size.width * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .070),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(
                () {
                  currentIndex = index;
                },
              );
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom: index == currentIndex ? 0 : size.width * .029,
                    right: size.width * .0622,
                    left: size.width * .0622,
                  ),
                  width: size.width * .300,
                  height: index == currentIndex ? size.width * .014 : 0,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4f51fe),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Icon(
                  iconsList[index],
                  size: size.width * .060,
                  color: index == currentIndex
                      ? const Color(0xFF4f51fe)
                      : Colors.black38,
                ),
                Text(
                  titleList[index],
                  // style: index == currentIndex
                  //     ? AppTextStyles.lightColouredTextStyle
                  //     : AppTextStyles.lightGreyTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
