part of '../scan_screen.dart';

 /// Custom painter to draw overlaying cornors, border, center plus sign 
 class _ScannerOverlayPainter extends CustomPainter {
  final _borderPaint = Paint()
    ..color = Colors.white38
    ..strokeWidth = 1.r
    ..style = PaintingStyle.stroke;

  final _connorPaint = Paint()
    ..color = Colors.white
    ..strokeWidth = 4.r
    ..style = PaintingStyle.stroke;
  
  final _centerPlusPaint = Paint()
    ..color = Colors.white
    ..strokeWidth = 2.r
    ..style = PaintingStyle.stroke;
  
  final _cornorLength = 12.r;

  @override
  void paint(Canvas canvas, Size size) {
    drawBorders(canvas, size);
    drawCornors(canvas, size);
    drawCenterPlusSign(canvas, size);
  }

  void drawCenterPlusSign(Canvas canvas, Size size, {double plusSize = 4}) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    drawLineThrough(
      canvas,
      _centerPlusPaint,
      [
        Offset(centerX, centerY - plusSize),
        Offset(centerX, centerY + plusSize),
      ],
    );
    drawLineThrough(
      canvas,
      _centerPlusPaint,
      [
        Offset(centerX - plusSize, centerY),
        Offset(centerX + plusSize, centerY),
      ],
    );
  }

  void drawBorders(Canvas canvas, Size size) {
    drawLineThrough(
      canvas,
      _borderPaint,
      [
        const Offset(0, 0),
        Offset(size.width, 0),
        Offset(size.width, size.height),
        Offset(0, size.height),
        const Offset(0, 0),
      ],
    );
  }

  void drawCornors(Canvas canvas, Size size) {
    /// draw top left cornor
    drawLineThrough(
      canvas,
      _connorPaint,
      [
        Offset(0, _cornorLength),
        const Offset(0, 0),
        Offset(_cornorLength, 0),
      ],
    );
    /// draw top right cornor
    drawLineThrough(
      canvas,
      _connorPaint,
      [
        Offset(size.width - _cornorLength, 0),
        Offset(size.width, 0),
        Offset(size.width, _cornorLength)
      ],
    );
    /// draw bottom right cornor
    drawLineThrough(
      canvas,
      _connorPaint,
      [
        Offset(size.width, size.height - _cornorLength),
        Offset(size.width, size.height),
        Offset(size.width - _cornorLength, size.height)
      ],
    );
    /// draw bottom left cornor
    drawLineThrough(
      canvas,
      _connorPaint,
      [
        Offset(_cornorLength, size.height),
        Offset(0, size.height),
        Offset(0, size.height - _cornorLength)
      ],
    );
  }

  /// Draw a line throught all [points]
  void drawLineThrough(Canvas canvas, Paint paint, List<Offset> points) {
    if (points.isEmpty) return;

    var path = Path()..moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
