abstract class BaseConstants {
  BaseConstants._();

  static const int defaultPage = 0;
  static const int defaultLimitSize = 20;

  static double get maxFileSizeInBytes => 2 * 1048576;
  static const int maxRetryLoadImage = 3;
  static const int scrollThreshold = 200;
  static const maxInteger = 9007199254740991; //9223372036854775807
  static const String imageDefaultTest = "";
  static const String imageDefaultServiceTest = "";

  static const int phoneNumberLengthMin = 10;
  static const int phoneNumberLengthMax = 11;
  static const int identityNumberLengthMin = 9;
  static const int identityNumberLengthMax = 12;
  static const int imageSize = 10;

  static const List<String> hotline = ['1900', '1800'];
  static const List<String> listExtensionImage = [
    'jpg',
    'JPG',
    'PNG',
    'png',
    'jpeg',
    'JPEG',
  ];
  static const List<String> listExtensionVideo = ['.mp4'];
  static const List<String> listExtensionFile = [
    'pdf',
    'PDF',
    'doc',
    'docx',
    'ppsx',
    'pptx',
    'xls',
    'xlsx',
    'XLSX',
  ];
  static const List<String> listExtensionPdf = ['pdf', 'PDF'];
  static const List<String> listChatExtensionVideo = [
    'mp4',
    'MP4',
    'MOV',
    'mov',
  ];
  static const List<String> listExtensionDocument = ['doc', 'docx'];
  static const List<String> listExtensionAllDocument = [
    'doc',
    'docx',
    'pdf',
    'xls',
    'xlsx',
  ];
  static const List<String> listExtensionImageHeic = ['HEIC', 'HEIF'];
  static const List<String> listExtensionMultiFile = [
    '.png',
    '.jpg',
    '.PNG',
    '.JPG',
    '.JPEG',
    '.jpeg',
    '.HEIC',
    '.mp3',
    '.mp4',
    '.MP3',
    '.MP4',
  ];
}
