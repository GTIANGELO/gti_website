import 'package:flutter/material.dart';
import 'package:gti_website/router/app_route_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

final router = MyAppRouter.returnRouter();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'GTI Software Developer Inc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF640E)),
        useMaterial3: true,
      ),
    );
  }
}
