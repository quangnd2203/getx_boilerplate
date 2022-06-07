// ignore_for_file: use_key_in_widget_constructors, flutter_style_todos

import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../resources/model/test_model.dart';
import '../ui.dart';

class NavigationScreen extends BaseScreen<NavigationController> {

  @override
  Widget? builder() {
    // TODO: implement builder
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16).copyWith(top: 116),
          child: Center(
            child: Text(controller.count.value.toString()),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.raw.length,
            itemBuilder: (BuildContext context, int index){
              final TestModel item = controller.raw[index];
              return Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all()
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.id!.toString(), style: AppTextStyles.normalBold,),
                    const SizedBox(height: 16,),
                    Text(item.title!, style: AppTextStyles.normalBold,),
                    const SizedBox(height: 16,),
                    Text(item.body!),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

}
