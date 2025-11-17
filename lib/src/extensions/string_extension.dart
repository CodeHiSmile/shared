import 'package:shared/src/constants/pattern.dart';

/// has match return bool for pattern matching
bool hasMatch(String? s, String p) {
  return (s == null) ? false : RegExp(p).hasMatch(s);
}

// String Extensions
extension StringExtension on String? {
  /// Check email validation
  bool validateEmail() => hasMatch(this, Patterns.email);

  bool validateBankNumber() => hasMatch(this, Patterns.bankNumber);

  bool validatePassword() => hasMatch(this, Patterns.password);

  bool validateDate() => hasMatch(this, Patterns.date);

  bool validateDateTime() => hasMatch(this, Patterns.isoDateTime);

  bool validatePhoneNumber() => hasMatch(this, Patterns.phone);

  bool validateNote() => hasMatch(this, Patterns.note);

  bool validateSymbol() => hasMatch(this, Patterns.symbol);

  bool validatePhone() {
    if (hasMatch(this, Patterns.phone) && (this ?? '').length == 10) {
      if (Patterns.phonePrefix
          .firstWhere(
            (element) => (this ?? '').startsWith(element),
            orElse: () => '',
          )
          .isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool validateName() => hasMatch(this, Patterns.userName);

  bool validateTax() => hasMatch(this, Patterns.tax);

  /// Check URL validation
  bool validateURL() => hasMatch(this, Patterns.url);

  /// Returns true if given String is null or isEmpty
  bool get isEmptyOrNull =>
      this == null || (this ?? '').isEmpty || (this! == 'null');

  static String commentTime(String date) {
    try {
      var dateItem = DateTime.parse(date).toLocal();
      var dateNow = DateTime.now();
      var differenceDay = dateNow.difference(dateItem).inDays;
      if (differenceDay == 0) {
        var differenceHours = dateNow.difference(dateItem).inHours;
        if (differenceHours == 0) {
          var differenceMinutes = dateNow.difference(dateItem).inMinutes.abs();
          if (differenceMinutes == 0) {
            return "Vừa xong";
          } else {
            return '$differenceMinutes phút';
          }
        } else {
          return '$differenceHours giờ';
        }
      } else {
        return '$differenceDay ngày';
      }
    } catch (e) {
      return "Vừa xong";
    }
  }

  /// Image regex
  bool get isImage => hasMatch(this, Patterns.image);

  /// Audio regex
  bool get isAudio => hasMatch(this, Patterns.audio);

  /// Video regex
  bool get isVideo => hasMatch(this, Patterns.video);

  /// Txt regex
  bool get isTxt => hasMatch(this, Patterns.txt);

  /// Document regex
  bool get isDoc => hasMatch(this, Patterns.doc);

  /// Excel regex
  bool get isExcel => hasMatch(this, Patterns.excel);

  /// PPT regex
  bool get isPPT => hasMatch(this, Patterns.ppt);

  /// Document regex
  bool get isApk => hasMatch(this, Patterns.apk);

  /// PDF regex
  bool get isPdf => hasMatch(this, Patterns.pdf);

  /// HTML regex
  bool get isHtml => hasMatch(this, Patterns.html);

  String getValue({String validContent = ''}) {
    if (isEmptyOrNull) {
      return validContent;
    } else {
      return this!;
    }
  }

  bool get hasSpaceCharacter {
    return getValue().contains(' ');
  }

  /// Return double value of given string
  double toDouble({double defaultValue = 0.0}) {
    if (this == null) return defaultValue;

    try {
      return double.parse(this!);
    } catch (e) {
      return defaultValue;
    }
  }

  /// Get YouTube Video ID
  String toYouTubeId({bool trimWhitespaces = true}) {
    String url = getValue();
    if (!url.contains('http') && (url.length == 11)) return url;
    if (trimWhitespaces) url = url.trim();

    for (var exp in [
      RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$",
      ),
      RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$",
      ),
      RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$"),
    ]) {
      Match? match = exp.firstMatch(url);
      if (match != null && match.groupCount >= 1) return match.group(1)!;
    }

    return '';
  }

  /// Get YouTube Video ID
  @Deprecated('Use toYouTubeId Instead')
  String convertYouTubeUrlToId({bool trimWhitespaces = true}) {
    return toYouTubeId(trimWhitespaces: trimWhitespaces);
  }

  /// Returns YouTube thumbnail for given video id
  String getYouTubeThumbnail({bool trimWhitespaces = true}) {
    return 'https://img.youtube.com/vi/${toYouTubeId(trimWhitespaces: trimWhitespaces)}/maxresdefault.jpg';
  }

  /// Removes white space from given String
  String removeAllWhiteSpace() =>
      getValue().replaceAll(RegExp(r"\s+\b|\b\s"), "");

  /// Returns the given string n times
  String repeat(int n, {String separator = ''}) {
    if (n < 0) ArgumentError('n must be a positive value greater then 0');

    var repeatedString = '';

    for (var i = 0; i < n; i++) {
      if (i > 0) {
        repeatedString += separator;
      }
      repeatedString += getValue();
    }

    return repeatedString;
  }

  /// Render a HTML String
  String get renderHtml {
    return this!
        .replaceAll('&ensp;', ' ')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&emsp;', ' ')
        .replaceAll('<br>', '\n')
        .replaceAll('<br/>', '\n')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>');
  }

  /// Return average read time duration of given String in seconds
  double calculateReadTime({int wordsPerMinute = 200}) {
    var words = countWords();
    var number = words / wordsPerMinute;
    return number;
  }

  /// Return number of words ina given String
  int countWords() {
    var words = getValue().trim().split(RegExp(r'(\s+)'));
    return words.length;
  }

  /// Generate slug of a given String
  String toSlug({String delimiter = '_'}) {
    String text = getValue().trim().toLowerCase();
    return text.replaceAll(' ', delimiter);
  }

  /// returns searchable array for Firebase Database
  List<String> setSearchParam() {
    String word = getValue();

    List<String> caseSearchList = [];
    String temp = '';

    for (int i = 0; i < word.length; i++) {
      temp = temp + word[i];
      caseSearchList.add(temp.toLowerCase());
    }

    return caseSearchList;
  }

  String removeAllDotAndUnderScore() =>
      (this ?? '').replaceAll('.', '').replaceAll('_', '');
}
