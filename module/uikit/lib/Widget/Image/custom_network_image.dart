import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uikit/Utility/asset_images.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.url});
  final String? url;

  String get _url => (url?.isEmpty ?? true) ? "" : url!;
  @override
  Widget build(BuildContext context) {
    return _url.isEmpty
        ? AssetImages.city.toImage
        : CachedNetworkImage(imageUrl: _url);
  }
}
