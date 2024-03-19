extension RemoveAlphabets on String {
  String removeAlphabets() {
    // Use a regular expression to remove alphabets
    return replaceAll(RegExp(r'[a-zA-Z]'), '');
  }
}
extension UrlExtension on String {
  String formatUrl() {
    if (startsWith("http://") || startsWith("https://")) {
      return this; // Already a complete URL
    } else if (startsWith("//")) {
      return "https:$this"; // URL without scheme, assuming it's HTTPS
    } else {
      return "https://$this"; // URL without scheme, assuming it's HTTPS
    }
  }
}
