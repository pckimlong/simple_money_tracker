enum DateFormatPatterns {
  ddMMYYYY('dd/MM/yyyy'),
  yyyyMMdd('yyyy/MM/dd'),
  ddMMMyyyy('dd MMM yyyy'),
  mmddYYYY('MM/dd/yyyy');

  final String pattern;
  const DateFormatPatterns(this.pattern);
}
