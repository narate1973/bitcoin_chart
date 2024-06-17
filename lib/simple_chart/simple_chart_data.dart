part of 'simple_chart.dart';

class SimpleChartData {
  final DateTime date;
  final double price;

  const SimpleChartData({
    required this.date,
    required this.price,
  });

  Map<String, dynamic> toOverLayInfo() {
    return {
      'date': intl.DateFormat('yyyy-MM-dd HH:mm:ss').format(date),
      'price': price.toString(),
    };
  }
}