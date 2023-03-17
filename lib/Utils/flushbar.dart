import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class flushBar{
  static void showFlushBar(BuildContext context , String title, String message){

    showFlushbar(context: context, flushbar: Flushbar(
      message: message,
      title: title,
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(Icons.error),
      margin: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(20),
      padding: const EdgeInsets.all(20),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
    )..show(context)
    );
  }
}