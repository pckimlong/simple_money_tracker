// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../exports.dart';
import '../core/core.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    Key? key,
    this.title,
    this.actions,
    this.backgroundColor,
  }) : super(key: key);

  final String? title;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AS.bottomSheetHeaderHeight,
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AS.wGap8,
          Expanded(
            child: Text(
              title ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(children: actions ?? []),
        ],
      ),
    );
  }
}
