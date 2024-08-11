final _regex = RegExp(r'[\x00-\x1F\x7F]');

///
extension MapUtils on Map<String, dynamic> {
  ///
  String getString(String key, [String defaultValue = '']) {
    if (containsKey(key)) {
      var value = this[key];
      if (value != null) {
        value = value.toString().trim().replaceAll(_regex, '');
        return value;
      }
    }
    return defaultValue;
  }

  ///
  List<dynamic> getList(String key) {
    if (containsKey(key)) {
      final value = this[key];
      if (value != null) {
        return value as List<dynamic>;
      }
    }
    return [];
  }
}
