// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gti_website/pages/contact.dart';
import 'package:gti_website/pages/home.dart';
import 'package:gti_website/pages/sitemap.dart';
import 'package:gti_website/router/app_route_constants.dart';

class MyAppRouter {
  static GoRouter returnRouter() {
    return GoRouter(
      initialLocation: AppRoutePaths.home,

      routes: [
        // Home
        GoRoute(
          name: AppRoutePaths.home,
          path: AppRoutePaths.home,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Homepage(),
          ),
        ),
        GoRoute(
          name: AppRoutePaths.sitemap,
          path: AppRoutePaths.sitemap,
          // builder: (context, state) => const Sitemap(),
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Sitemap(),
          ),
        ),
        GoRoute(
          name: AppRoutePaths.contact,
          path: AppRoutePaths.contact,
          pageBuilder: (context, state) => NoTransitionPage(
            child: Contact(),
          ),
        ),
      ],
      // errorBuilder: (context, state) {
      //   WidgetsBinding.instance.addPostFrameCallback((_) {
      //     context.go(AppRoutePaths.home);
      //   });
      //   return const SizedBox.shrink();
      // },
    );
  }
}
