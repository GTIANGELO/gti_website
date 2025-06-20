import 'package:flutter/material.dart';
import 'package:gti_website/functions/reusable_variables.dart';
import 'package:gti_website/widgets/drawer.dart';
import 'package:gti_website/widgets/navbar.dart';

class Sitemap extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Sitemap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: NavBar(scaffoldKey: _scaffoldKey),
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
      // bottomNavigationBar: const Padding(
      //   padding: EdgeInsets.all(16.0),
      //   child: Text(
      //     '© 2025 GTI Software Developer Inc.',
      //     textAlign: TextAlign.center,
      //   ),
      // ),
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
