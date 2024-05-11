import 'package:app/src/common_widgets/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/src/features/drawer/presentation/drawer_controler.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawerControllerr _drawerControler = DrawerControllerr(context);

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            // <-- SEE HERE
            decoration: BoxDecoration(color: Colors.red),
            accountName: Text(
              "Pinkesh Darji",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "pinkesh.earth@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: FlutterLogo(),
          ),
          ListTile(
            leading: const Icon(
              Icons.directions_bus_sharp,
            ),
            title: const Text('Driver Login'),
            onTap: () {
              _drawerControler.LoginDriver();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
            ),
            title: const Text('Logout'),
            onTap: () {
              _drawerControler.Logout();
            },
          ),
        ],
      ),
    );
  }
}
