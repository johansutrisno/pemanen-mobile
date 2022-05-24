part of 'theme.dart';

final overlayStyle = Platform.isAndroid
    ? const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: primaryDark,
        statusBarIconBrightness: Brightness.light,
      )
    : const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: primaryDark,
        statusBarIconBrightness: Brightness.dark,
      );
