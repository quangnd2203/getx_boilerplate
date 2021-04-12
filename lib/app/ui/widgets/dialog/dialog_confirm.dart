import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:werewolf_client/app/constants/app_text_theme.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/extensions/extensions.dart';

class DialogConfirm extends StatelessWidget {
  final String keyTitle;
  final String content;
  final bool transTitle;
  final bool transContent;
  final Function actionCancel;
  final Function actionConfirm;

  const DialogConfirm(
      {this.keyTitle,
      this.transTitle = true,
      @required this.content,
      this.transContent = false,
      this.actionCancel,
      this.actionConfirm});

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
              keyTitle == null
                  ? 'confirm'.tr
                  : transTitle
                      ? keyTitle.tr
                      : keyTitle,
              style: STYLE_MEDIUM_BOLD,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                transContent ? content.tr : content,
                style: STYLE_MEDIUM,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: InkWell(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  onTap: () => Navigator.pop(context, false),
                  child: Container(
                    decoration: BoxDecoration(
                      color: COLOR_PRIMARY,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(16)),
                    ),
                    height: 45,
                    child: Center(
                      child: Text(
                        'cancel'.tr,
                        style: STYLE_MEDIUM_BOLD.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                )),
                const SizedBox(
                  width: 1,
                ),
                Expanded(
                    child: InkWell(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(16)),
                  onTap: actionConfirm ?? () => Navigator.pop(context, true),
                  child: Container(
                    decoration: BoxDecoration(
                        color: COLOR_PRIMARY,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(16))),
                    height: 45,
                    child: Center(
                      child: Text(
                        'accept'.tr,
                        style: STYLE_MEDIUM_BOLD.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                )),
              ],
            )
          ],
        ));
  }
}
