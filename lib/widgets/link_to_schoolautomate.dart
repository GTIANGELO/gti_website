import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/reusable_variables.dart';
import 'package:gti_website/functions/utility_functions.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:gti_website/widgets/outlined_button.dart';

class LinkToSchoolAutomate extends StatefulWidget {
  const LinkToSchoolAutomate({super.key});

  @override
  State<LinkToSchoolAutomate> createState() => _LinkToSchoolAutomateState();
}

class _LinkToSchoolAutomateState extends State<LinkToSchoolAutomate>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slideOffset;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _slideOffset =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.5 && !_isVisible) {
      _isVisible = true;
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final screenSize = getScreenSize(screenWidth);

    return VisibilityDetector(
      key: const Key('link_to_school_animate'),
      onVisibilityChanged: _onVisibilityChanged,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Container(
          color: utilityFunctions
              .getThemeColors(context)["secondary"]!
              .withValues(alpha: 0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: FadeTransition(
              opacity: _opacity,
              child: SlideTransition(
                position: _slideOffset,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth * screenSize.value(0, 0.06, 0.06, 0.09),
                    vertical: 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 45),
                        child: Text(
                          "Check our very successful, platform independent product SchoolAutomate (made on Java/JSP/AJAX) used by many small & big Universities, Colleges, Highschools and Elementary schools.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/sabg.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  Variables().schoolautomateItems.map((item) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        item['image']!,
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          item['text']!,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Center(
                        child: TextOutlinedButton(
                          label: 'Link me to SchoolAutomate',
                          onPressed: () {
                            if (kDebugMode) {
                              print('Button clicked!');
                            }
                          },
                          color: utilityFunctions
                              .getThemeColors(context)["secondary"]!,
                          fontSize: 14,
                          borderRadius: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
