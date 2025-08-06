import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/reusable_variables.dart';
import 'package:gti_website/functions/utility_functions.dart';
import 'package:gti_website/widgets/navbar.dart';

class Ratings extends StatefulWidget {
  final dynamic constraints;
  const Ratings({super.key, required this.constraints});

  @override
  State<Ratings> createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();
  int _currentPage = 0;
  Timer? _timer;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
      if (_controller.hasClients) {
        _currentPage = (_currentPage + 1) % Variables().comments.length;
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.1 && !_isVisible) {
      _isVisible = true;
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final screenSize = getScreenSize(screenWidth);
    double headerTextSize = widget.constraints.maxWidth * 0.05;

    return VisibilityDetector(
      key: const Key('ratings-section'),
      onVisibilityChanged: _onVisibilityChanged,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Container(
                  color: utilityFunctions
                      .getThemeColors(context)["secondary"]!
                      .withValues(alpha: 0.1),
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth * screenSize.value(0, 0.02, 0.03, 0.1),
                    vertical: screenSize.value(10, 40, 50, 50),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Hear it From Our Users",
                        style: TextStyle(
                          fontSize: headerTextSize.clamp(40, 70),
                          fontWeight: FontWeight.w700,
                          color: utilityFunctions
                              .getThemeColors(context)["primary"],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios, size: 28),
                            onPressed: () {
                              if (_currentPage > 0) {
                                _timer?.cancel();
                                _currentPage--;
                                _controller.animateToPage(
                                  _currentPage,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeInOut,
                                );
                                _startAutoScroll();
                              }
                            },
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: SizedBox(
                              height: 400,
                              child: PageView.builder(
                                controller: _controller,
                                itemCount: Variables().comments.length,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentPage = index;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  final comment = Variables().comments[index];
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        bottom: 140,
                                        left: 50,
                                        right: 50,
                                        child: Card(
                                          elevation: 1,
                                          color: utilityFunctions
                                              .getThemeColors(
                                                  context)["primary"]!
                                              .withValues(alpha: 0.6),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: SizedBox(
                                              height: screenSize.value(120, 140, 150, 150),
                                              child: Center(
                                                child: Text(
                                                  comment["text"] ?? "",
                                                  style: TextStyle(
                                                    fontSize: screenSize.value(8, 16, 18, 18),
                                                    color: utilityFunctions
                                                            .getThemeColors(
                                                                context)[
                                                        "tertiary"]!,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: screenSize.value(8, 20, 20, 20),
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              radius: screenSize.value(40, 40, 50, 50),
                                              backgroundImage: AssetImage(
                                                  comment["image"] ?? ""),
                                            ),
                                            const SizedBox(height: 12),
                                            Text(
                                              comment["user"] ?? "",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              comment["position"] ?? "",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios, size: 28),
                            onPressed: () {
                              if (_currentPage <
                                  Variables().comments.length - 1) {
                                _timer?.cancel();
                                _currentPage++;
                                _controller.animateToPage(
                                  _currentPage,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeInOut,
                                );
                                _startAutoScroll();
                              }
                            },
                          ),
                        ],
                      ),
                    ],
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
