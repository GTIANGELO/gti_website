import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/utility_functions.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:video_player/video_player.dart';

class MediaCarousel extends StatefulWidget {
  final String videoPath;
  final bool isVideoAsset;
  final List<String> imageUrls;
  final List<bool> areImageAssets;
  final dynamic constraints;

  const MediaCarousel({
    super.key,
    required this.videoPath,
    required this.imageUrls,
    this.isVideoAsset = false,
    this.areImageAssets = const [],
    required this.constraints
  });

  @override
  State<MediaCarousel> createState() => _MediaCarouselState();
}

class _MediaCarouselState extends State<MediaCarousel> {

  late VideoPlayerController _videoController;
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _videoController = widget.isVideoAsset
        ? VideoPlayerController.asset(widget.videoPath)
        : VideoPlayerController.networkUrl(Uri.parse(widget.videoPath));

    _videoController
      ..setVolume(0)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true)
      ..play();
  }

  Widget _buildOverlay(double width, double height) {
    double screenWidth = widget.constraints.maxWidth;
    final screenSize = getScreenSize(screenWidth);

    double headerTextSize = screenWidth * 0.05;
    double fontSize = screenWidth * 0.02;
    double carouselHeight = widget.constraints.maxWidth * screenSize.value(0.45, 0.30, 0.30, 0.20);


    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: width,
        height: carouselHeight,
        padding:  EdgeInsets.symmetric(horizontal: screenSize.value(15, 35, 40, 40), vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              utilityFunctions
                  .getThemeColors(context)["secondary"]!
                  .withValues(alpha: 0.8),
            ],
          ),
        ),
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Software Outsourcing Company',
              style: TextStyle(
                color: utilityFunctions.getThemeColors(context)["primary"]!,
                fontSize: headerTextSize.clamp(20, 70),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              flex: 7,
              child: Text(
                'A leader in Software development focused on providing the best and most cost-effective solutions to small, medium and large businesses. Solutions that help businesses, organizations and individuals to save overhead cost, increase quality and efficiency.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize.clamp(10, 20),
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widget.constraints.maxWidth;
    final screenSize = getScreenSize(screenWidth);

    double carouselHeight = widget.constraints.maxWidth * screenSize.value(1.30, 0.80, 0.80, 0.50);

    final mediaItems = [
      if (_videoController.value.isInitialized)
        Stack(
          children: [
            SizedBox(
              width: screenWidth,
              height: carouselHeight,
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
              height: carouselHeight,
              child:
                  widget.areImageAssets.length > i && widget.areImageAssets[i]
                      ? Image.asset(
                          widget.imageUrls[i],
                          fit: BoxFit.cover,
                          width: screenWidth,
                          height: carouselHeight,
                        )
                      : Image.network(
                          widget.imageUrls[i],
                          fit: BoxFit.cover,
                          width: screenWidth,
                          height: carouselHeight,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 100),
                        ),
            )
          ],
        ),
    ];

    return Stack(
      children: [
        CarouselSlider(
          items: mediaItems,
          carouselController: _carouselController, // ✅ Correct usage
          options: CarouselOptions(
            height: carouselHeight,
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
        _buildOverlay(screenWidth, carouselHeight),
      ],
    );
  }
}
