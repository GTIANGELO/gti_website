import 'package:flutter/material.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/reusable_variables.dart';
import 'package:gti_website/functions/utility_functions.dart';

class Highlights extends StatefulWidget {
  const Highlights({super.key});

  @override
  State<Highlights> createState() => _HighlightsState();
}

class _HighlightsState extends State<Highlights> with TickerProviderStateMixin {
  bool _visible = false;

  late AnimationController _parentController;
  late Animation<Offset> _parentOffset;
  late Animation<double> _parentOpacity;

  late AnimationController _columnController;
  late Animation<Offset> _leftSlide;
  late Animation<Offset> _rightSlide;

  @override
  void initState() {
    super.initState();

    _parentController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _columnController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _parentOffset = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _parentController,
      curve: Curves.easeOut,
    ));

    _parentOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _parentController,
      curve: Curves.easeOut,
    ));

    _leftSlide = Tween<Offset>(
      begin: const Offset(-0.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _columnController,
      curve: Curves.easeOut,
    ));

    _rightSlide = Tween<Offset>(
      begin: const Offset(0.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _columnController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _parentController.dispose();
    _columnController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.1 && !_visible) {
      setState(() => _visible = true);
      _parentController.forward();
      Future.delayed(const Duration(milliseconds: 200), () {
        _columnController.forward();
      });
    }
  }

  Widget _buildItem(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => _buildItem(item['image']!, item['text']!))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final screenSize = getScreenSize(screenWidth);

    return VisibilityDetector(
      key: const Key('highlights-visibility'),
      onVisibilityChanged: _onVisibilityChanged,
      child: FadeTransition(
        opacity: _parentOpacity,
        child: SlideTransition(
          position: _parentOffset,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Container(
              color: utilityFunctions
                  .getThemeColors(context)["secondary"]!
                  .withValues(alpha: 0.1),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * screenSize.value(0, 0.06, 0.06, 0.1),
                vertical: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Highlights",
                    style: TextStyle(
                      color:
                          utilityFunctions.getThemeColors(context)["secondary"],
                      fontSize: screenSize.value(30.0, 30.0, 40.0, 50.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SlideTransition(
                          position: _leftSlide,
                          child: _buildColumn(Variables().leftColumnItems),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: SlideTransition(
                          position: _rightSlide,
                          child: _buildColumn(Variables().rightColumnItems),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
