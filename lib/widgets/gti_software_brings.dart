import 'package:flutter/material.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/utility_functions.dart';

class BringItem {
  final String iconPath;
  final String title;

  BringItem({required this.iconPath, required this.title});
}

class GtiSoftwareBrings extends StatefulWidget {
  final List<BringItem> services;
  final int crossAxisCount;

  const GtiSoftwareBrings({
    super.key,
    required this.services,
    this.crossAxisCount = 3,
  });

  @override
  State<GtiSoftwareBrings> createState() => _GtiSoftwareBringsState();
}

class _GtiSoftwareBringsState extends State<GtiSoftwareBrings>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late Animation<Offset> _headerSlide;
  late Animation<double> _headerFade;

  late List<AnimationController> _itemControllers;
  late List<Animation<Offset>> _itemSlides;
  late List<Animation<double>> _itemFades;

  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();

    _headerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _headerSlide = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: _headerController,
      curve: Curves.easeOut,
    ));

    _headerFade = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _headerController,
      curve: Curves.easeIn,
    ));

    // Wave animation setup
    _itemControllers = List.generate(widget.services.length, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      );
    });

    _itemSlides = _itemControllers.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0, 0.2),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    }).toList();

    _itemFades = _itemControllers.map((controller) {
      return Tween<double>(
        begin: 0,
        end: 1,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    }).toList();
  }

  void _triggerAnimations() {
    if (_hasAnimated) return;

    _headerController.forward();

    for (int i = 0; i < _itemControllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 80), () {
        if (mounted) _itemControllers[i].forward();
      });
    }

    _hasAnimated = true;
  }

  @override
  void dispose() {
    _headerController.dispose();
    for (var controller in _itemControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final screenSize = getScreenSize(screenWidth);

    return VisibilityDetector(
      key: const Key('GtiSoftwareBrings'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.6) {
          _triggerAnimations();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * screenSize.value(30.0, 30.0, 0.1, 0.05),
            vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _headerFade,
              child: SlideTransition(
                position: _headerSlide,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: screenSize.value(30.0, 25.0, 35.0, 50.0),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                              text: "What ",
                              style: TextStyle(
                                  color: utilityFunctions
                                      .getThemeColors(context)["secondary"]!)),
                          TextSpan(
                            text: "GTI Software",
                            style: TextStyle(
                              color: utilityFunctions
                                  .getThemeColors(context)["primary"]!,
                            ),
                          ),
                          TextSpan(
                              text: " brings to your business:",
                              style: TextStyle(
                                  color: utilityFunctions
                                      .getThemeColors(context)["secondary"]!)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: widget.crossAxisCount,
              crossAxisSpacing: screenSize.value(10.0, 20.0, 15.0, 0.0),
              mainAxisSpacing: screenSize.value(10.0, 20.0, 15.0, 0.0),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              childAspectRatio: 1,
              children: List.generate(widget.services.length, (index) {
                final item = widget.services[index];
                return FadeTransition(
                  opacity: _itemFades[index],
                  child: SlideTransition(
                    position: _itemSlides[index],
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenSize.value(70.0, 90.0, 100.0, 100.0),
                            width: screenSize.value(70.0, 90.0, 100.0, 100.0),
                            child: Image.asset(
                              item.iconPath,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize:
                                  screenSize.value(10.0, 12.0, 18.0, 15.0),
                              fontWeight: FontWeight.w600,
                              color: utilityFunctions
                                  .getThemeColors(context)["secondary"]!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
