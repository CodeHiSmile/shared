# Tài liệu thư mục `lib/`

## 1. Cấu trúc tổng quan

```
lib/
├── shared.dart
└── src/
		├── components/
		│   └── loading_indicator.dart
		├── config/
		│   ├── application_config.dart
		│   ├── config.dart
		│   ├── log_config.dart
		│   └── shared_config.dart
		├── constants/
		│   ├── base_constants.dart
		│   ├── duration_constants.dart
		│   ├── env_constants.dart
		│   ├── format/
		│   │   ├── date_time_formater.dart
		│   │   └── number_formatter.dart
		│   ├── locale_constants.dart
		│   ├── pattern.dart
		│   ├── server/
		│   │   ├── retry_on_error_constants.dart
		│   │   ├── server_error_constants.dart
		│   │   ├── server_request_response_constants.dart
		│   │   └── server_timeout_constants.dart
		│   ├── shared_preference_constants.dart
		│   ├── typedef.dart
		│   └── ui/
		│       ├── device_constants.dart
		│       ├── paging_constants.dart
		│       └── ui_constants.dart
		├── di/
		│   ├── di.config.dart
		│   └── di.dart
		├── exception/
		│   ├── base/
		│   │   ├── app_exception.dart
		│   │   ├── app_exception_wrapper.dart
		│   │   └── exception_mapper.dart
		│   ├── parse/
		│   │   └── parse_exception.dart
		│   ├── remote/
		│   │   ├── remote_exception.dart
		│   │   ├── server_error.dart
		│   │   ├── server_error.freezed.dart
		│   │   ├── server_error_detail.dart
		│   │   └── server_error_detail.freezed.dart
		│   ├── remote_config/
		│   │   └── remote_config_exception.dart
		│   ├── uncaught/
		│   │   └── app_uncaught_exception.dart
		│   └── validation/
		│       └── validation_exception.dart
		├── extensions/
		│   ├── date_time_extension.dart
		│   ├── double_extension.dart
		│   ├── int_extension.dart
		│   ├── media_query_extension.dart
		│   └── string_extension.dart
		├── helpers/
		│   ├── app_info.dart
		│   ├── download_helper.dart
		│   ├── download_ui_helper.dart
		│   ├── keyboard_helper.dart
		│   └── rsa_encryption_helper.dart
		├── mixin/
		│   └── log_mixin.dart
		├── utils/
		│   ├── app_action_utils.dart
		│   ├── big_decimal.dart
		│   ├── click_utils.dart
		│   ├── date_time_utils.dart
		│   ├── debouncer.dart
		│   ├── device_utils.dart
		│   ├── download2_utils.dart
		│   ├── duration/
		│   │   └── duration_provider.dart
		│   ├── file_utils.dart
		│   ├── file_utils2.dart
		│   ├── formatters/
		│   │   ├── character_length_limiting_text_input_formatter.dart
		│   │   └── space_input_formatter.dart
		│   ├── function/
		│   │   └── function.dart
		│   ├── location_utils.dart
		│   ├── log_utils.dart
		│   ├── media_utils.dart
		│   ├── number_utils.dart
		│   ├── object_utils.dart
		│   ├── parse_utils.dart
		│   ├── permission_utils.dart
		│   ├── run_catching/
		│   │   ├── result.dart
		│   │   ├── result.freezed.dart
		│   │   └── run_catching.dart
		│   ├── security/
		│   │   └── jwt_decode.dart
		│   ├── share_utils.dart
		│   ├── show_loading_utils.dart
		│   ├── stream/
		│   │   ├── disposable.dart
		│   │   ├── dispose_bag.dart
		│   │   └── stream_logger.dart
		│   ├── string_utils.dart
		│   ├── system_utils.dart
		│   ├── validators/
		│   │   ├── form_validator.dart
		│   │   └── input_validator.dart
		│   └── widget_utils.dart
```

## 2. Diễn giải chi tiết từng tệp

### 2.1 `lib/shared.dart`
- Tập trung toàn bộ `export` để các module khác chỉ cần import một đầu mối.
- Đảm bảo những thành phần nội bộ (`components`, `config`, `constants`, `exception`, `extensions`, `helpers`, `mixin`, `utils`, `validators`) sẵn sàng dùng lại.

