extension StringExtensions on String {
  String toDate() {
    String dateTimeString = substring(0, indexOf("GMT")).trim();
    return dateTimeString;
  }
}
