import 'package:flutter/material.dart';
import 'package:impeller_mini/renderer/object_3d.dart';
import 'package:impeller_mini/renderer/project.dart';

class View3D extends StatelessWidget {
  final Object3D object3d;
  const View3D({super.key, required this.object3d});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _View3DPainter(object3d),
    );
  }
}

class _View3DPainter extends CustomPainter {
  final Object3D object3d;

  _View3DPainter(this.object3d);

  final _paint = Paint()..color = Colors.blue;

  static const _palette = [
    Color(0xff9f235f),
    Color(0xff3e4db4),
    Color(0xff98249e),
    // Color(0xffea1f25),
    // Color(0xffad6d37),
    // Color(0xfff1ca00),
    // Color(0xffecddbe),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    for (final (i, point) in object3d.points.indexed) {
      const pointSize = 5.0;
      var screenPoint = project(point);

      var color = _palette[i % _palette.length];
      _paint.color = color;

      // Remaps Coordinates from [-1, 1] to the [0, viewport].
      var x = (1.0 + screenPoint.x) * size.width / 2;
      var y = (1.0 - screenPoint.y) * size.height / 2;

      canvas.drawCircle(Offset(x, y), pointSize, _paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
