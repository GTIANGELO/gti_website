import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/reusable_variables.dart';
import 'package:gti_website/functions/utility_functions.dart';
import 'package:gti_website/widgets/navbar.dart';

class SiteMapWidget extends StatelessWidget {
  final int columnCount;

  const SiteMapWidget({
    super.key,
    required this.columnCount,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final screenSize = getScreenSize(screenWidth);

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Sitemap",
              style: TextStyle(
                fontSize: screenSize.value(30.0, 40.0, 55.0, 60),
                color: utilityFunctions.getThemeColors(context)["primary"],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 50),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: columnCount,
            crossAxisSpacing: 25,
            mainAxisSpacing: 25,
            childAspectRatio: 4 / 3, // Smaller card
            physics: const NeverScrollableScrollPhysics(),
            children: Variables.sitemapItems.map((item) {
              final links = item['links'] as List<dynamic>;
              final hasHeader = item.containsKey('header');
              final header = item['header'] as String?;

              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: hasHeader
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      if (hasHeader)
                        Text(
                          header ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      if (hasHeader) const SizedBox(height: 15),
                      ...links.map((linkItem) {
                        final label = linkItem['label'] as String;
                        final path = linkItem['path'] as String;

                        bool isHovered = false;

                        return StatefulBuilder(
                          builder: (context, setState) {
                            return MouseRegion(
                              cursor: SystemMouseCursors.click,
                              onEnter: (_) => setState(() => isHovered = true),
                              onExit: (_) => setState(() => isHovered = false),
                              child: GestureDetector(
                                onTap: () {
                                  if (kDebugMode) {
                                    print('Navigate to: $path');
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    label,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: utilityFunctions
                                          .getThemeColors(context)["secondary"],
                                      decoration: isHovered
                                          ? TextDecoration.underline
                                          : TextDecoration.none,
                                      fontSize: hasHeader ? 14 : 18,
                                      fontWeight:
                                          hasHeader ? null : FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
