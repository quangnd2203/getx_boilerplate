import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../constants/constants.dart';
import '../ui.dart';

class WidgetLoadingFullScreen<T extends BaseController>
    extends StatelessWidget {
  final Widget Function(T) builder;
  final Color? colorBackground;
  final Color? colorLoading;

  const WidgetLoadingFullScreen(
      {Key? key, required this.builder, this.colorBackground, this.colorLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<T>(
      builder: (controller) {
        return Stack(
          children: <Widget>[
            builder(controller),
            controller.loading.value
                ? _LoadingWidget(colorBackground, colorLoading)
                : SizedBox(),
          ],
        );
      },
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  final Color? background;
  final Color? colorLoading;

  const _LoadingWidget(this.background, this.colorLoading);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background ?? Colors.black45,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Center(
        child: SpinKitCircle(
          color: colorLoading ?? AppColors.primary,
          size: 55,
        ),
      ),
    );
  }
}