### 2.2 Thư mục `components`
- `loading_indicator.dart`
	- `LoadingIndicator`: `StatelessWidget` hiển thị vòng tròn tải mặc định. Chấp nhận cấu hình `height`, `backgroundColor`, `valueColor`, `loadingSize`, `strokeWidth` để tùy chỉnh.
	- `build`: trả về `CircularProgressIndicator` được căn giữa trong `SizedBox`.

### 2.3 Thư mục `config`
- `config.dart`
	- `Config`: class trừu tượng với `_asyncMemoizer` để chạy `config()` một lần thông qua `init()`.
- `application_config.dart`
	- `ApplicationConfig`: kế thừa `Config`, dùng cho cấu hình cấp ứng dụng (khởi tạo từ `main`).
- `shared_config.dart`
	- `SharedConfig`: singleton kế thừa `Config`; `config()` gọi `configureInjection()` và khởi tạo `AppInfo` trong `GetIt`.
- `log_config.dart`
	- `LogConfig`: tập trung toàn bộ flag bật/tắt log cho nhiều mảng (bloc, navigator, stream, interceptor, use case…).

### 2.4 Thư mục `constants`
- `base_constants.dart`: các hằng số chung như paging mặc định, danh sách extension file, độ dài số điện thoại…
- `duration_constants.dart`: `Duration` chuẩn dùng lại cho hiệu ứng và thông báo.
- `env_constants.dart`
	- `Flavor` enum và các khóa cấu hình môi trường; `init()` log giá trị từ biến build-time.
- `format/date_time_formater.dart`: định nghĩa chuỗi format ngày giờ cho UI và server.
- `format/number_formatter.dart`: mẫu format số mặc định `'#.###'`.
- `locale_constants.dart`: mã locale mặc định (`vi`, `en`).
- `pattern.dart`: tổng hợp regex kiểm tra URL, email, password, phone, file extension…
- `server/retry_on_error_constants.dart`: cấu hình số lần retry và interval.
- `server/server_error_constants.dart`: tên field lỗi và mã lỗi server chuẩn hóa.
- `server/server_request_response_constants.dart`: header và giá trị mặc định khi gọi API.
- `server/server_timeout_constants.dart`: timeout kết nối/gửi/nhận.
- `shared_preference_constants.dart`: khóa lưu trữ trong SharedPreferences.
- `typedef.dart`: định nghĩa generic `Decoder<T>`.
- `ui/device_constants.dart`: thông số width cho device và kích thước thiết kế.
- `ui/paging_constants.dart`: tham số phân trang mặc định.
- `ui/ui_constants.dart`: hằng số liên quan UI (shimmer, orientation, status bar,…).

### 2.5 Thư mục `di`
- `di.dart`: khởi tạo `GetIt` và gọi `getIt.init()` (được sinh bởi `injectable`).
- `di.config.dart`: file sinh tự động, đăng ký `AppInfo` dưới dạng `lazySingleton`.

### 2.6 Thư mục `exception`
- `base/app_exception.dart`: định nghĩa gốc `AppException` và enum `AppExceptionType`.
- `base/app_exception_wrapper.dart`: bao đối tượng `AppException` cùng `Completer`, callback retry và message tuỳ biến.
- `base/exception_mapper.dart`: interface map exception nguồn sang `AppException` cụ thể.
- `parse/parse_exception.dart`: `ParseException` lưu `ParseExceptionKind` và `rootException` khi parse thất bại.
- `base/app_exception_wrapper.dart`: bao đối tượng `AppException` cùng `Completer`, callback retry, thông điệp ghi đè và override `toString()` phục vụ debug.
- `remote/remote_exception.dart`
	- `RemoteException`: chứa `RemoteExceptionKind`, mã HTTP, `ServerError`, lỗi gốc; getter `generalServerStatusCode`, `generalServerErrorId`, `generalServerMessage` giúp truy xuất thông tin chung từ phản hồi server; override `toString()` để log chi tiết.
	- `RemoteExceptionKind`: phân loại lỗi mạng, server, timeout, decode, refresh token...
