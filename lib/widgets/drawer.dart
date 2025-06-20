import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gti_website/functions/reusable_variables.dart';
import 'package:gti_website/widgets/navbar.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  AppDrawerState createState() => AppDrawerState();
}

class AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Optional DrawerHeader
          Container(
            padding: const EdgeInsets.all(14),
            height: 50, // 👈 Set your desired height here
            color: utilityFunctions.getThemeColors(context)["secondary"]!,
            alignment: Alignment.centerLeft,
            child: const Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
          ),

          // Top level nav items
          ...Variables.navItemsTop.map(
            (item) => ListTile(
              title: Text(item['label']!),
              onTap: () {
                context.go(item['route']!);
              },
            ),
          ),

          const Divider(),

          // Dropdown expandable menus
          ...Variables.navItemsDropdown.map(
            (menu) => ExpansionTile(
              title: Text(menu['label'] as String),
              children: [
                ...(menu['items'] as List).map(
                  (subItem) => ListTile(
                    title: Text((subItem as Map<String, String>)['label']!),
                    onTap: () {
                      context.go((subItem)['route']!);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
