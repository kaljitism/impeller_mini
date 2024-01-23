import 'dart:math' as math;

import 'package:vector_math/vector_math_64.dart';

Vector2 project(Vector3 point) {
  final viewMatrix = makeViewMatrix(
    Vector3(0, 10, 10),
    Vector3.all(0),
    Vector3(1, 0, 0),
  );

  const near = 0.1;
  const fov = 60.0;
  const zoom = 0.5;
  const aspectRatio = 1;
  final double top = near * math.tan(radians(fov) / 2.0) / zoom;
  final double bottom = -top;
  final double right = top * aspectRatio;
  final double left = -right;
  const double far = 1000.0;

  final projectionMatrix =
      makeFrustumMatrix(left, right, bottom, top, near, far);

  final transformationMatrix = viewMatrix * projectionMatrix;
  point.applyMatrix4(transformationMatrix);

  var x = point.x;
  var y = point.y;

  return Vector2(x, y);
}
