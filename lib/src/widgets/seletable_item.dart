// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:simple_money_tracker/src/core/core.dart';

import '../../../exports.dart';

class SelectableItem extends StatelessWidget {
  const SelectableItem({
    Key? key,
    this.onTap,
    required this.isSelected,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.isEndIndicator = false,
    this.radius = 10,
  }) : super(key: key);

  final VoidCallback? onTap;
  final bool isSelected;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final bool isEndIndicator;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final indicator = [
      Container(
        key: const ValueKey('indicator'),
        width: 5,
        height: 20,
        decoration: isSelected
            ? BoxDecoration(
                color: context.colors.primary,
                borderRadius: BorderRadius.circular(radius),
              )
            : null,
      ),
      AS.wGap8
    ];

    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: isSelected
            ? BoxDecoration(
                color: context.theme.inputDecorationTheme.fillColor,
                borderRadius: BorderRadius.circular(radius),
              )
            : null,
        child: Row(
          children: [
            AS.wGap8,
            if (isEndIndicator == false) ...indicator,
            Expanded(child: child),
            if (isEndIndicator) ...indicator,
          ],
        ),
      ),
    );
  }
}
