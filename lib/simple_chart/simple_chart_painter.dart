part of 'simple_chart.dart';

class SimpleChartPainter extends CustomPainter {
  final SimpleChartPainterParam params;

  const SimpleChartPainter({required this.params});

  @override
  bool shouldRepaint(SimpleChartPainter oldDelegate) => params.shouldRepaint(oldDelegate.params);

  @override
  void paint(Canvas canvas, Size size) {
    _drawPriceGridAndLabels(canvas, params);
    _drawBorder(canvas, params);

    canvas.save();
    canvas.clipRect(Offset.zero & Size(params.chartWidth, params.chartHeight));
    canvas.restore();
    canvas.save();

    for (int index = 0; index < params.dataInRange.length; index++) {
      _drawLine(canvas, index);
    }

    canvas.restore();
    /// draw the overlay info
    if (params.tapPosition != null && params.tapPosition!.dx < params.chartWidth) {
      _drawTapHighlightAndOverlay(canvas, params);
    }
  }

  void _drawTapHighlightAndOverlay(Canvas canvas, SimpleChartPainterParam params) {
    final position = params.tapPosition!;
    final currentDataIndex = position.dx ~/ params.dataWidth;
    final currentData = params.dataInRange[currentDataIndex];
    canvas.drawLine(
      Offset(currentDataIndex * params.dataWidth, 0.0),
      Offset(currentDataIndex * params.dataWidth, params.chartHeight),
      Paint()
        ..strokeWidth = 1
        ..color = params.chartStyle.overlayInfoLineColor,
    );

    _drawTapInfoOverlay(canvas, params, currentData);
  }

