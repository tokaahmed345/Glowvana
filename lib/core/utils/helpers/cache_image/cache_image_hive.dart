import 'dart:typed_data';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class ImageCaching {
  static const String boxName = 'imageCacheBox';
Future<Uint8List?> getImageBytes(String imageUrl) async {
  final box = await Hive.openBox(boxName);

  if (box.containsKey(imageUrl)) {
    return box.get(imageUrl);
  } else {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        await box.put(imageUrl, bytes);
        return bytes;
      }
    } catch (e) {
      print("Failed to load image: $e");
      return null;
    }
  }
  return null;
}


   
  }
  

