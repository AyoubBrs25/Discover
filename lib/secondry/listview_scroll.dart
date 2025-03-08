import 'package:flutter/material.dart';
class NoGlowScrollPhysics extends ScrollPhysics {
  const NoGlowScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  NoGlowScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return NoGlowScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    // Returning 0.0 to disable overscroll effect
    return 0.0;
  }
}