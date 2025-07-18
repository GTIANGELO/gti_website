import 'package:flutter/material.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/utility_functions.dart';

class ServiceItem {
  final String iconPath;
  final String title;
  ServiceItem({required this.iconPath, required this.title});
}

class ListOfServices extends StatelessWidget {
  final List<ServiceItem> services;
  final int crossAxisCount;
  final String headerText;

  const ListOfServices({
    super.key,
    required this.services,
    this.crossAxisCount = 3,
    this.headerText = '',
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenSize = getScreenSize(screenWidth);
    final theme = utilityFunctions.getThemeColors(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * screenSize.value(0, 0.06, 0.06, 0.1),
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Animated Header
          Padding(
            padding: const EdgeInsets.only(bottom: 45.0),
            child: Align(
              alignment: Alignment.center,
              child: _FadeSlideOnVisible(
                delay: Duration.zero,
                child: Text(
                  headerText,
                  style: TextStyle(
                    fontSize: screenSize.value(25.0, 25.0, 30.0, 50.0),
                    fontWeight: FontWeight.bold,
                    color: theme["secondary"],
                  ),
                ),
              ),
            ),
          ),
          // Services Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: screenSize.value(10.0, 15.0, 20.0, 35.0),
            mainAxisSpacing: screenSize.value(15.0, 15.0, 20.0, 35.0),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            childAspectRatio: screenSize.value(50.0, 2, 2.5, 3),
            children: List.generate(services.length, (index) {
              final service = services[index];
              final delay = Duration(milliseconds: (index ~/ 3) * 200);

              return _FadeSlideOnVisible(
                delay: delay,
                child: Card(
                  color: theme["tertiary"]!.withValues(alpha: 0.9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(screenSize.value(15, 20, 15, 30)),
                    child: SizedBox(
                      height: screenSize.value(50.0, 60.0, 70.0, 80.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: screenSize.value(30.0, 50.0, 70.0, 100.0),
                            width: screenSize.value(30.0, 50.0, 70.0, 100.0),
                            child: Image.asset(service.iconPath,
                                fit: BoxFit.contain),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              service.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: screenSize.value(12, 12, 13, 18),
                                fontWeight: FontWeight.w500,
                                color: theme["secondary"],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

// Shared Animation Wrapper Widget
class _FadeSlideOnVisible extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const _FadeSlideOnVisible({
    required this.child,
    this.delay = Duration.zero,
  });

  @override
  State<_FadeSlideOnVisible> createState() => _FadeSlideOnVisibleState();
}

class _FadeSlideOnVisibleState extends State<_FadeSlideOnVisible>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _fade = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slide = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _onVisible(VisibilityInfo info) {
    if (info.visibleFraction > 0.3 &&
        _controller.status == AnimationStatus.dismissed) {
      Future.delayed(widget.delay, () {
        if (mounted && _controller.status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    return _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.child.hashCode.toString()),
      onVisibilityChanged: _onVisible,
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(position: _slide, child: widget.child),
      ),
    );
  }
}
