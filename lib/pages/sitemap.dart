import 'package:flutter/material.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/widgets/drawer.dart';
import 'package:gti_website/widgets/navbar.dart';

class Sitemap extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Sitemap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: NavBar(
        scaffoldKey: _scaffoldKey,
      ),
      drawer: const AppDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // double width = constraints.maxWidth;
          final screenSize = getScreenSize(constraints.maxWidth);

          if (screenSize.isLarge) {
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
