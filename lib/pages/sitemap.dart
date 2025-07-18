import 'package:flutter/material.dart';
import 'package:gti_website/functions/navbar_controller.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/widgets/drawer.dart';
import 'package:gti_website/widgets/footer.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:gti_website/widgets/sitemap.dart';

class Sitemap extends StatefulWidget {
  const Sitemap({super.key});

  @override
  State<Sitemap> createState() => _SitemapState();
}

class _SitemapState extends State<Sitemap> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  final NavBarController _navBarController =
      NavBarController(initiallyHidden: false);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _scrollController.addListener(() {
      _navBarController.handleScroll(
        scrollController: _scrollController,
        animationController: _animationController,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(const AssetImage('assets/gti_logo_2.png'), context);

      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utilityFunctions.getThemeColors(context)["tertiary"]!,
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenSize = getScreenSize(constraints.maxWidth);
          if (screenSize.isExtraLarge) {
            return _buildExtraLargeLayout();
          } else if (screenSize.isLarge) {
            return _buildLargeLayout();
          } else if (screenSize.isMedium) {
            return _buildMediumLayout();
          } else if (screenSize.isSmall) {
            return _buildSmallLayout();
          }
          return const Center(child: Text('Unsupported screen size'));
        },
      ),
    );
  }

  Widget _buildExtraLargeLayout() {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 130),
              const SiteMapWidget(columnCount: 4),
              Footer(scrollController: _scrollController),
            ],
          ),
        ),

        // Overlay Navbar that only shows when sliding back
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SlideTransition(
            position: _slideAnimation,
            child: Container(
              color: utilityFunctions.getThemeColors(context)["background"],
              child: NavBar(scaffoldKey: _scaffoldKey),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLargeLayout() {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50),
          Center(child: Text('Large Screen Layout')),
        ],
      ),
    );
  }

  Widget _buildMediumLayout() {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50),
          Center(child: Text('Medium Screen Layout')),
        ],
      ),
    );
  }

  Widget _buildSmallLayout() {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50),
          Center(child: Text('Small Screen Layout')),
        ],
      ),
    );
  }
}