  void _drawTapInfoOverlay(
    canvas,
    SimpleChartPainterParam params,
    SimpleChartData currentData,
  ) {
    const xGap = 8.0;
    const yGap = 4.0;

    TextPainter makeTP(String text) => TextPainter(
          text: TextSpan(
            text: text,
            style: params.chartStyle.overlayTextStyle,
          ),
        )
          ..textDirection = TextDirection.ltr
          ..layout();

    final labels = currentData.toOverLayInfo().keys.map((text) => makeTP(text)).toList();
    final values = currentData.toOverLayInfo().values.map((text) => makeTP(text)).toList();

    final labelsMaxWidth = labels.map((tp) => tp.width).reduce(max);
    final valuesMaxWidth = values.map((tp) => tp.width).reduce(max);
    final panelWidth = labelsMaxWidth + valuesMaxWidth + xGap * 3;
    final panelHeight = max(
          labels.map((tp) => tp.height).reduce((a, b) => a + b),
          values.map((tp) => tp.height).reduce((a, b) => a + b),
        ) +
        yGap * (values.length + 1);

    // Shift the canvas, so the overlay panel can appear near touch position.
    canvas.save();
    final pos = params.tapPosition!;
    const fingerSize = 32.0; // leave some margin around user's finger
    double dx, dy;
    assert(params.layoutSize.width >= panelWidth, "Overlay panel is too wide.");
    if (pos.dx <= params.layoutSize.width / 2) {
      // If user touches the left-half of the screen,
      // we show the overlay panel near finger touch position, on the right.
      dx = pos.dx + fingerSize;
    } else {
      // Otherwise we show panel on the left of the finger touch position.
      dx = pos.dx - panelWidth - fingerSize;
    }
    dx = dx.clamp(0, params.layoutSize.width - panelWidth);
    dy = pos.dy - panelHeight - fingerSize;
    if (dy < 0) dy = 0.0;
    canvas.translate(dx, dy);

    // Draw the background for overlay panel
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Offset.zero & Size(panelWidth, panelHeight),
        const Radius.circular(8),
      ),
      Paint()..color = params.chartStyle.overlayBackgroundColor,
    );

    // Draw texts
    var y = 0.0;
    for (int i = 0; i < labels.length; i++) {
      y += yGap;
      final rowHeight = max(labels[i].height, values[i].height);
      // Draw labels (left align, vertical center)
      final labelY = y + (rowHeight - labels[i].height) / 2; // vertical center
      labels[i].paint(canvas, Offset(xGap, labelY));

      // Draw values (right align, vertical center)
      final leading = valuesMaxWidth - values[i].width; // right align
      final valueY = y + (rowHeight - values[i].height) / 2; // vertical center
      values[i].paint(
        canvas,
        Offset(labelsMaxWidth + xGap * 2 + leading, valueY),
      );
      y += rowHeight;
    }

    canvas.restore();
  }

  void _drawPriceGridAndLabels(canvas, SimpleChartPainterParam params) {
    /// convert 5 point of price label to pirce data
    [0.0, 0.25, 0.5, 0.75, 1.0]
        .map((v) => ((params.maxPrice - params.minPrice) * v) + params.minPrice)
        .forEach((price) {
      /// draw grid
      canvas.drawLine(
        Offset(0, params.priceToOffsetY(price)),
        Offset(params.chartWidth, params.priceToOffsetY(price)),
        Paint()
          ..strokeWidth = 0.5
          ..color = params.chartStyle.bottomRightBorderColor,
      );

      /// draw line before price label
      canvas.drawLine(
        Offset(params.chartWidth, params.priceToOffsetY(price)),
        Offset(params.chartWidth + 3, params.priceToOffsetY(price)),
        Paint()
          ..strokeWidth = 1.5
          ..color = params.chartStyle.bottomRightBorderColor,
      );

      /// draw price label
      final priceTp = TextPainter(
        text: TextSpan(
          text: (price ~/ 1).toString(),
          style: params.chartStyle.priceLabelStyle,
        ),
      )
        ..textDirection = TextDirection.ltr
        ..layout();
      priceTp.paint(
          canvas,
          Offset(
            params.chartWidth + 6,
            params.priceToOffsetY(price) - priceTp.height / 2,
          ));
    });
  }

  void _drawLine(Canvas canvas, int currentDataIndex) {
    final currentData = params.dataInRange[currentDataIndex];
    final prevData = params.dataInRange.at(currentDataIndex - 1);
    final currentOffsetX = currentDataIndex * params.dataWidth;

    if (prevData != null) {
      canvas.drawLine(
        Offset(currentOffsetX - params.dataWidth, params.priceToOffsetY(prevData.price)),
        Offset(currentOffsetX, params.priceToOffsetY(currentData.price)),
        Paint()
          ..strokeWidth = 1.5
          ..strokeCap = StrokeCap.butt
          ..color = params.chartStyle.lineColor,
      );

      if (!(prevData.date.minute % params.chartStyle.timeFrequency.periodInMin == 0) &&
          currentData.date.minute % params.chartStyle.timeFrequency.periodInMin == 0) {
        canvas.drawLine(
          Offset(currentOffsetX, 0),
          Offset(currentOffsetX, params.chartHeight),
          Paint()
            ..strokeWidth = 0.5
            ..color = params.chartStyle.bottomRightBorderColor,
        );

        /// draw time label
        if (params.state.latestTimeLabelPaintIndex == null) {
          _drawTimeLabel(canvas, currentOffsetX, currentData);
          params.state.latestTimeLabelPaintIndex = currentDataIndex;
        } else {
          final diffIndex = currentDataIndex - params.state.latestTimeLabelPaintIndex!;
          final diffWidth = diffIndex * params.dataWidth;
          if (params.chartStyle.timeLabelWidth < diffWidth) {
            _drawTimeLabel(canvas, currentOffsetX, currentData);
            params.state.latestTimeLabelPaintIndex = currentDataIndex;
          }
        }
      }
    }
  }

  void _drawTimeLabel(Canvas canvas, double currentOffsetX, SimpleChartData currentData) {
    /// draw time label over line
    final overTextLinePaint = Paint()
      ..color = params.chartStyle.bottomRightBorderColor
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(currentOffsetX, params.chartHeight),
      Offset(currentOffsetX, params.chartHeight + 3),
      overTextLinePaint,
    );

    /// draw time label
    final labelTime = intl.DateFormat('HH:mm').format(currentData.date);
    final timeLabelPaint = TextPainter(
      text: TextSpan(
        text: labelTime,
        style: params.chartStyle.timeLabelStyle,
      ),
    )
      ..textDirection = TextDirection.rtl
      ..layout();

    final topPadding = params.chartStyle.timeLabelSectionHeight - timeLabelPaint.height;
    timeLabelPaint.paint(
      canvas,
      Offset(currentOffsetX - (params.chartStyle.timeLabelWidth / 2), params.chartHeight + topPadding),
    );
  }

  void _drawBorder(Canvas canvas, SimpleChartPainterParam params) {
    final leftTopPaint = Paint()
      ..color = params.chartStyle.bottomRightBorderColor
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;
    final rightBottomPaint = Paint()
      ..color = params.chartStyle.bottomRightBorderColor
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    canvas.drawLine(const Offset(0, 0), Offset(params.chartWidth, 0), leftTopPaint);
    canvas.drawLine(const Offset(0, 0), Offset(0, params.chartHeight), leftTopPaint);
    canvas.drawLine(Offset(params.chartWidth, 0), Offset(params.chartWidth, params.chartHeight), rightBottomPaint);
    canvas.drawLine(Offset(0, params.chartHeight), Offset(params.chartWidth, params.chartHeight), rightBottomPaint);
  }
}
