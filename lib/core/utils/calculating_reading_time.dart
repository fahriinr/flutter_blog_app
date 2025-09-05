int calculateReadingTime(String content) {
  final wordCount = content.trim().split(RegExp(r'\s+')).length;

  return (wordCount / 200).ceil();
}
