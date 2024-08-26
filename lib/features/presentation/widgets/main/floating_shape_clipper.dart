part of 'widgets_imports.dart';

class FloatingShapeClipper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.secondaryColor
      ..style = PaintingStyle.fill;

    final double width = size.width;
    final double height = size.height;
    final double circleRadius = width / 2;
    final double triangleHeight = height - circleRadius;

    Path path = Path();
    path.moveTo(width / 2, height);
    path.lineTo(0, triangleHeight);
    path.lineTo(width, triangleHeight);
    path.close();

    canvas.drawPath(path, paint);

    canvas.drawCircle(Offset(width / 2, triangleHeight), circleRadius, paint);

    final plusPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    const double plusSize = 20.0;
    final double centerX = width / 2;
    final double centerY = triangleHeight;

    canvas.drawLine(
      Offset(centerX, centerY - plusSize / 2),
      Offset(centerX, centerY + plusSize / 2),
      plusPaint,
    );
    canvas.drawLine(
      Offset(centerX - plusSize / 2, centerY),
      Offset(centerX + plusSize / 2, centerY),
      plusPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
