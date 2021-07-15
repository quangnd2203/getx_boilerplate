import 'package:flutter/material.dart';

enum AppThemeModeType { light, dark }

class AppThemeMode extends InheritedWidget {
  final _WidgetThemeSwitcherState data;

  const AppThemeMode({Key? key, required this.data, required Widget child})
      : super(child: child, key: key);

  static _WidgetThemeSwitcherState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppThemeMode>()!.data;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return this != oldWidget;
  }
}

class WidgetThemeSwitcher extends StatefulWidget {
  final Widget child;
  final AppThemeModeType init;

  const WidgetThemeSwitcher({Key? key, required this.child, required this.init}) : super(key: key);

  @override
  _WidgetThemeSwitcherState createState() => _WidgetThemeSwitcherState();
}

class _WidgetThemeSwitcherState extends State<WidgetThemeSwitcher> {
  late AppThemeModeType? mode;

  bool get isLight => mode == AppThemeModeType.light;

  bool get isDark => mode == AppThemeModeType.dark;

  void switchMode({AppThemeModeType? mode}) {
    if (mode != null && this.mode != mode)
      setState(() {
        this.mode = mode;
      });
  }

  @override
  Widget build(BuildContext context) {
    mode ??= widget.init;
    return AppThemeMode(
      data: this,
      child: widget.child,
    );
  }
}
