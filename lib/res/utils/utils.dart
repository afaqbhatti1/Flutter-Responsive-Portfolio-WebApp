import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  Utils._();

  static void displayToast(String? message) {
    if (message == null) return;

    Fluttertoast.showToast(
      msg: message,
      fontSize: 14,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
