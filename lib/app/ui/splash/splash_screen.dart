// ignore_for_file: use_key_in_widget_constructors, flutter_style_todos

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ui.dart';

class SplashScreen extends BaseScreen<SplashController> {
  @override
  Widget? builder() {
    // TODO: implement builder
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
