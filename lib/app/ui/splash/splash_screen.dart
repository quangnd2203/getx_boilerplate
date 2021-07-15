import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui.dart';

class SplashScreen extends BaseScreen<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, body: Center(child: CupertinoActivityIndicator()));
  }
}
