// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:shimmer/shimmer.dart';

// import '../../../exports.dart';

// class MyShimmer extends StatelessWidget {
//   const MyShimmer({
//     Key? key,
//     required this.child,
//     this.enabled = true,
//     this.baseColor,
//   }) : super(key: key);

//   final Widget child;
//   final bool enabled;
//   final Color? baseColor;

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       enabled: enabled,
//       baseColor:
//           baseColor?.withAlpha(25) ?? Theme.of(context).hintColor.withAlpha(25),
//       highlightColor:
//           baseColor?.withAlpha(10) ?? Theme.of(context).hintColor.withAlpha(10),
//       child: child,
//     );
//   }
// }

// class TextShimmer extends StatelessWidget {
//   const TextShimmer({
//     Key? key,
//     this.height = 18,
//     required this.label,
//     this.color,
//   }) : super(key: key);

//   final String label;
//   final Color? color;
//   final double height;

//   @override
//   Widget build(BuildContext context) {
//     final objectColor = color ?? Theme.of(context).textTheme.bodyLarge?.color;
//     return MyShimmer(
//       baseColor: color,
//       child: Container(
//         height: height,
//         margin: const EdgeInsets.all(1),
//         color: objectColor,
//         child: Text(
//           label,
//           style: TextStyle(color: objectColor),
//         ),
//       ),
//     );
//   }
// }
