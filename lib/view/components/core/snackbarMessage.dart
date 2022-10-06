import 'package:flutter/material.dart';
void snackbarMessage(String text,context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Text(text),
    duration: const Duration(milliseconds: 500),
  ));
}
