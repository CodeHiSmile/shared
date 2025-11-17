import 'package:shared/src/exception/base/app_exception.dart';
import 'package:shared/src/utils/run_catching/result.dart';

Result<O> runCatching<O>({required O Function() action}) {
  try {
    return Result.success(action.call());
  } on AppException catch (e) {
    return Result.failure(e);
  }
}

Future<Result<O>> runAsyncCatching<O>({
  required Future<O> Function() action,
}) async {
  try {
    final output = await action.call();

    return Result.success(output);
  } on AppException catch (e) {
    return Result.failure(e);
  }
}
