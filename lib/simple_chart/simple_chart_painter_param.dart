part of 'simple_chart.dart';


class PainterState {
  int? latestTimeLabelPaintIndex;

  PainterState();
}

class SimpleChartPainterParam {
  final List<SimpleChartData> dataInRange;
  final double maxPrice;
  final double minPrice;
  final Size layoutSize;
  final SimpleChartStyle chartStyle;
  final PainterState state;
  final Offset? tapPosition;
  final double dataWidth;
  final double startOffset;

  const SimpleChartPainterParam({
    required this.dataInRange,
    required this.maxPrice,
    required this.minPrice,
    required this.layoutSize,
    required this.chartStyle,
    required this.state,
    required this.tapPosition,
    required this.startOffset,
    required this.dataWidth,
  });

  double get chartWidth => layoutSize.width - chartStyle.maXPriceLabelWidth;

  double get chartHeight => layoutSize.height - chartStyle.timeLabelSectionHeight;

  double priceToOffsetY(double currentPrice) {
    return chartHeight * (maxPrice - currentPrice) / (maxPrice - minPrice);
  }

  static SimpleChartPainterParam lerp(SimpleChartPainterParam a, SimpleChartPainterParam b, double t) {
    double lerpField(
      double Function(SimpleChartPainterParam p) getField,
    ) =>
        lerpDouble(getField(a), getField(b), t)!;
    return SimpleChartPainterParam(
      tapPosition: b.tapPosition,
      dataInRange: b.dataInRange,
      chartStyle: b.chartStyle,
      layoutSize: b.layoutSize,
      maxPrice: lerpField((p) => p.maxPrice),
      minPrice: lerpField((p) => p.minPrice),
      state: b.state,
      startOffset: b.startOffset,
      dataWidth: b.dataWidth,
    );
  }

  bool shouldRepaint(SimpleChartPainterParam other) {
    if (dataInRange.length != other.dataInRange.length) {
      return true;
    }

    if (layoutSize != other.layoutSize || dataWidth != other.dataWidth || startOffset != other.startOffset) {
      return true;
    }

    if (maxPrice != other.maxPrice || minPrice != other.minPrice) {
      return true;
    }

    if (tapPosition != other.tapPosition) return true;

    if (chartStyle != other.chartStyle) return true;
    return false;
  }
}

class SimpleChartPainterParamTween extends Tween<SimpleChartPainterParam> {
  SimpleChartPainterParamTween({super.begin, required SimpleChartPainterParam super.end});

  @override
  SimpleChartPainterParam lerp(double t) => SimpleChartPainterParam.lerp(begin ?? end!, end!, t);
}
