
extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
  String toTitleCase() => split(' ').map((word) => word.capitalize()).join(' ');
}

String capitalizeText(String text){
  return '${text[0].toUpperCase()}${text.substring(1)}';
}
