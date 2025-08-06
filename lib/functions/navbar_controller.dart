import 'package:flutter/material.dart';

class NavBarController {
  bool _isHidden;
  double _lastOffset;

  NavBarController({bool initiallyHidden = false})
      : _isHidden = initiallyHidden,
        _lastOffset = 0;

  void handleScroll({
    required ScrollController scrollController,
    required AnimationController animationController,
  }) {
    final offset = scrollController.offset;
    final delta = offset - _lastOffset;

    if (delta > 0 && !_isHidden) {
      animationController.reverse(); // Slide up (hide)
      _isHidden = true;
    } else if (delta < 0 && _isHidden) {
      animationController.forward(); // Slide down (show)
      _isHidden = false;
    }

    _lastOffset = offset;
  }

  void reset() {
    _isHidden = false;
    _lastOffset = 0;
  }
}
