import 'package:bitcoin_chart_assignment/colors.dart';
import 'package:bitcoin_chart_assignment/data/bitcoin_price_response.dart';
import 'package:dartx/dartx.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CryptoLineChart extends StatefulWidget {
  final double minPrice;
  final double maxPrice;
  final List<BitCoinPriceResponse> bitCoinPriceData;

  const CryptoLineChart({
    super.key,
    required this.bitCoinPriceData,
    required this.minPrice,
    required this.maxPrice,
  });

  @override
  State<CryptoLineChart> createState() => _CryptoLineChartState();
}

class _CryptoLineChartState extends State<CryptoLineChart> {
  List<Color> gradientColors = [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(mainData(
              widget.bitCoinPriceData,
              widget.minPrice,
              widget.maxPrice,
            )),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    // switch (value.toInt()) {
    //   case 2:
    //     text = const Text('MAR', style: style);
    //     break;
    //   case 5:
    //     text = const Text('JUN', style: style);
    //     break;
    //   case 8:
    //     text = const Text('SEP', style: style);
    //     break;
    //   default:
    //     text = const Text('', style: style);
    //     break;
    // }
    text = const Text('', style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    // switch (value.toInt()) {
    //   case 1:
    //     text = '10K';
    //     break;
    //   case 3:
    //     text = '30k';
    //     break;
    //   case 5:
    //     text = '50k';
    //     break;
    //   default:
    //     return Container();
    // }

    return Container();

    // return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(
    List<BitCoinPriceResponse> bitCoinPriceData,
    double minPrice,
    double maxPrice,
  ) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 6,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 0.001,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 0.001,
          ),
        ),
      ),
      // borderData: FlBorderData(
      //   show: true,
      //   border: Border.all(color: const Color(0xff37434d)),
      // ),
      minX: 0,
      maxX: 200,
      //66921.91258
      //67387.41412
      minY: 0,
      maxY: 100000,
      // minY: minPrice - ((maxPrice - minPrice) * 0.2),
      // maxY: maxPrice + ((maxPrice - minPrice) * 0.2),
      lineBarsData: [
        LineChartBarData(
          // spots: bitCoinPriceData.mapIndexed((index, e) {
          //   return FlSpot(index.toDouble(), e.bpi.usd.rateFloat / 60000);
          // }).toList(),
          spots: [
            FlSpot(0, 30000),
            FlSpot(1, 40000),
            FlSpot(2, 10000),
            FlSpot(3, 60000),
            FlSpot(4, 60000),
            FlSpot(5, 5000),
            FlSpot(6, 10000),
          ],
          isCurved: false,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
        ),
      ],
    );
  }
}
