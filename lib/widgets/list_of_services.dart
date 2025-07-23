import 'package:flutter/material.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/utility_functions.dart';

class ServiceItem {
  final String iconPath;
  final String title;
  final String contentHeader;
  final String contentText;

  ServiceItem({
    required this.iconPath,
    required this.title,
    required this.contentHeader,
    required this.contentText,
  });
}

class ListOfServices extends StatefulWidget {
  final List<ServiceItem> services;
  final int crossAxisCount;
  final String headerText;

  const ListOfServices({
    super.key,
    required this.services,
    this.crossAxisCount = 3,
    this.headerText = '',
  });

  @override
  State<ListOfServices> createState() => _ListOfServicesState();
}

class _ListOfServicesState extends State<ListOfServices> {
  int? _activeIndex;

  void _handleCardTap(int index) {
    setState(() {
      _activeIndex = (_activeIndex == index) ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenSize = getScreenSize(screenWidth);
    final theme = utilityFunctions.getThemeColors(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * screenSize.value(0, 0.06, 0.06, 0.1),
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Animated Header
          Padding(
            padding: const EdgeInsets.only(bottom: 45.0),
            child: Align(
              alignment: Alignment.center,
              child: _FadeSlideOnVisible(
                delay: Duration.zero,
                child: Text(
                  widget.headerText,
                  style: TextStyle(
                    fontSize: screenSize.value(25.0, 25.0, 30.0, 50.0),
                    fontWeight: FontWeight.bold,
                    color: theme["secondary"],
                  ),
                ),
              ),
            ),
          ),

          // Services Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: widget.crossAxisCount,
            crossAxisSpacing: screenSize.value(10.0, 15.0, 20.0, 35.0),
            mainAxisSpacing: screenSize.value(15.0, 15.0, 20.0, 35.0),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            childAspectRatio: screenSize.value(50.0, 2, 2.5, 2.6),
            children: List.generate(widget.services.length, (index) {
              final service = widget.services[index];
              final delay = Duration(milliseconds: (index ~/ 3) * 200);

              return _FadeSlideOnVisible(
                delay: delay,
                child: _HoverOverlayCard(
                  service: service,
                  screenSize: screenSize,
                  theme: theme,
                  isActive: _activeIndex == index,
                  onTap: () => _handleCardTap(index),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _HoverOverlayCard extends StatefulWidget {
  final ServiceItem service;
  final ScreenSize screenSize;
  final Map<String, Color> theme;
  final bool isActive;
  final VoidCallback onTap;

  const _HoverOverlayCard({
    required this.service,
    required this.screenSize,
    required this.theme,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_HoverOverlayCard> createState() => _HoverOverlayCardState();
}

class _HoverOverlayCardState extends State<_HoverOverlayCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  bool get isLargeScreen =>
      widget.screenSize.isLarge || widget.screenSize.isExtraLarge;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // If this card is already active on init (e.g. rebuild), animate in
    if (widget.isActive && !isLargeScreen) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant _HoverOverlayCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    // This is what triggers animation after tap
    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(bool hover) {
    if (!isLargeScreen || widget.isActive) return;

    if (hover) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _onEnter(true),
      onExit: (_) => _onEnter(false),
      child: GestureDetector(
        onTap: () {
          if (!isLargeScreen) {
            widget.onTap(); // Will toggle activeIndex at the parent
          }
        },
        child: Card(
          color: widget.theme["tertiary"]!.withAlpha(230),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 2,
          child: Stack(
            children: [
              // Base content
              Padding(
                padding:
                    EdgeInsets.all(widget.screenSize.value(15, 20, 15, 30)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: widget.screenSize.value(30.0, 50.0, 70.0, 100.0),
                      width: widget.screenSize.value(30.0, 50.0, 70.0, 100.0),
                      child: Image.asset(widget.service.iconPath,
                          fit: BoxFit.contain),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Center(
                        child: Text(
                          widget.service.title,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontSize: widget.screenSize.value(12, 12, 13, 18),
                            fontWeight: FontWeight.w500,
                            color: widget.theme["secondary"],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Overlay content
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Container(
                      color: widget.theme["secondary"]!.withAlpha(230),
                      padding: EdgeInsets.all(
                          widget.screenSize.value(10, 15, 20, 15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.service.contentHeader,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: widget.screenSize.value(14, 15, 16, 15),
                              fontWeight: FontWeight.bold,
                              color: widget.theme["tertiary"],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.service.contentText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: widget.screenSize.value(10, 12, 13, 12),
                              color: widget.theme["tertiary"],
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

// Shared Animation Wrapper Widget
class _FadeSlideOnVisible extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const _FadeSlideOnVisible({
    required this.child,
    this.delay = Duration.zero,
  });

  @override
  State<_FadeSlideOnVisible> createState() => _FadeSlideOnVisibleState();
}

class _FadeSlideOnVisibleState extends State<_FadeSlideOnVisible>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _fade = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slide = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _onVisible(VisibilityInfo info) {
    if (info.visibleFraction > 0.3 &&
        _controller.status == AnimationStatus.dismissed) {
      Future.delayed(widget.delay, () {
        if (mounted && _controller.status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    return _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.child.hashCode.toString()),
      onVisibilityChanged: _onVisible,
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(position: _slide, child: widget.child),
      ),
    );
  }
}