- `remote/server_error.dart`: data class `ServerError` (sinh bằng `freezed`) với các trường status, errorId, message, danh sách `ServerErrorDetail` và giá trị mặc định.
- `remote/server_error.freezed.dart`: mã sinh tự động của `freezed`, không chỉnh sửa thủ công.
- `remote/server_error_detail.dart`: data class chi tiết lỗi gồm message, field, status code…
- `remote/server_error_detail.freezed.dart`: mã sinh tự động cho `ServerErrorDetail`.
- `remote_config/remote_config_exception.dart`: `RemoteConfigException` với enum `RemoteConfigExceptionKind`.
- `uncaught/app_uncaught_exception.dart`: bao lỗi không bắt được (`rootError`).
- `validation/validation_exception.dart`: `ValidationException` với enum `ValidationExceptionKind` phục vụ validate business.

### 2.7 Thư mục `extensions`
- `date_time_extension.dart`: mở rộng `DateTime` với các tiện ích định dạng, tính khoảng cách, làm tròn, kiểm tra ngày, xử lý cuối tháng, start/end of day…
	- `toStringWithFormat`, `getDay`, `getShortDay`, `formatDateTime`, `secondsSinceEpoch`, `diffSecondsFromNow`, `timeRelative`, `roundDown`, `roundUp`, `endOfMonth`, `isWeekend`, `addDays`, `nextDay`, `setHour`, `setMonth`, `startOfDay`, `startDay`, `endOfDay`, `isSameDate`, `isSameMonth`, `isSameYear`, `isToday`, `isYesterday`.
- `double_extension.dart`: phép toán cơ bản (`plus`, `minus`, `times`, `div`) và `formatCurrency` cho `double`.
- `int_extension.dart`: tương tự cho `int`, thêm `truncateDiv`.
- `media_query_extension.dart`: tập hợp getter tiện dụng trên `BuildContext` (kích thước, orientation, responsive, Theme/TextTheme, 24h format…).
- `string_extension.dart`
	- Hàm top-level `hasMatch`: kiểm tra string khớp regex.
	- `StringExtension` (trên `String?`) cung cấp `validateEmail`, `validateBankNumber`, `validatePassword`, `validateDate`, `validateDateTime`, `validatePhoneNumber`, `validateNote`, `validateSymbol`, `validatePhone`, `validateName`, `validateTax`, `validateURL`, `isEmptyOrNull`, `commentTime`, `isImage`, `isAudio`, `isVideo`, `isTxt`, `isDoc`, `isExcel`, `isPPT`, `isApk`, `isPdf`, `isHtml`, `getValue`, `hasSpaceCharacter`, `toDouble`, `toYouTubeId`, `convertYouTubeUrlToId`, `getYouTubeThumbnail`, `removeAllWhiteSpace`, `repeat`, `renderHtml`, `calculateReadTime`, `countWords`, `toSlug`, `setSearchParam`, `removeAllDotAndUnderScore`.

### 2.8 Thư mục `helpers`
- `app_info.dart`: `AppInfo` (`@LazySingleton`) dùng `PackageInfo` để lấy `appName`, `applicationId`, `versionCode`, `versionName` và log trong `init()`.
- `download_helper.dart`: `DownloadHelper` tải file qua `Dio`, lưu base64, lưu ảnh vào gallery; quản lý callback tiến trình.
- `download_ui_helper.dart`: `DownloadUIHelper.downloadAndOpenFile` bọc `DownloadHelper` với xử lý UI/callback.
- `keyboard_helper.dart`: `KeyboardHelper` ẩn bàn phím (`hideKeyboard`) và kiểm tra bàn phím hiển thị (`isKeyboardVisible`).
- `rsa_encryption_helper.dart`: `RSAEncryptionHelper.encrypt` đọc public key, mã hoá dữ liệu bằng RSA.

### 2.9 Thư mục `mixin`
- `log_mixin.dart`: `LogMixin` cung cấp `logD` và `logE` sử dụng `LogUtils` với `runtimeType` làm tag.

