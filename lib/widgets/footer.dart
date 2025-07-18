import 'package:flutter/material.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/utility_functions.dart';
import 'package:gti_website/widgets/navbar.dart';
import 'package:gti_website/widgets/outlined_button.dart';

class Footer extends StatelessWidget {
  final ScrollController scrollController;
  const Footer({super.key, required this.scrollController});

  Widget _buildIconTextItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              softWrap: true,
              overflow: TextOverflow.visible,
              style: const TextStyle(height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftColumn(Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'US Office',
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: color),
        ),
        const SizedBox(height: 10),
        _buildIconTextItem(
            Icons.location_on, '#5450 Montery Road, #29, San Jose, CA – 95111'),
        _buildIconTextItem(Icons.phone_android_sharp, '+1 408 375 5622'),
        _buildIconTextItem(Icons.phone_android, '+1 408 629 0389'),
        _buildIconTextItem(Icons.email, 'alee@gtiinfotech.com'),
        const SizedBox(height: 30),
        Text(
          'GTI Development',
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: color),
        ),
        const SizedBox(height: 10),
        _buildIconTextItem(Icons.location_on,
            "Unit 11 - 2/F Romulo's Bldg, Zone 6, San Isidro, Talisay City, Cebu - 6045 Philippines"),
        _buildIconTextItem(Icons.phone_android_sharp, '+63 920 917 5823'),
        _buildIconTextItem(Icons.phone_android, '+63 32 273-7540'),
        _buildIconTextItem(Icons.email, 'sales@gtiinfotech.com'),
      ],
    );
  }

  Widget _buildRightColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/gti_logo.png',
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: const Text('Privacy Policy')),
              TextButton(onPressed: () {}, child: const Text('Sitemap')),
              TextButton(onPressed: () {}, child: const Text('Contact')),
              TextButton(onPressed: () {}, child: const Text("FAQ's")),
              const SizedBox(width: 20),
              TextOutlinedButton(
                label: 'Back to Top',
                onPressed: () {
                  scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                  );
                },
                color: utilityFunctions.getThemeColors(context)["secondary"]!,
                fontSize: 12,
                borderRadius: 0,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final screenSize = getScreenSize(screenWidth);
    Color color = utilityFunctions.getThemeColors(context)["primary"]!;
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: utilityFunctions.getThemeColors(context)["tertiary"],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      offset: const Offset(0, -4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: screenSize.value(30.0, 30.0, 50, 200),
                  ),
                  child: (screenSize.isSmall || screenSize.isMedium)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLeftColumn(color),
                            const SizedBox(height: 30),
                            _buildRightColumn(context),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildLeftColumn(color)),
                            const SizedBox(width: 30),
                            _buildRightColumn(context),
                          ],
                        ),
                ),
              ),
              Container(
                width: double.infinity,
                color: utilityFunctions.getThemeColors(context)["secondary"]!,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    'Copyright © 2025 GTI Software. All rights reserved.',
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          utilityFunctions.getThemeColors(context)["tertiary"]!,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
