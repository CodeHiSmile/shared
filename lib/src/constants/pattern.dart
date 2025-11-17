class Patterns {
  static String url =
      r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';

  static String phone = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  static String email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static String bankNumber =
      r"^[a-zA-Z0-9_.\-\+\[\]]+(?: [a-zA-Z0-9_.\-\+\[\]]+)*$";

  static String password =
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#\$&*~%()_+=;:,/-]).{8,32}$";

  static String tax = r"^\d{10}(-\d{3})?$";

  static String userName = r'[!@#<>?":_`~;/.$}{,[\]\\|=+)(*&^%0-9-]';

  static String alpha = r'^[a-zA-Z ]+$';

  static String image = r'.(jpeg|jpg|gif|png|bmp)$';

  /// Audio regex
  static String audio = r'.(mp3|wav|wma|amr|ogg)$';

  /// Video regex
  static String video = r'.(mp4|avi|wmv|rmvb|mpg|mpeg|3gp|mkv)$';

  static String note = r'[a-zA-Z0-9_\-\+\[\]\., à-ỹÀ-ỹ\s]';

  static String symbol = r'[!@#\$%^&*(),.?":{}|<>]';

  /// Txt regex
  static String txt = r'.txt$';

  /// Document regex
  static String doc = r'.(doc|docx)$';

  /// Excel regex
  static String excel = r'.(xls|xlsx)$';

  /// PPT regex
  static String ppt = r'.(ppt|pptx)$';

  /// Document regex
  static String apk = r'.apk$';

  /// PDF regex
  static String pdf = r'.pdf$';

  /// HTML regex
  static String html = r'.html$';

  static List<String> phonePrefix = <String>[
    // viettel
    '032', '033', '034', '035', '036', '037', '038', '039', '096', '098', '086',
    '097',
    // mobi
    '070', '079', '077', '076', '078', '090', '089', '093',
    // vina
    '083', '084', '085', '081', '082', '088', '091', '094',
    // vnmb
    '052', '056', '058', '092',
    // gmobile
    '059', '099',
    // itelecom
    '087', '051', '055',
  ];

  static List<String> phonePrefix11 = [
    '0296',
    '0254',
    '0209',
    '0204',
    '0291',
    '0222',
    '0275',
    '0256',
    '0274',
    '0271',
    '0252',
    '0290',
    '0292',
    '0206',
    '0236',
    '0262',
    '0261',
    '0215',
    '0251',
    '0277',
    '0269',
    '0226',
    '024',
    '0239',
    '0220',
    '0225',
    '0293',
    '028',
    '0221',
    '0258',
    '0297',
    '0260',
    '0213',
    '0263',
    '0205',
    '0214',
    '0272',
    '0228',
    '0238',
    '0259',
    '0229',
    '0257',
    '0232',
    '0235',
    '0255',
    '0203',
    '0233',
    '0299',
    '0212',
    '0276',
    '0227',
    '0208',
    '0237',
    '0234',
    '0273',
    '0294',
    '0207',
    '0270',
    '0216',
    '0219',
    '0210',
    '0257',
    '0211',
    '0218',
  ];

  /// dateTime ISO regex
  static String isoDateTime = r'\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$';

  /// date
  static String date = r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$';
}
