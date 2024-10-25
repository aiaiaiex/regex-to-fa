import 'dart:math';
import 'dart:ui';

void drawArrow(Canvas canvas, Paint paint, Offset from, Offset to) {
  double angle = atan2(to.dy - from.dy, to.dx - from.dx);
  double width = 4;
  double headLength = 5;

  // Adjust the end position of the arrow head
  double adjustedToX = to.dx - (width * 1.15 * cos(angle));
  double adjustedToY = to.dy - (width * 1.15 * sin(angle));

  // Draw the line of the arrow
  canvas.drawLine(from, Offset(adjustedToX, adjustedToY), paint..strokeWidth = width);

  // Draw the arrowhead
  final Path arrowPath = Path();
  arrowPath.moveTo(adjustedToX, adjustedToY);
  arrowPath.lineTo(
    adjustedToX - headLength * cos(angle - pi / 7),
    adjustedToY - headLength * sin(angle - pi / 7),
  );
  arrowPath.lineTo(
    adjustedToX - headLength * cos(angle + pi / 7),
    adjustedToY - headLength * sin(angle + pi / 7),
  );
  arrowPath.close(); // Connects the last point back to the start

  // Fill the arrowhead
  canvas.drawPath(arrowPath, paint..style = PaintingStyle.fill);
}