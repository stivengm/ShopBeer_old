import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shop_beer/styles/app_style.dart';

class NotificationsWidget extends StatelessWidget {
  final String title;
  final String message;
  const NotificationsWidget({ Key? key, required this.title, required this.message }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return null!;
  }

  void showNotificationSuccess(BuildContext context) => Flushbar(
    duration: const Duration(seconds: 2),
    icon: const Icon(
      Icons.check_circle_outline,
      color: AppStyle.whiteColor,
      size: 30.0,
    ),
    title: title,
    message: message,
    borderRadius: BorderRadius.circular(AppStyle.edgeInsets16),
    backgroundColor: AppStyle.successColor.withOpacity(.7),
    barBlur: AppStyle.edgeInsets20,
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    flushbarPosition: FlushbarPosition.TOP,
  )..show(context);

  void showNotificationError(BuildContext context) => Flushbar(
    duration: const Duration(seconds: 2),
    icon: const Icon(
      Icons.error,
      color: AppStyle.whiteColor,
      size: 30.0,
    ),
    title: title,
    message: message,
    borderRadius: BorderRadius.circular(AppStyle.edgeInsets16),
    backgroundColor: AppStyle.dangerColor.withOpacity(.7),
    barBlur: AppStyle.edgeInsets20,
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    flushbarPosition: FlushbarPosition.TOP,
  )..show(context);

}