import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onMapTap;
  final VoidCallback onPlacesTap;
  final VoidCallback onLogoutTap;

  const CustomDrawer({
    super.key,
    required this.onHomeTap,
    required this.onMapTap,
    required this.onPlacesTap,
    required this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome User!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'user@example.com',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: onHomeTap,
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Peta'),
            onTap: onMapTap,
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Daftar Tempat'),
            onTap: onPlacesTap,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: onLogoutTap,
          ),
        ],
      ),
    );
  }
}
