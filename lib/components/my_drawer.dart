import 'package:flutter/material.dart';
import 'package:minimal_chatapp/services/auth/service_auth.dart';
import 'package:minimal_chatapp/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: Text("H O M E"),
                  leading: Icon(Icons.home),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                  title: Text("S E T T I N G S"),
                  leading: Icon(Icons.settings),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  onTap: () {},
                  title: Text("N O T I F I C A T I O N"),
                  leading: Icon(Icons.notifications),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              onTap: logout,
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
