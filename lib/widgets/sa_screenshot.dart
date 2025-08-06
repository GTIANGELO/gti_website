import 'package:flutter/material.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/utility_functions.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SchoolAutomateSection extends StatefulWidget {
  final dynamic constraints;

  const SchoolAutomateSection({super.key, required this.constraints});

  @override
  State<SchoolAutomateSection> createState() => _SchoolAutomateSectionState();
}

class _SchoolAutomateSectionState extends State<SchoolAutomateSection>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = widget.constraints.maxWidth;
    final double imageWidth = screenWidth * 0.9;
    final double imageHeight = screenWidth * 0.5;
    double fontSize = widget.constraints.maxWidth * 0.05;


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
          padding: const EdgeInsets.symmetric(vertical: 130),
          child: SizedBox(
            width: imageWidth,
            height: imageHeight.clamp(300, 1500),
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
                      width: imageWidth,
                      height: imageHeight,
                      alignment: Alignment.center,
                    ),
                  ),
                ),

                // Header text animation
                Positioned(
                  top: 0,
                  right: 0,
                  width: imageWidth * 0.70,
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
                        padding: EdgeInsets.all(screenSize.value(0, 0, 0, 20)),
                        child: Column(
                          children: [
                            Text(
                              "Built for Ease, Built for you",
                              style: TextStyle(
                                fontSize: fontSize.clamp(15, 70),
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "Built for Simplicity",
                              style: TextStyle(
                                fontSize: fontSize.clamp(15, 70),
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
