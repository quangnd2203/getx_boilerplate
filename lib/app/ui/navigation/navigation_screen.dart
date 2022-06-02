import 'package:flutter/material.dart';
import 'package:flutter_app/app/constants/app_text_styles.dart';
import 'package:get/get.dart';

import '../ui.dart';

class NavigationScreen extends BaseScreen<NavigationController> {

  final NavigationController controller = Get.find<NavigationController>();

  @override
  Widget buildMobile(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: controller.raw.length,
      itemBuilder: (context, index){
        final item = controller.raw[index];
        return Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all()
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.id!.toString(), style: AppTextStyles.normalBold,),
              const SizedBox(height: 16,),
              Text(item.title!, style: AppTextStyles.normalBold,),
              const SizedBox(height: 16,),
              Text(item.body!),
            ],
          ),
        );
      },
    );
  }

}
