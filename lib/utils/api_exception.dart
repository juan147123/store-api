part of 'utils.dart';


class ApiException implements IOException {
  final String message;
  final DioError? dioError;

  const ApiException(this.message, {this.dioError});

  @override
  String toString() {
    StringBuffer sb = StringBuffer();
    if (message.isNotEmpty) {
      sb.write(message);
    }
    return sb.toString();
  }
}
