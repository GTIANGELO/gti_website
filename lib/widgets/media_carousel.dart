import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:video_player/video_player.dart';

class MediaCarousel extends StatefulWidget {
  final String videoPath;
  final bool isVideoAsset;
  final List<String> imageUrls;
  final List<bool> areImageAssets;

  const MediaCarousel({
    super.key,
    required this.videoPath,
    required this.imageUrls,
    this.isVideoAsset = false,
    this.areImageAssets = const [],
  });

  @override
  State<MediaCarousel> createState() => _MediaCarouselState();
}

class _MediaCarouselState extends State<MediaCarousel> {
  late VideoPlayerController _videoController;
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _videoController = widget.isVideoAsset
        ? VideoPlayerController.asset(widget.videoPath)
        : VideoPlayerController.networkUrl(Uri.parse(widget.videoPath));

    _videoController
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true)
      ..play();
  }

  Widget _buildOverlay(double width, double height) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenSize = getScreenSize(constraints.maxWidth);

          final double headerFontSize = screenSize.isSmall
              ? 15
              : screenSize.isMedium
                  ? 28
                  : 35;

          final double bodyFontSize = screenSize.isSmall
              ? 10
              : screenSize.isMedium
                  ? 16
                  : 20;

          return Container(
            width: width,
            height: screenSize.isSmall
                ? height * 0.6
                : screenSize.isMedium
                    ? height * 0.5
                    : height * 0.4,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Software Outsourcing Company',
                  style: TextStyle(
                    color: utilityFunctions.getThemeColors(context)["primary"]!,
                    fontSize: headerFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 🟦 Text block (70%)
                    Expanded(
                      flex: 7,
                      child: Text(
                        'A leader in Software development focused on providing the best and most cost-effective solutions to small, medium and large businesses. Solutions that help businesses, organizations and individuals to save overhead cost, increase quality and efficiency.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: bodyFontSize,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                    if (!screenSize.isSmall && !screenSize.isMedium)
                      Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios,
                                  color: Colors.white, size: 30),
                              onPressed: () {
                                _carouselController.previousPage();
                              },
                            ),
                            const SizedBox(width: 12),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward_ios,
                                  color: Colors.white, size: 30),
                              onPressed: () {
                                _carouselController.nextPage();
                              },
                            ),
                          ],
                        ),
                      ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dynamicHeight = screenWidth * (9 / 22);

    final mediaItems = [
      if (_videoController.value.isInitialized)
        Stack(
          children: [
            SizedBox(
              width: screenWidth,
              child: FittedBox(
                fit: BoxFit.cover,
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: _videoController.value.size.width,
                  height: _videoController.value.size.height,
                  child: VideoPlayer(_videoController),
                ),
              ),
            ),
          ],
        ),
      for (int i = 0; i < widget.imageUrls.length; i++)
        Stack(
          children: [
            SizedBox(
              width: screenWidth,
              child:
                  widget.areImageAssets.length > i && widget.areImageAssets[i]
                      ? Image.asset(widget.imageUrls[i],
                          fit: BoxFit.cover, width: screenWidth)
                      : Image.network(
                          widget.imageUrls[i],
                          fit: BoxFit.cover,
                          width: screenWidth,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 100),
                        ),
            ),
          ],
        ),
    ];

    return Stack(
      children: [
        CarouselSlider(
          items: mediaItems,
          carouselController: _carouselController,
          options: CarouselOptions(
            height: dynamicHeight,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 25),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
                if (_currentIndex == 0 &&
                    _videoController.value.isInitialized) {
                  _videoController.play();
                } else {
                  _videoController.pause();
                }
              });
            },
          ),
        ),
        _buildOverlay(screenWidth, dynamicHeight),
      ],
    );
  }
}
