import 'package:flutter/material.dart';

class DrawerControllerr {
  BuildContext context;
  DrawerControllerr(this.context);

  void Logout() {
    // logout command
    Navigator.pop(context);
  }

  void LoginDriver() {
    //change route to driver login
    Navigator.pop(context);
  }
}
