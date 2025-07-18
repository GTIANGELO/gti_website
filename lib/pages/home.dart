import 'package:flutter/material.dart';
import 'package:gti_website/functions/navbar_controller.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/reusable_variables.dart';
import 'package:gti_website/widgets/business_boosting_feature.dart';
import 'package:gti_website/widgets/chatbox.dart';
import 'package:gti_website/widgets/drawer.dart';
import 'package:gti_website/widgets/footer.dart';
import 'package:gti_website/widgets/gti_software_brings.dart';
import 'package:gti_website/widgets/highlights.dart';
import 'package:gti_website/widgets/link_to_schoolautomate.dart';
import 'package:gti_website/widgets/list_of_services.dart';
import 'package:gti_website/widgets/media_carousel.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:gti_website/widgets/quick_contact.dart';
import 'package:gti_website/widgets/ratings.dart';
import 'package:gti_website/widgets/sa_screenshot.dart';
import 'package:gti_website/widgets/valued_clients.dart';
import 'package:gti_website/widgets/we_gti_software.dart';
import 'package:gti_website/widgets/what_we_provide.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ChatBoxPanelState> chatBoxKey =
      GlobalKey<ChatBoxPanelState>();
  final ValueNotifier<bool> isChatOpen = ValueNotifier(false);

  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  final NavBarController _navBarController = NavBarController(initiallyHidden: false);

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
      precacheImage(const AssetImage('assets/carousel_media/1.jpg'), context);
      precacheImage(const AssetImage('assets/carousel_media/2.jpg'), context);
      precacheImage(const AssetImage('assets/carousel_media/3.jpg'), context);

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
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: isChatOpen,
        builder: (context, isOpen, child) {
          return Visibility(
            visible: !isOpen,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
              child: FloatingActionButton(
                onPressed: () {
                  chatBoxKey.currentState?.toggle();
                },
                tooltip: "FAQ's",
                child: Icon(
                  Icons.message_outlined,
                  size: 20,
                  color: utilityFunctions.getThemeColors(context)["secondary"],
                ),
              ),
            ),
          );
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
              const SizedBox(height: 50),
              const MediaCarousel(
                videoPath: 'assets/carousel_media/vid1.mp4',
                isVideoAsset: true,
                imageUrls: [
                  'assets/carousel_media/1.jpg',
                  'assets/carousel_media/2.jpg',
                  'assets/carousel_media/3.jpg',
                ],
                areImageAssets: [true, true, true],
              ),
              const WeAtGTI(),
              ListOfServices(
                services: Variables.serviceItems,
                crossAxisCount: 3,
                headerText: 'Our Services',
              ),
              GtiSoftwareBrings(
                services: Variables.bringItems,
                crossAxisCount: 6,
              ),
              const BusinessBoostingFeature(),
              const SchoolAutomateSection(),
              const Highlights(),
              const WhateWeProvide(),
              const LinkToSchoolAutomate(),
              const ValuedClients(crossAxisCount: 6),
              const Ratings(),
              const QuickContact(),
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

        ChatBoxPanel(
          key: chatBoxKey,
          isOpenNotifier: isChatOpen,
        ),
      ],
    );
  }

  Widget _buildLargeLayout() {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const MediaCarousel(
                videoPath: 'assets/carousel_media/vid1.mp4',
                isVideoAsset: true,
                imageUrls: [
                  'assets/carousel_media/1.jpg',
                  'assets/carousel_media/2.jpg',
                  'assets/carousel_media/3.jpg',
                ],
                areImageAssets: [true, true, true],
              ),
              const WeAtGTI(),
              ListOfServices(
                services: Variables.serviceItems,
                crossAxisCount: 3,
                headerText: 'Our Services',
              ),
              GtiSoftwareBrings(
                services: Variables.bringItems,
                crossAxisCount: 3,
              ),
              const BusinessBoostingFeature(),
              const SchoolAutomateSection(),
              const Highlights(),
              const WhateWeProvide(),
              const LinkToSchoolAutomate(),
              const ValuedClients(crossAxisCount: 5),
              const Ratings(),
              const QuickContact(),
              Footer(scrollController: _scrollController)
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

  Widget _buildMediumLayout() {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const MediaCarousel(
                videoPath: 'assets/carousel_media/vid1.mp4',
                isVideoAsset: true,
                imageUrls: [
                  'assets/carousel_media/1.jpg',
                  'assets/carousel_media/2.jpg',
                  'assets/carousel_media/3.jpg',
                ],
                areImageAssets: [true, true, true],
              ),
              const WeAtGTI(),
              ListOfServices(
                services: Variables.serviceItems,
                crossAxisCount: 2,
                headerText: 'Our Services',
              ),
              GtiSoftwareBrings(
                services: Variables.bringItems,
                crossAxisCount: 2,
              ),
              const BusinessBoostingFeature(),
              const SchoolAutomateSection(),
              const Highlights(),
              const WhateWeProvide(),
              const LinkToSchoolAutomate(),
              const ValuedClients(crossAxisCount: 3),
              const Ratings(),
              const QuickContact(),
              Footer(scrollController: _scrollController)
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

  Widget _buildSmallLayout() {
    return Stack(
      children: [
        // Background scrollable content
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // const SizedBox(height: 50),
              const MediaCarousel(
                videoPath: 'assets/carousel_media/vid1.mp4',
                isVideoAsset: true,
                imageUrls: [
                  'assets/carousel_media/1.jpg',
                  'assets/carousel_media/2.jpg',
                  'assets/carousel_media/3.jpg',
                ],
                areImageAssets: [true, true, true],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: WeAtGTI(),
              ),
              ListOfServices(
                services: Variables.serviceItems,
                crossAxisCount: 2,
                headerText: 'List of Services',
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
                child: GtiSoftwareBrings(
                  services: Variables.bringItems,
                  crossAxisCount: 2,
                ),
              ),
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
}
