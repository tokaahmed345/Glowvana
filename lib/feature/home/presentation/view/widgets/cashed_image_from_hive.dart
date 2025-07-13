import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:glowvana/core/utils/service_locator/service_locator.dart';
import 'package:glowvana/core/utils/helpers/cache_image/cache_image_hive.dart';

class CachedImageFromHive extends StatefulWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const CachedImageFromHive({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  State<CachedImageFromHive> createState() => _CachedImageFromHiveState();
}

class _CachedImageFromHiveState extends State<CachedImageFromHive> {
  Uint8List? imageBytes;
  bool isLoading = true;
  final ImageCaching imageCache=getIt.get<ImageCaching>();

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final bytes = await imageCache.getImageBytes(widget.imageUrl);
    setState(() {
      imageBytes = bytes;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return  SizedBox(
        width: 60,
        height: 60,
        child: Center(child:SpinKitFadingCircle (color: Theme.of(context).cardColor,)),
      );
    } else if (imageBytes != null) {
      return ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        child: Image.memory(
          imageBytes!,
          width: widget.width,
          height: widget.height,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return const Icon(Icons.error);
    }
  }
}
