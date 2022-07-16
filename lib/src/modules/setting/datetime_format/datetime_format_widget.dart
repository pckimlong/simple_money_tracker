import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/providers/cache_providers.dart';

import '../../../../exports.dart';

class DateFormatWidget extends ConsumerWidget {
  /// Has builder for build formatted date
  const DateFormatWidget({
    Key? key,
    required this.value,
    this.customPattern,
    this.onNullText = "",
    this.useTodayTmrYts = true,
    this.showWeekdayPrefix = false,
    this.useLongweekday = false,
    required this.builder,
  }) : super(key: key);

  final DateTime? value;
  final String? customPattern;
  final String onNullText;
  final bool showWeekdayPrefix;
  final bool useLongweekday;
  final bool useTodayTmrYts;
  final Widget Function(
    BuildContext context,
    String formatted,
    DateFormatPatterns patterns,
  ) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(CacheProvider.dateFormat);
    String pattern;
    if (customPattern != null) {
      pattern = customPattern!;
    } else {
      if (showWeekdayPrefix) {
        if (useLongweekday) {
          pattern = "EEEE, ${format.pattern}";
        } else {
          pattern = "EEE, ${format.pattern}";
        }
      } else {
        pattern = format.pattern;
      }
    }

    String formattedText;

    if (value == null) {
      formattedText = onNullText;
    } else {
      final date = value!;
      if (useTodayTmrYts && (date.isYesterday || date.isToday || date.isTomorrow)) {
        if (date.isYesterday) {
          formattedText = "date.yesterday".tr();
        } else if (date.isToday) {
          formattedText = "date.today".tr();
        } else {
          formattedText = "date.tomorrow".tr();
        }
      } else {
        formattedText = DateFormat(pattern, context.locale.countryCode).format(date);
      }
    }

    return builder(context, formattedText, format);
  }
}
