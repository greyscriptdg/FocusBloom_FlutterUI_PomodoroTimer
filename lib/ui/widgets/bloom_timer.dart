import 'package:flutter/material.dart';
import 'bloom_flower.dart';

class BloomTimer extends StatelessWidget {
  const BloomTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RingPainter(progress: 0.4),
      child: const SizedBox(
        width: 220,
        height: 220,
        child: Center(child: BloomFlower()),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double progress;

  _RingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint base = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Paint active = Paint()
      ..shader = LinearGradient(
        colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
      ).createShader(Rect.fromCircle(center: size.center(Offset.zero), radius: 110))
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = size.center(Offset.zero);
    final radius = size.width / 2;

    // Base circle
    canvas.drawCircle(center, radius, base);

    // Progress arc
    final angle = 2 * 3.1415926 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5708, // Start at top
      angle,
      false,
      active,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
