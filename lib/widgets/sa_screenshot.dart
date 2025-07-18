import 'package:flutter/material.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/utility_functions.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SchoolAutomateSection extends StatefulWidget {
  const SchoolAutomateSection({super.key});

  @override
  State<SchoolAutomateSection> createState() => _SchoolAutomateSectionState();
}

class _SchoolAutomateSectionState extends State<SchoolAutomateSection>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final screenSize = getScreenSize(screenWidth);

    return VisibilityDetector(
      key: const Key('school-automate-section'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.3 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 150),
        child: SizedBox(
          width: screenWidth,
          height: screenHeight * screenSize.value(30.0, 0.75, 1.2, 1.2),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Animated background image
              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                child: AnimatedSlide(
                  offset: _isVisible ? Offset.zero : const Offset(0, 0.2),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  child: Image.asset(
                    'assets/sabg.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Header text animation
              Positioned(
                top: 0,
                right: 0,
                width: screenWidth * 0.61,
                height: screenHeight * 0.3,
                child: AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  child: AnimatedSlide(
                    offset: _isVisible ? Offset.zero : const Offset(0, -0.2),
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeOut,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "Built for Ease, Built for you",
                            style: TextStyle(
                              fontSize: screenSize.value(10, 25, 40, 60),
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Built for Simplicity",
                            style: TextStyle(
                              fontSize: screenSize.value(10, 25, 40, 60),
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
