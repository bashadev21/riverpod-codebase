import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/alerts/loader.dart';
import 'package:flutter_application/core/keys/global.key.dart';
import 'package:flutter_application/core/styles/colors.style.dart';
import 'package:flutter_application/core/styles/dimenstions.style.dart';
import 'package:flutter_application/core/utils/texts/sub_caption.text.dart';

class Utils {
  static void toast({String? msg, Color? color, Widget? child}) {
    var toast = AppSubCaptionText(
      data: msg,
      color: AppColors.white,
      maxLines: 2,
      textAlign: TextAlign.center,
    );

    messengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: child ?? toast,
        margin: Dimen.scaffoldMargin,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static Future showLoader(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Loader(),
    );
  }

  static dismissLoader(BuildContext context) {
    Navigator.of(context).pop(context);
  }

  static pop(BuildContext context) {
    Navigator.of(context).pop(context);
  }

  static Future showAlert({
    required BuildContext context,
    Widget? child,
    bool? isDismissible,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: isDismissible ?? true,
      builder: (context) => child ?? const SizedBox(),
    );
  }

  static Future showModal({
    required Widget child,
    required BuildContext context,
    bool? isScrollControlled,
    Color? color,
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: color,
      isScrollControlled: isScrollControlled ?? false,
      builder: (_) => Padding(padding: Dimen.scaffoldMargin, child: child),
    );
  }

  static Future search(
      {required SearchDelegate child, required BuildContext context}) async {
    await showSearch(context: context, delegate: child);
  }

  static int getTimeStamp() {
    var dateTime = DateTime.now();
    return dateTime.millisecondsSinceEpoch;
  }

  static DateTime convertDateTime(int? ts) {
    if (ts == null) return DateTime.now();
    return DateTime.fromMillisecondsSinceEpoch(ts);
  }

  static int getRandomInt(int limit) {
    Random random = Random();
    int randomNumber = random.nextInt(limit);
    return randomNumber;
  }

  static int getId() {
    Random rnd = Random();
    num power = pow(2, 31) - 1;
    return rnd.nextInt(power.toInt());
  }

  static String? getPath(String? path) {
    if (path == null) return null;
    if (!Platform.isAndroid) return path;

    String newPath = '';
    var oldPath = path.split('/');

    for (int i = 1; i < (oldPath.length); i++) {
      String folder = oldPath[i];
      if (folder == 'Android') break;
      newPath += '/$folder';
    }

    return newPath;
  }
}
