import '../../../exports.dart';

class TextOrProgress extends StatelessWidget {
  const TextOrProgress(
    this.text, {
    Key? key,
    required this.isProgressing,
    required this.textStyle,
  }) : super(key: key);

  final String text;
  final bool isProgressing;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: textStyle,
        ),
        if (isProgressing)
          Positioned.fill(
            child: Container(
              color: Colors.black,
              child: CircularProgressIndicator(
                color: textStyle.color,
              ),
            ),
          )
      ],
    );
  }
}
