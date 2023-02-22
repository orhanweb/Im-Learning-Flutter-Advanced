import 'package:flutter/material.dart';

enum AssetImages {
  city("img_city");

  final String name;
  const AssetImages(this.name);

  Widget get toImage {
    return Image.asset(
      "asset/$name.jpg",
      package: 'uikit',
    );
  }
}
