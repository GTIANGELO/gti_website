import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/utility_functions.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:gti_website/widgets/outlined_button.dart';

class QuickContact extends StatefulWidget {
  const QuickContact({super.key});

  @override
  State<QuickContact> createState() => _QuickContactState();
}

class _QuickContactState extends State<QuickContact>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;
  bool _isVisible = false;

  final TextEditingController contactName = TextEditingController();
  final TextEditingController contactNumber = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.1 && !_isVisible) {
      _isVisible = true;
      _controller.forward();
    }
  }

  @override
  void dispose() {
    contactName.dispose();
    contactNumber.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final screenSize = getScreenSize(screenWidth);
    return VisibilityDetector(
      key: const Key('quick-contact-section'),
      onVisibilityChanged: _onVisibilityChanged,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      screenWidth * screenSize.value(0, 0.06, 0.06, 0.19),
                  vertical: 80,
                ),
                child: Card(
                  color: utilityFunctions.getThemeColors(context)["tertiary"]!,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      children: [
                        // Left: Image
                        Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/contact.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),

                        // Right: Form
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quick Contact',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: utilityFunctions
                                      .getThemeColors(context)["secondary"],
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: contactName,
                                decoration: const InputDecoration(
                                  labelText: 'Full Name',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: contactNumber,
                                decoration: const InputDecoration(
                                  labelText: 'Contact Number',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(height: 18),
                              TextOutlinedButton(
                                label: 'Submit',
                                onPressed: () {
                                  if (kDebugMode) {
                                    print('Button clicked!');
                                  }
                                },
                                color: utilityFunctions
                                    .getThemeColors(context)["secondary"]!,
                                fontSize: 12,
                                borderRadius: 0,
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
          );
        },
      ),
    );
  }
}
