import 'package:flutter/material.dart';
import 'package:gti_website/functions/reusable_variables.dart';
import 'package:gti_website/widgets/drawer.dart';
import 'package:gti_website/widgets/media_carousel.dart';
import 'package:gti_website/widgets/navbar.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          if (width >= Variables.kBreakpointLarge) {
            return _buildLargeLayout();
          } else if (width >= Variables.kBreakpointMedium) {
            return _buildMediumLayout();
          } else {
            return _buildSmallLayout();
          }
        },
      ),
    );
  }

  Widget _buildLargeLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          NavBar(scaffoldKey: _scaffoldKey),
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
        ],
      ),
    );
  }

  Widget _buildMediumLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          NavBar(scaffoldKey: _scaffoldKey),
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
        ],
      ),
    );
  }

  Widget _buildSmallLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          NavBar(scaffoldKey: _scaffoldKey),
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
        ],
      ),
    );
  }
}
