extension StringExtension on String? {
  // check for null and empty isNullOrEmpty
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension BeutifyCategoryString on String {
  String formatCategoryString() {
    // Remove all hyphens and split the string into words.
    List<String> words = replaceAll('-', ' ').split(' ');

    // Capitalize the first letter of each word.
    words = words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).toList();

    // Join the words back into a single string.
    return words.join(' ');
  }
}
