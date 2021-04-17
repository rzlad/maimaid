import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "page_home");
    });

    return Scaffold(
      body: Center(
        child: Text(
          "Hello :)",
          style: TextStyle(
            fontSize: 28,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
