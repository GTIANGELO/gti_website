import 'package:flutter/material.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/utility_functions.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:visibility_detector/visibility_detector.dart';

class WhateWeProvide extends StatefulWidget {
  const WhateWeProvide({super.key});

  @override
  State<WhateWeProvide> createState() => _WhateWeProvideState();
}

class _WhateWeProvideState extends State<WhateWeProvide>
    with TickerProviderStateMixin {
  late final AnimationController _leftCtrl = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 800));
  late final AnimationController _rightCtrl = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 800));
  bool _visible = false;

  void _triggerAnimations(VisibilityInfo info) {
    if (info.visibleFraction > 0.3 && !_visible) {
      setState(() => _visible = true);
      _leftCtrl.forward();
      _rightCtrl.forward();
    }
  }

  @override
  void dispose() {
    _leftCtrl.dispose();
    _rightCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final screenSize = getScreenSize(screenWidth);
    return VisibilityDetector(
      key: const Key('what_we_provide'),
      onVisibilityChanged: _triggerAnimations,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * screenSize.value(0, 0.06, 0.06, 0.12),
          vertical: 100,
        ),
        child: screenSize.isMedium
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SlideFadeWidget(
                    controller: _leftCtrl,
                    offset: const Offset(-0.5, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "This is what we provide to our clients @ 24/7",
                          style: TextStyle(
                              fontSize: screenSize.value(30.0, 30.0, 30, 40),
                              fontWeight: FontWeight.bold,
                              color: utilityFunctions
                                  .getThemeColors(context)["secondary"]!),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "We provide solutions that match your budget and schedule. With GTI, your IT is in good hands @ 24/7. Let GTI professionals handle your IT needs so you can focus on growth.",
                          style: TextStyle(
                              fontSize: screenSize.value(30.0, 15.0, 15, 18),
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SlideFadeWidget(
                    controller: _rightCtrl,
                    offset: const Offset(0.5, 0),
                    rotate: true,
                    child: const Image(
                      image: AssetImage('assets/clientchart.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SlideFadeWidget(
                      controller: _leftCtrl,
                      offset: const Offset(-0.5, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "This is what we provide to our clients @ 24/7",
                            style: TextStyle(
                                fontSize: screenSize.value(30.0, 30.0, 30, 40),
                                fontWeight: FontWeight.bold,
                                color: utilityFunctions
                                    .getThemeColors(context)["secondary"]!),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "We provide solutions that match your budget and schedule. With GTI, your IT is in good hands @ 24/7. Let GTI professionals handle your IT needs so you can focus on growth.",
                            style: TextStyle(
                                fontSize: screenSize.value(30.0, 30.0, 15, 18),
                                color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SlideFadeWidget(
                      controller: _rightCtrl,
                      offset: const Offset(0.5, 0),
                      rotate: true,
                      child: const Image(
                        image: AssetImage('assets/clientchart.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class SlideFadeWidget extends StatelessWidget {
  final AnimationController controller;
  final Offset offset;
  final Widget child;
  final bool rotate;

  const SlideFadeWidget({
    super.key,
    required this.controller,
    required this.offset,
    required this.child,
    this.rotate = false,
  });

  @override
  Widget build(BuildContext context) {
    final animation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    return SlideTransition(
      position:
          Tween<Offset>(begin: offset, end: Offset.zero).animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: rotate
            ? RotationTransition(
                turns: Tween<double>(begin: 0.1, end: 0).animate(animation),
                child: child)
            : child,
      ),
    );
  }
}
