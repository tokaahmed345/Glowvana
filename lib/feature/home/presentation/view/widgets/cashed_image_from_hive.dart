// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class CachedImageFromHive extends StatefulWidget {
//   final String imageUrl;
//   final double width;
//   final double height;

//   const CachedImageFromHive({
//     super.key,
//     required this.imageUrl,
//     required this.width,
//     required this.height,
//   });

//   @override
//   State<CachedImageFromHive> createState() => _CachedImageFromHiveState();
// }

// class _CachedImageFromHiveState extends State<CachedImageFromHive> {
//   Uint8List? imageBytes;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadImage();
//   }

//   Future<void> _loadImage() async {
//     final box = await Hive.openBox<Uint8List>('imageCacheBox');

//     if (box.containsKey(widget.imageUrl)) {
//       setState(() {
//         imageBytes = box.get(widget.imageUrl);
//         isLoading = false;
//       });
//     } else {
//       try {
//         final response = await NetworkAssetBundle(Uri.parse(widget.imageUrl)).load("");
//         final bytes = response.buffer.asUint8List();

//         await box.put(widget.imageUrl, bytes);
//         setState(() {
//           imageBytes = bytes;
//           isLoading = false;
//         });
//       } catch (e) {
//         setState(() {
//           isLoading = false;
//         });
//         print("Error loading image: $e");
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     } else if (imageBytes != null) {
//       return Image.memory(
//         imageBytes!,
//         width: widget.width,
//         height: widget.height,
//         fit: BoxFit.cover,
//       );
//     } else {
//       return const Icon(Icons.error);
//     }
//   }
// }
