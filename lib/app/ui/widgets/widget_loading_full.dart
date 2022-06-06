import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../constants/constants.dart';

class WidgetLoadingFullScreen extends StatelessWidget {
  final Widget child;
  final bool loading;
  final Color? colorBackground;
  final Color? colorLoading;

  const WidgetLoadingFullScreen(
      {Key? key,
      required this.child,
      this.colorBackground,
      this.colorLoading,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        loading ? _LoadingWidget(colorBackground, colorLoading) : const SizedBox(),
      ],
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
      color: background ?? Colors.black12,
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
