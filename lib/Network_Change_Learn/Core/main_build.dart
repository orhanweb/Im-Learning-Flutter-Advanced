import 'package:flutter/material.dart';

import '../Use_Case/no_network_widget.dart';

class MainBuild {
  MainBuild._(); // for singelton
  static Widget mainBuild(BuildContext context, Widget? child) {
    return Column(
      children: [
        Expanded(child: child ?? const SizedBox()),
        const NoNetworkWidget(),
      ],
    );
  }
}
