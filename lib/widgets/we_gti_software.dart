import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/utility_functions.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:gti_website/widgets/outlined_button.dart';

class WeAtGTI extends StatefulWidget {
  final dynamic constraints;

  const WeAtGTI({
    super.key, required this.constraints
  });

  @override
  State<WeAtGTI> createState() => _WeAtGTIState();
}

class _WeAtGTIState extends State<WeAtGTI> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!_hasAnimated && info.visibleFraction > 0.3) {
      _controller.forward();
      _hasAnimated = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = widget.constraints.maxWidth;
    final screenSize = getScreenSize(screenWidth);
    final Color highlightColor =  utilityFunctions.getThemeColors(context)["primary"]!;
    double fontSize =  screenWidth * 0.02;
    double headerTextSize = widget.constraints.maxWidth * 0.05;

    return VisibilityDetector(
      key: const Key('WeAtGTI_Visibility'),
      onVisibilityChanged: _onVisibilityChanged,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    screenWidth * screenSize.value(15.0, 0.08, 0.08, 0.1),
                vertical: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: headerTextSize.clamp(20, 70),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          text: 'We at, ',
                          style: TextStyle(
                              color: utilityFunctions
                                  .getThemeColors(context)["secondary"]!)),
                      TextSpan(
                        text: 'GTI Software',
                        style: TextStyle(color: highlightColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.justify,
                  "Recognize the value of the business, its efficiency, cost effectiveness, on-time and high quality product delivery. We have achieved this by strategic global model combining the best technology available with unparalleled expertise and innovation by highly skilled workforce of GTI Software. We bring you the best of savings and superior quality of offshore development. We offer unmatched cost savings and commitment to deliver premium quality product on time.",
                  style: TextStyle(
                    fontSize: fontSize.clamp(10, 20),
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  textAlign: TextAlign.justify,
                  "Our Client-driven approach and commitment to deliver Software solutions that exceed our client's expectation makes us different from other outsourcing companies in the market. For every single project we not only offer supreme quality product but also we study, analyze, research and provide right solution at a very affordable cost. We provide solutions that match your budget and schedule. With GTI, your IT is in good hands @ 24/7. Let GTI professionals handle your IT needs so you can be free and focused on your core business expansion and extension.",
                  style: TextStyle(
                    fontSize: fontSize.clamp(10, 20),
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: TextOutlinedButton(
                    label: 'Read More',
                    onPressed: () {
                      if (kDebugMode) {
                        print('Button clicked!');
                      }
                    },
                    color:
                        utilityFunctions.getThemeColors(context)["secondary"]!,
                    fontSize: 12,
                    borderRadius: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