### 2.10 Thư mục `utils`
- `app_action_utils.dart`: `ActionUtils` với `copyToClipboard` (copy + toast) và `callPhoneNumber` (mở `tel`).
- `big_decimal.dart`: wrapper `BigDecimal` trên `Decimal` với factory `parse`, `fromBigInt`, `fromInt`, `fromJson`; toán tử `+`, `-`, `*`, `%`, negation; phương thức `remainder`, so sánh (`<`, `<=`, `>`, `>=`, `compareTo`), kiểm tra (`signum`, `precision`, `scale`, `isInteger`), phép biến đổi `abs`, `floor`, `ceil`, `round`, `truncate`, `clamp`, chuyển đổi `toBigInt`, `toDouble`, `toStringAsFixed`, `toStringAsExponential`, `toStringAsPrecision` và shortcut `plus`, `minus`, `times`.
- `click_utils.dart`: `ClickUtils.isMultiClick` chặn double click trong khoảng thời gian.
- `date_time_utils.dart`: `DateTimeUtils` chứa hàm tiện ích (`getDaysInMonth`, `getWeekdayName`, `formatDateTimeRange`, `parseDate`, `formatDate`, `formatDateWithJms`, `formatDateWithUTC`, `getNameOfDay`, `dateStringWithDay`, `dateToString`, `leapYear`, `daysInMonth`, `currentMillisecondsTimeStamp`, `currentTimeStamp`, `toUtcFromTimestamp`, `tryParse`).
- `debouncer.dart`: `Debounce<T>` lưu giá trị và chỉ gọi `onValue` sau `duration`; có `dispose` giải phóng timer.
- `device_utils.dart`
	- `DeviceUtils`: xác định loại thiết bị (`deviceType`), lấy `deviceId`, thông tin thiết bị (`DeviceInfoEntity`), model, IP cục bộ, và phương thức nội bộ `_getDeviceType` xác định theo kích thước màn hình.
	- `DeviceInfoEntity`: dữ liệu mô tả thiết bị.
