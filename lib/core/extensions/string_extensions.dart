extension StringExtention on String {
  String appendOverflow(int len) {
    if (length > len) {
      return '${substring(0, len)}...';
    } else {
      return this;
    }
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String get dialCode {
    if (isEmpty) return '';
    return substring(0, length - 10);
  }

  String get removeDialCode {
    if (isEmpty) return '';
    return substring(length - 10);
  }

  ({double lat, double long}) get toLongLat {
    final strs = split(' ');
    final longStr = strs[1].replaceAll('(', '');
    final latStr = strs[2].replaceAll(')', '');
    final long = double.parse(longStr);
    final lat = double.parse(latStr);
    return (long: long, lat: lat);
  }
}
