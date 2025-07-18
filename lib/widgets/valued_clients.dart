import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/reusable_variables.dart';
import 'package:gti_website/functions/utility_functions.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:gti_website/widgets/outlined_button.dart';

class ValuedClients extends StatefulWidget {
  final int crossAxisCount;

  const ValuedClients({
    super.key,
    this.crossAxisCount = 5,
  });

  @override
  State<ValuedClients> createState() => _ValuedClientsState();
}

class _ValuedClientsState extends State<ValuedClients>
    with SingleTickerProviderStateMixin {
  bool _visible = false;
  List<bool> _imageVisible = [];

  @override
  void initState() {
    super.initState();
    _imageVisible =
        List.generate(Variables().imagePaths.length, (index) => false);
  }

  void _triggerAnimations() async {
    if (_visible) return;

    setState(() {
      _visible = true;
    });

    // Fade in images in random groups of 3
    final paths = Variables().imagePaths;
    final indexes = List.generate(paths.length, (i) => i)..shuffle();

    for (int i = 0; i < indexes.length; i += 3) {
      await Future.delayed(const Duration(milliseconds: 200));
      setState(() {
        for (int j = i; j < i + 3 && j < indexes.length; j++) {
          _imageVisible[indexes[j]] = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final int clampedCount = widget.crossAxisCount.clamp(1, 6);
    final double screenWidth = MediaQuery.of(context).size.width;
    final screenSize = getScreenSize(screenWidth);

    return VisibilityDetector(
      key: const Key('valued_clients'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1) {
          _triggerAnimations();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * screenSize.value(30.0, 0.1, 0.1, 0.13),
          vertical: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeOut,
              child: AnimatedSlide(
                offset: _visible ? Offset.zero : const Offset(0, 0.2),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOut,
                child: Text(
                  "Our Valued Clients",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            GridView.count(
              crossAxisCount: clampedCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 80,
              mainAxisSpacing: 80,
              children: List.generate(Variables().imagePaths.length, (i) {
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 600),
                  opacity: _imageVisible[i] ? 1.0 : 0.0,
                  curve: Curves.easeIn,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(
                      Variables().imagePaths[i],
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 80),
            Center(
              child: TextOutlinedButton(
                label: 'View More',
                onPressed: () {
                  if (kDebugMode) {
                    print('Button clicked!');
                  }
                },
                color: utilityFunctions.getThemeColors(context)["secondary"]!,
                fontSize: 12,
                borderRadius: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
