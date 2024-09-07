import 'package:intl/intl.dart';

extension StringExtension on String {
  String fLetters() {
    // Split the string into words
    List<String> words = split(' ').where((word) => word.isNotEmpty).toList();

    // Check the number of words
    if (words.isEmpty) {
      return ''; // Return an empty string if there are no words
    } else if (words.length == 1) {
      return words[0][0]
          .toUpperCase(); // Return the first letter if there is only one word
    } else {
      // Return the first letters of the first two words
      String firstLetters = words[0][0] + words[1][0];
      return firstLetters.toUpperCase();
    }
  }

  DateTime formatWithToday() {
    final now = DateTime.now();
    final closingDate = DateFormat('hh:mm aa').parse(toString().toUpperCase());
    final formattedDate = DateTime(
        now.year, now.month, now.day, closingDate.hour, closingDate.minute);

    return formattedDate;
  }

  DateTime format() {
    String dateTimeString = this;
    DateTime dateTime = DateTime.parse(dateTimeString);
    return dateTime;
  }

  String toDateString({bool? includeZone}) {
    // Custom formatting
    String dateTimeString = this;
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDate = includeZone ?? false
        ? DateFormat('HH:mm aa').format(dateTime.toLocal())
        : DateFormat('HH:mm').format(dateTime.toLocal());
    return formattedDate;
  }

  DateTime get toDate => format();

  String get stringToDate => toDateString();
}
