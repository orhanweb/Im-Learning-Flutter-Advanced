import 'package:flutter/material.dart';
import 'package:im_learning_flutter_advanced/Network_Change_Learn/Core/main_build.dart';

import 'Network_Change_Learn/Use_Case/network_change_example.dart';

void main() {
  runApp(const BeginingAdvacedFlutter());
}

class BeginingAdvacedFlutter extends StatelessWidget {
  const BeginingAdvacedFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      title: "Flutter Advance",
      debugShowCheckedModeBanner: false,
      home: const NetworkChangeExampleView(),
      builder: MainBuild.mainBuild,
    );
  }
}
