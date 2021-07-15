import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui.dart';

class NavigationScreen extends BaseScreen<NavigationController> {
  @override
  Widget buildMobile(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SizedBox();
  }
}
