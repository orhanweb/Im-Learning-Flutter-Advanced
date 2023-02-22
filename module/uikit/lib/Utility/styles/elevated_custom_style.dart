import 'package:flutter/material.dart';

class EmtpyElevatedStyle extends ButtonStyle {
  const EmtpyElevatedStyle()
      : super(
          elevation: const MaterialStatePropertyAll(0),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        );
}
