// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:simple_money_tracker/src/core/core.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    Key? key,
    this.title,
    required this.child,
    this.backgroundColor,
  }) : super(key: key);

  final String? title;
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title == null
          ? null
          : Text(
              title!,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
      backgroundColor: backgroundColor,
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: AS.roundedBorderRadius),
      content: child,
    );
  }
}

class BaseConfirmDialog extends StatelessWidget {
  const BaseConfirmDialog({
    Key? key,
    this.title,
    this.backgroundColor,
    this.child,
    this.onCancelBtnTap,
    this.onConfirmBtnTap,
    this.confirmBtnText = "Ok",
    this.cancelBtnText = "Cancel",
    this.confirmBtnColor,
    this.isConfirmBtnLoading = false,
    this.showCancelBtn = true,
  }) : super(key: key);

  final String? title;
  final Color? backgroundColor;
  final Widget? child;
  final VoidCallback? onCancelBtnTap;
  final VoidCallback? onConfirmBtnTap;
  final String confirmBtnText;
  final String cancelBtnText;
  final Color? confirmBtnColor;
  final bool isConfirmBtnLoading;
  final bool showCancelBtn;

  @override
  Widget build(BuildContext context) {
    final okayBtn = Text(
      key: const ValueKey('Okay'),
      confirmBtnText,
      style: TextStyle(
        color: context.colors.onPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      ),
    );

    var loading = SizedBox(
      key: const ValueKey('loading'),
      width: 18,
      height: 18,
      child: CircularProgressIndicator(
        color: context.colors.onPrimary,
        strokeWidth: 3,
      ),
    );

    return BaseDialog(
      title: title,
      backgroundColor: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(20).copyWith(top: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (child != null) child!,
            AS.hGap20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showCancelBtn
                    ? Expanded(
                        child: GestureDetector(
                          onTap: () => onCancelBtnTap == null
                              ? Navigator.pop(context)
                              : onCancelBtnTap!(),
                          child: Center(
                            child: Text(
                              cancelBtnText,
                              style: TextStyle(
                                color: context.theme.hintColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const Spacer(),
                Expanded(
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: AS.roundedBorderRadius,
                    ),
                    color: confirmBtnColor ?? Theme.of(context).primaryColor,
                    disabledColor: confirmBtnColor?.withOpacity(0.6) ??
                        Theme.of(context).primaryColor.withOpacity(0.6),
                    onPressed: onConfirmBtnTap,
                    child: Center(
                      child: isConfirmBtnLoading ? loading : okayBtn,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
