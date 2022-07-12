import '../../../exports.dart';
import '../core/core.dart';

class TextFieldLikeContainer extends StatelessWidget {
  const TextFieldLikeContainer({Key? key, required this.child, this.width, this.height})
      : super(key: key);

  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: const BoxConstraints(minHeight: AS.buttonHeight),
      decoration: BoxDecoration(
        borderRadius: AS.roundedBorderRadius,
        color: context.theme.inputDecorationTheme.fillColor,
      ),
      child: child,
    );
  }
}
