/// String extension to capitalize the first letter of a string.
extension StringCapitalizationExtension on String {
  /// Capitalizes the first letter of a string.
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

/// String? extension to check if a string is null or empty.
extension NullableStringExtension on String? {
  /// Checks if a string is null or empty.
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}
