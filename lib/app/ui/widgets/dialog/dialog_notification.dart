import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/extensions/extensions.dart';

class DialogNotification extends StatelessWidget {
  final String keyTitle;
  final String keyAction;
  final bool trans;
  final Function action;

  const DialogNotification(
      {this.keyTitle, this.trans = true, this.action, this.keyAction});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
          elevation: 8,
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: HexColor.fromHex("#fdfefe"),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "notification".tr,
                style: STYLE_MEDIUM_BOLD,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  trans ? keyTitle.tr : keyTitle,
                  style: STYLE_MEDIUM,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              InkWell(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                onTap: action ?? () => Navigator.pop(context, true),
                child: Container(
                  decoration: BoxDecoration(
                      color: COLOR_PRIMARY,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16))),
                  height: 45,
                  child: Center(
                    child: Text(
                      'accept'.tr,
                      style: STYLE_MEDIUM_BOLD.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
