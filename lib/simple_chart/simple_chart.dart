import 'dart:math';
import 'dart:ui';

import 'package:bitcoin_chart_assignment/coin_store/coin_store.dart';
import 'package:bitcoin_chart_assignment/core/utils.dart';
import 'package:bitcoin_chart_assignment/simple_chart/simple_chart_style.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' as intl;

part 'simple_chart_painter.dart';

part 'simple_chart_painter_param.dart';

part 'simple_chart_data.dart';

class SimpleChart extends ConsumerStatefulWidget {
  final String currencyName;
  final int initVisibleDataCount;
  final SimpleChartStyle chartStyle;

  const SimpleChart({
    super.key,
    required this.currencyName,
    this.initVisibleDataCount = 90,
    this.chartStyle = const SimpleChartStyle(),
  });

  @override
  ConsumerState<SimpleChart> createState() => _SimpleChartState();
}

class _SimpleChartState extends ConsumerState<SimpleChart> {
  late List<SimpleChartData> priceData;

  /// to handle painter state TODO: change to MVC controller later
  final simpleChartPainterState = PainterState();

  /// for showing overlay info
  Offset? _tapPosition;

  /// fpr controlling chart scale
  late double _dataWidth;
  late double _prevDataWidth;
  late double _startOffset;
  late double _prevStartOffset;
  late Offset _initialFocalPoint;
  double? _chartContainerWidth;

  bool _isFocusOnEnd = true;

  @override
  void initState() {
    priceData = ref.read(coinStoreProvider).bitCoinPriceData.mapIndexed((index, e) {
      return SimpleChartData(
        date: e.time.updatedISO,
        price: e.bpi[widget.currencyName]!.rateFloat,
      );
    }).toList();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SimpleChart oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _handleSize(
    double chartContainerWidth, [
    bool fromUpdatedData = false,
  ]) {
    if (fromUpdatedData) {
      if (_isFocusOnEnd) {
        _startOffset += _dataWidth;
      }
      return;
    }
    if (_chartContainerWidth != null) {
      // Re-clamp when size changes (e.g. screen rotation)
      _dataWidth = _dataWidth.clamp(
        _getMinCandleWidth(chartContainerWidth),
        _getMaxCandleWidth(chartContainerWidth),
      );
      _startOffset = _startOffset.clamp(
        0,
        _getMaxStartOffset(chartContainerWidth, _dataWidth),
      );
    } else {
      final priceDataInRangeCount = min(
        priceData.length,
        widget.initVisibleDataCount,
      );
      _dataWidth = chartContainerWidth / priceDataInRangeCount;
      _startOffset = (priceData.length - priceDataInRangeCount) * _dataWidth;
    }
    _chartContainerWidth = chartContainerWidth;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(coinStoreProvider, (prev, next) {
      if (prev == next) return;
      final newData = next.bitCoinPriceData.mapIndexed((index, e) {
        return SimpleChartData(
          date: e.time.updatedISO,
          price: e.bpi[widget.currencyName]!.rateFloat,
        );
      }).toList();
      priceData = newData;
      if (newData.length > 1) {
        _handleSize(_chartContainerWidth!);
      }
      setState(() {});
    });

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final layoutSize = constraints.biggest;
        final chartContainerWidth = layoutSize.width - widget.chartStyle.timeLabelWidth;
        _handleSize(chartContainerWidth);

        /// calculate data in range
        final startDataInRangeIndex = (_startOffset / _dataWidth).floor();
        final dataInRangeCount = (chartContainerWidth / _dataWidth).ceil();
        final endDataInRangeIndex = (startDataInRangeIndex + dataInRangeCount).clamp(
          startDataInRangeIndex,
          priceData.length,
        );
        final priceDataInRange = priceData
            .getRange(
              startDataInRangeIndex,
              endDataInRangeIndex,
            )
            .toList();

        _isFocusOnEnd = endDataInRangeIndex == priceData.length;

        /// calculate for the param
        final maxPrice = priceDataInRange.map((e) => e.price).reduce(max);
        final minPrice = priceDataInRange.map((e) => e.price).reduce(min);

        if (dataInRangeCount < 2) {
          return Text(
            'Not enough data to draw chart please wait...',
            style: Theme.of(context).textTheme.headlineMedium,
          );
        }

        final child = TweenAnimationBuilder(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          tween: SimpleChartPainterParamTween(
            end: SimpleChartPainterParam(
              tapPosition: _tapPosition,
              state: simpleChartPainterState,
              dataInRange: priceDataInRange,
              chartStyle: widget.chartStyle,
              layoutSize: layoutSize,
              dataWidth: _dataWidth,
              startOffset: _startOffset,
              maxPrice: maxPrice,
              minPrice: minPrice,
            ),
          ),
          builder: (_, SimpleChartPainterParam params, __) {
            simpleChartPainterState.latestTimeLabelPaintIndex = null;
            return RepaintBoundary(
              child: CustomPaint(
                size: layoutSize,
                painter: SimpleChartPainter(params: params),
              ),
            );
          },
        );

        return GestureDetector(
          onTapDown: (details) => setState(() {
            _tapPosition = details.localPosition;
          }),
          onTapCancel: () => setState(() {
            _tapPosition = null;
          }),
          onTapUp: (details) {
            setState(() {
              _tapPosition = null;
            });
          },
          onScaleStart: (details) {
            _prevDataWidth = _dataWidth;
            _prevStartOffset = _startOffset;
            _initialFocalPoint = details.localFocalPoint;
          },
          onScaleUpdate: (details) {
            final scale = details.scale;
            final focalPoint = details.focalPoint;

            /// handle zoom
            final currentDataWidth = (_prevDataWidth * scale).clamp(
              _getMinCandleWidth(chartContainerWidth),
              _getMaxCandleWidth(chartContainerWidth),
            );
            final clampedScale = currentDataWidth / _prevDataWidth;
            var startOffset = _prevStartOffset * clampedScale;

            /// handle pan
            final dx = (focalPoint - _initialFocalPoint).dx * -1;
            startOffset += dx;

            /// Adjust panning when zooming
            final prevCount = chartContainerWidth / _prevDataWidth;
            final currentDataInRangeCount = chartContainerWidth / currentDataWidth;
            final zoomAdjustment = (currentDataInRangeCount - prevCount) * currentDataWidth;
            final focalPointFactor = focalPoint.dx / chartContainerWidth;
            startOffset -= zoomAdjustment * focalPointFactor;
            startOffset = startOffset.clamp(0, _getMaxStartOffset(chartContainerWidth, currentDataWidth));

            setState(() {
              _dataWidth = currentDataWidth;
              _startOffset = startOffset;
            });
          },
          child: child,
        );
      },
    );
  }

  // The narrowest candle width, i.e. when drawing all available data points.
  double _getMinCandleWidth(double w) => w / priceData.length;

  // The widest candle width, e.g. when drawing 14 day chart
  double _getMaxCandleWidth(double w) => w / min(14, priceData.length);

  // Max start offset: how far can we scroll towards the end of the chart
  double _getMaxStartOffset(double w, double candleWidth) {
    final count = w / candleWidth; // visible candles in the window
    final start = priceData.length - count;
    return max(0, candleWidth * start);
  }
}
