part of 'widgets.dart';

class AppSnackbar {
  AppSnackbar._internal();
  static AppSnackbar get _instance => AppSnackbar._internal();

  factory AppSnackbar() {
    return _instance;
  }

  bool allFilled = true;
  SnackPosition defaultPosition = SnackPosition.TOP;

  void basic({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnack(
      message: message,
      filledColor: Colors.yellow.shade800,
      filled: true,
      position: defaultPosition,
      textColor: Colors.white,
      duration: duration,
    );
  }

  void success({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnack(
      message: message,
      icon: Icons.check_rounded,
      filledColor: Colors.green,
      filled: true,
      position: defaultPosition,
      textColor: Colors.white,
      iconColor: Colors.black,
      duration: duration,
    );
  }

  void error({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnack(
      message: message,
      icon: Icons.warning_amber_rounded,
      filledColor: Colors.red,
      filled: true,
      position: defaultPosition,
      textColor: Colors.white,
      iconColor: Colors.black,
      duration: duration,
    );
  }

  void info({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnack(
      message: message,
      icon: Icons.info_outline_rounded,
      filledColor: Colors.blue,
      filled: true,
      position: defaultPosition,
      textColor: Colors.white,
      iconColor: Colors.black,
      duration: duration,
    );
  }

  void warning({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnack(
      message: message,
      icon: Icons.info_outline_rounded,
     filledColor: Colors.yellow.shade800,
      filled: true,
      position: defaultPosition,
      textColor: Colors.white,
      iconColor: Colors.black,
      duration: duration,
    );
  }

  void _showSnack({
    String? title,
    String? message,
    IconData? icon,
    bool showIcon = true,
    SnackPosition position = SnackPosition.TOP,
    bool showClose = true,
    Color filledColor = Colors.grey,
    bool filled = true,
    Color textColor = Colors.black,
    Color? iconColor,
    Duration? duration,
  }) {
    TextStyle dfStyle = TextStyle(color: textColor, fontSize: 14);

    Color dfIconColor = iconColor ?? textColor;

    Widget? titleWidget;
    if (title != null) {
      titleWidget =
          Text(title, style: dfStyle.copyWith(fontWeight: FontWeight.w600));
    }

    Widget? messageWidget;
    if (message != null) messageWidget = Text(message, style: dfStyle);

    Widget? preffixIcon;
    if (icon != null && showIcon) {
      preffixIcon = ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          color: dfIconColor.withOpacity(.15),
          padding: const EdgeInsets.only(top: 6, right: 6, left: 6, bottom: 8),
          child: Icon(
            icon,
            color: dfIconColor,
            size: 17,
          ),
        ),
      );
    }

    double bp = 3.0;
    EdgeInsetsGeometry snbPadding = EdgeInsets.all(bp);

    if (showClose) {
      if (showIcon) {
        snbPadding =
            EdgeInsets.only(top: bp, right: 0, bottom: bp, left: bp + 3.0);
        if (icon == null) {
          snbPadding =
              EdgeInsets.only(top: bp, right: 0, bottom: bp, left: bp + 8.0);
        }
      } else {
        snbPadding =
            EdgeInsets.only(top: bp, right: 0, bottom: bp, left: bp + 3.0);
      }
    } else {
      if (showIcon) {
        snbPadding = EdgeInsets.only(
            top: bp, right: bp + 3.0, bottom: bp, left: bp + 3.0);
      } else {
        snbPadding =
            EdgeInsets.symmetric(horizontal: bp + 3.0, vertical: bp + 3.0);
      }
    }

    Widget? closeIcon;
    if (showClose) {
      closeIcon = ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              if (Get.isSnackbarOpen) {
                Get.back();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Icon(
                Icons.close,
                color: textColor.withOpacity(.35),
                size: 14,
              ),
            ),
          ),
        ),
      );
    }

    Widget builderContent = Container(
      padding: snbPadding,
      child: Row(
        children: [
          showIcon ? preffixIcon ?? const SizedBox() : const SizedBox(),
          showIcon && preffixIcon != null ? const SizedBox(width: 10.0) : const SizedBox(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleWidget ?? const SizedBox(),
                messageWidget ?? const SizedBox(),
              ],
            ),
          ),
          closeIcon ?? const SizedBox(),
        ],
      ),
    );

    if (Get.isSnackbarOpen) {
      Get.back(); // To close active Snackbar
    }

    Get.snackbar('', '',
        titleText: const SizedBox(),
        messageText: builderContent,
        padding: const EdgeInsets.only(left: 5, top: 0, right: 5, bottom: 5),
        margin: const EdgeInsets.all(10.0),
        backgroundColor: filled ? filledColor : Colors.white,
        duration: duration,
        animationDuration: const Duration(milliseconds: 300),
        snackPosition: position,
        dismissDirection: DismissDirection.horizontal,
        borderRadius: 8,
        boxShadows: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 6.0,
            spreadRadius: 4.0,
            offset: const Offset(0, 3),
          )
        ]);
  }
}