- `download2_utils.dart`: `Download2Utils` (legacy) với nhiều luồng tải/lưu file: `downloadFile`, `downloadFileBase64`, `handleDownLoadDocument`, `downLoadFileBase64`, `getDownloadPath`, `saveImage`, `handleSaveImage`, `checkOldAndroidVersion`, `downloadUrl`, `_requestPermissions`, `_getDownloadDirectory`, `_getFileNameFromUrl`, `_generateUniqueFileName`, `_downloadFile`, `downloadWithOptions`; hỗ trợ `OpenFilex`, `SaverGallery`, xử lý quyền.
- `duration/duration_provider.dart`: hằng số thời lượng và các class Duration cụ thể (`OneSecondDuration`, `ExtraShortDuration`, `ShortDuration`, `MediumDuration`, `LongDuration`, `VeryLongDuration`).
- `file_utils.dart`: `FileUtils` chia file thành chunk, chuyển `Uint8List` thành file tạm, sinh tên file unique, lấy tên từ URL, xác định thư mục download theo nền tảng, lưu base64, validate file hợp lệ, encode file sang base64.
- `file_utils2.dart`: `FileUtils2` làm việc với file documents/temp, đọc/ghi `Uint8List`, kiểm tra mime type, xóa file, xác định folder (document/temporary), tạo tên file mới khi trùng.
- `formatters/character_length_limiting_text_input_formatter.dart`: `CharacterLengthLimitingTextInputFormatter` giới hạn số ký tự dựa trên `Characters` để không cắt ngang glyph.
- `formatters/space_input_formatter.dart`: `SpaceInputFormatter` chuẩn hoá nhiều khoảng trắng thành một và giữ vị trí con trỏ.
- `function/function.dart`: bộ wrapper `Func0` đến `Func9` giữ tham chiếu hàm có đối số khác nhau, hỗ trợ so sánh và gọi như method.
- `location_utils.dart`: `LocationUtils.getAddressFromLatLng` xin quyền vị trí, lấy toạ độ hiện tại và trả về chuỗi địa chỉ.
- `log_utils.dart`: `LogUtils` định nghĩa `i`, `d`, `w`, `e`, `json`, `prettyJson` và `_printLog` dựa trên cờ trong `LogConfig`.
- `media_utils.dart`: `MediaUtils` xử lý chọn/chụp ảnh, video, file; resize ảnh (`processImage`, `resizeImage`), vẽ thông tin lên ảnh (`canvasInfo`), tải nhiều ảnh/video/file; phụ trợ `_readFileByte`; các phương thức: `onTakeImage`, `processImage`, `resizeImage`, `canvasInfo`, `_readFileByte`, `onChooseImage`, `onChooseMultiImage`, `onChooseVideo`, `onChooseFile`.
- `number_utils.dart`: `NumberUtils` format số tiền, hiển thị giảm giá, format number linh hoạt.
- `object_utils.dart`: hàm top-level `run` chạy block; extension `ObjectUtils` có `safeCast`, `let`; hàm `safeCast` top-level tương tự.
- `parse_utils.dart`: `ParseUtils` parse `String` sang `BigDecimal`, `int`, `double`, ném `ParseException` khi lỗi.
- `permission_utils.dart`: `PermissionUtils` cung cấp `isOldAndroidVersion`, `requestStoragePermission`, `handleRequestPhotoPermission`, `handleRequestCameraPermission`, `handleRequestContactPermission`, `isAccessiblePermission`, `handleRequestPermission`, `handleRequestPermissionIos`, `handleRequestPermissionAndroid`, `showDialogSetting`, `requestPermission`, `getNamePermissionByType` để xin/kiểm tra quyền và chuyển hướng người dùng tới phần cài đặt khi cần.
- `run_catching/run_catching.dart`: `runCatching` và `runAsyncCatching` thực thi action và trả về `Result.success`/`Result.failure` khi catch `AppException`.
- `run_catching/result.dart`: union `Result<T>` gồm `success` và `failure`.
- `run_catching/result.freezed.dart`: mã sinh tự động cho `Result` (không sửa).
- `security/jwt_decode.dart`: `JwtDecoder` decode JWT, kiểm tra hết hạn, trả về thời gian còn lại (`decode`, `tryDecode`, `isExpired`, `_getDate`, `getExpirationDate`, `getTokenTime`, `getRemainingTime`).
- `share_utils.dart`: `ShareUtils.shareLink` dùng `SharePlus` chia sẻ URL và callback khi thành công.
- `show_loading_utils.dart`: `ShowLoadingUtils` singleton tạo `OverlayEntry` với `LoadingIndicator`; phương thức `turnOn`/`turnOff` quản lý overlay.
- `stream/disposable.dart`: interface `Disposable` với `dispose()`.
- `stream/dispose_bag.dart`: `DisposeBag` quản lý danh sách tài nguyên (`StreamSubscription`, `StreamController`, `ChangeNotifier`, `Disposable`); extension `disposeBy` cho từng loại để đăng ký vào bag.
- `stream/stream_logger.dart`: extension `StreamExt.log` dùng `rxdart` để log sự kiện stream theo flag.
- `string_utils.dart`: `StringUtils` cung cấp hàm xử lý chuỗi: `capitalizeEachWord`, `truncate`, `paddingZero`, `formatRegister`, `removeSpecialCharacters`, `encodeCharacter`, `formatInputNumber`, `maskPhoneNumber`, `maskAddress`, `transformImageLink`.
- `system_utils.dart`: `SystemUtils` bao `SystemChrome.setPreferredOrientations` và `setSystemUIOverlayStyle`.
- `validators/form_validator.dart`: `FormValidator` với hàm `onValidateEmail`, `onValidatePhone`, `onValidatePassword`, `onValidateNotNull`, `validateFullName`, `validatePassword` (bao gồm message tiếng Việt).
- `validators/input_validator.dart`: `InputValidator` cung cấp các kiểm tra boolean (`isEmail`, `isPhoneNumber`, `isDate`, `isDateTime`, `isURL`, `isPasswordValid`, `isSpecialSymbol`).
- `widget_utils.dart`: `WidgetUtils` lấy vị trí/kích thước widget thông qua `GlobalKey` (`getWidgetPosition`, `getWidgetWidth`, `getWidgetHeight`).

### 2.11 Ghi chú về file sinh tự động
- Các tệp `*.freezed.dart` và `di.config.dart` được tạo bởi công cụ (`freezed`, `injectable`). Không nên chỉnh sửa trực tiếp; thay đổi thông qua tệp nguồn tương ứng rồi chạy lại generator.

## 3. Sử dụng
- Import `package:shared/shared.dart` để truy cập toàn bộ tiện ích.
- Trước khi dùng, gọi `await SharedConfig.getInstance().init()` trong `main()` nhằm cấu hình DI và `AppInfo`.
