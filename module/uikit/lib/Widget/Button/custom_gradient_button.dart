import 'package:flutter/material.dart';
import 'package:uikit/Utility/decoration/button_gradient_decoration.dart';
import 'package:uikit/Utility/styles/elevated_custom_style.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    super.key,
    required this.onPressed,
    this.width = CustomButtonWidths.medium,
    required this.buttonText,
  });

  final VoidCallback onPressed;
  final CustomButtonWidths width;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: const EmtpyElevatedStyle(),
        onPressed: onPressed,
        child: SizedBox(
          height: 40,
          width: width.value,
          child: DecoratedBox(
              decoration: ButtonDecoration(),
              child: Center(
                child: Text(buttonText),
              )),
        ));
  }
}

enum CustomButtonWidths {
  small(100),
  medium(150),
  large(300);

  final double value;
  const CustomButtonWidths(this.value);
}
