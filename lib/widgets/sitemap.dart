import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/reusable_variables.dart';
import 'package:gti_website/functions/utility_functions.dart';
import 'package:gti_website/widgets/navbar.dart';

class SiteMapWidget extends StatelessWidget {
  final int columnCount;
  final dynamic constraints;

  const SiteMapWidget({
    super.key,
    required this.columnCount,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final screenSize = getScreenSize(screenWidth);
    double fontSize = constraints.maxWidth * 0.02;
    double headerTextSize = constraints.maxWidth * 0.05;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenSize.value(5, 70, 80, 100)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Sitemap",
              style: TextStyle(
                fontSize: headerTextSize.clamp(40, 70),
                color: utilityFunctions.getThemeColors(context)["primary"],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // or use scrollable if needed
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisSpacing: 25,
              crossAxisSpacing: 25,
              // childAspectRatio: 3/2,
            ),
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
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (hasHeader)
                        Text(
                          header ?? '',
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize.clamp(24, 30),
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
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: Text(
                                    label,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: utilityFunctions
                                          .getThemeColors(context)["secondary"],
                                      decoration: isHovered
                                          ? TextDecoration.underline
                                          : TextDecoration.none,
                                      fontSize: hasHeader ? fontSize.clamp(16, 18) : 20,
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
