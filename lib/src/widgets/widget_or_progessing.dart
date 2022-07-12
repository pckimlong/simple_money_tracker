// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../exports.dart';

class WidgetOrProgressing extends StatelessWidget {
  const WidgetOrProgressing({
    Key? key,
    required this.progressing,
    required this.progressColor,
    required this.child,
    this.size = 18,
  }) : super(key: key);

  final bool progressing;
  final Widget child;
  final Color progressColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return progressing
        ? SizedBox(
            width: size,
            height: size,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: CircularProgressIndicator(
                color: progressColor,
              ),
            ),
          )
        : child;
  }
}
