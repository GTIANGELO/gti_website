import 'package:flutter/material.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/reusable_variables.dart';
import 'package:gti_website/functions/utility_functions.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BusinessBoostingFeature extends StatefulWidget {
  final dynamic constraints;
  const BusinessBoostingFeature({super.key, required this.constraints});

  @override
  State<BusinessBoostingFeature> createState() =>
      _BusinessBoostingFeatureState();
}

class _BusinessBoostingFeatureState extends State<BusinessBoostingFeature> {
  int _currentPage = 0;
  bool _headerVisible = false;
  bool _cardVisible = false;

  void _nextPage() {
    if (_currentPage < Variables().items.length - 1) {
      setState(() => _currentPage++);
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      setState(() => _currentPage--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final screenSize = getScreenSize(screenWidth);
    final item = Variables().items[_currentPage];
     double headerTextSize = widget.constraints.maxWidth * 0.05;

    return VisibilityDetector(
      key: const Key('business_boosting_feature'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3 && !_headerVisible) {
          setState(() => _headerVisible = true);
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) setState(() => _cardVisible = true);
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Container(
          color: utilityFunctions
              .getThemeColors(context)["secondary"]!
              .withValues(alpha: 0.1),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  screenWidth * screenSize.value(30.0, 0.01, 0.05, 0.14),
              vertical: 90,
            ),
            child: Column(
              children: [
                AnimatedSlide(
                  offset: _headerVisible ? Offset.zero : const Offset(0, 0.1),
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOut,
                  child: AnimatedOpacity(
                    opacity: _headerVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOut,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Business-Boosting Feature",
                        style: TextStyle(
                          color: utilityFunctions
                              .getThemeColors(context)["secondary"],
                          fontSize: headerTextSize.clamp(40, 70),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                SizedBox(
                  height: screenSize.value(30.0, 300, 400, 400),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedSlide(
                        offset:
                            _cardVisible ? Offset.zero : const Offset(0, 0.1),
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                        child: AnimatedOpacity(
                          opacity: _cardVisible ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOut,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (child, animation) =>
                                FadeTransition(
                                    opacity: animation, child: child),
                            child: Card(
                              key: ValueKey<int>(_currentPage),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(30),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: utilityFunctions
                                                  .getThemeColors(
                                                      context)["secondary"]!,
                                              width: 3,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Image.asset(
                                            item['image'],
                                            fit: BoxFit.contain,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 25),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              item['header'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenSize.value(
                                                    10, 16, 25, 40),
                                                color: utilityFunctions
                                                    .getThemeColors(
                                                        context)["secondary"]!,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          ...item['features'].map<Widget>(
                                            (feature) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                    feature[
                                                        'icon'], // This should be the path like 'assets/icons/my_icon.png'
                                                    width: 25,
                                                    height: 25,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Expanded(
                                                    child: Text(
                                                      feature['text'],
                                                      style: TextStyle(
                                                        fontSize:
                                                            screenSize.value(
                                                                10, 16, 16, 20),
                                                        color: Colors.grey[700],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: AnimatedSlide(
                          offset:
                              _cardVisible ? Offset.zero : const Offset(0, 0.1),
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOut,
                          child: AnimatedOpacity(
                            opacity: _cardVisible ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeOut,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Visibility(
                                    visible: _currentPage > 0,
                                    child: _buildNavButton(
                                        Icons.chevron_left, _prevPage),
                                  ),
                                  Visibility(
                                    visible: _currentPage <
                                        Variables().items.length - 1,
                                    child: _buildNavButton(
                                        Icons.chevron_right, _nextPage),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(IconData icon, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: 32),
        onPressed: onPressed,
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(),
      ),
    );
  }
}
