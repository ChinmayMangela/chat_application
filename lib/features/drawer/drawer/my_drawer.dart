import 'package:chat_app/features/drawer/drawer/drawer_tile.dart';
import 'package:chat_app/features/settings/presentation/pages/settings_page.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/services/authentication/authentication_service.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationService authenticationService = AuthenticationService();
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const DrawerHeader(
                child: Icon(
                  Icons.chat,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              DrawerTile(
                icon: Icons.home,
                label: 'H O M E',
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              DrawerTile(
                icon: Icons.settings,
                label: 'S E T T I N G S',
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsPage()));
                },
              ),
            ],
          ),
          DrawerTile(
            icon: Icons.logout,
            label: 'LOG OUT',
            onTap: () {
              Utils.showCircularProgressIndicator(context);
              authenticationService.signOut();
              navigatorKey.currentState?.popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}
