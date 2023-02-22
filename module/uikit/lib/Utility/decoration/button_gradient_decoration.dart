import 'package:flutter/material.dart';
import 'package:uikit/Utility/radius/circular_custom_radius.dart';

class ButtonDecoration extends BoxDecoration {
  ButtonDecoration()
      : super(
          borderRadius: CustomRadius.circular(),
          gradient: const LinearGradient(
              colors: [Colors.redAccent, Colors.blueAccent]),
        );
}
