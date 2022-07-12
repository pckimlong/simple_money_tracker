import 'package:flutter/material.dart';
import 'package:simple_money_tracker/src/core/app_extensions.dart';

import '../core/app_styles.dart';

class BaseDeleteDialog extends StatelessWidget {
  const BaseDeleteDialog({
    Key? key,
    required this.title,
    this.titleTextStyle,
    this.contentText,
    this.contentWidget,
    required this.onDeletePress,
    this.deleteLabel,
    this.deleteColor,
  })  : assert(contentText == null || contentWidget == null),
        super(key: key);

  static Future<bool?> showDeleteDialog(
    BuildContext context, {
    required VoidCallback onDeletePress,
    String title = 'Are you sure?',
    TextStyle? titleTextStyle,
    Color? deleteColor,
    String? deleteLabel,
    String? contentText,
    Widget? contentWidget,
    bool barrierDismissible = false,
  }) async {
    return await showDialog(
        context: context,
        builder: (_) => BaseDeleteDialog(
              title: title,
              onDeletePress: onDeletePress,
              titleTextStyle: titleTextStyle,
              deleteLabel: deleteLabel,
              contentText: contentText,
              deleteColor: deleteColor,
              contentWidget: contentWidget,
            ),
        barrierDismissible: barrierDismissible);
  }

  final String title;
  final TextStyle? titleTextStyle;
  final String? contentText;
  final Widget? contentWidget;
  final VoidCallback onDeletePress;
  final String? deleteLabel;
  final Color? deleteColor;

  @override
  Widget build(BuildContext context) {
    Widget? content;
    if (contentText != null) {
      content = Text(contentText!);
    }
    if (contentWidget != null) {
      content = contentWidget!;
    }

    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(24, 24, 15, 10),
      title: Text(title, style: titleTextStyle),
      content: content,
      actions: [
        InkWell(
          onTap: () => Navigator.pop(context, false),
          borderRadius: AS.roundedBorderRadius,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Cancel',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: context.theme.colorScheme.primary,
                fontSize: 16,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: onDeletePress,
          borderRadius: AS.roundedBorderRadius,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              deleteLabel ?? 'Delete',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: deleteColor ?? context.theme.errorColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
