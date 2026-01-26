import 'package:cliniq/core/constants/locale_keys.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class CustomFailure extends Failure {
  const CustomFailure({
    String message = LocaleKeys.messagesFailuresUnexpectedError,
  }) : super(message);
}
