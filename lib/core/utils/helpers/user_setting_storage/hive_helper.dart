import 'package:hive_flutter/adapters.dart';

class UserSettingsStorage {
  static const boxName = 'userBox';
  static const skinTypeKey = 'skintype';
  static const routineTypeKey = 'routineType';
  static const lastRoutineLoadKey = 'lastRoutineLoadDate';
  static const selectedImage = 'imageSelected';

  final box = Hive.box(boxName);

  Future<void> saveRoutineType(String routineType) async {
    await box.put(routineTypeKey, routineType.toLowerCase());
  }

  String getRoutineType() {
    return box.get(routineTypeKey, defaultValue: 'morning');
  }

  Future<void> saveSkinType(String skinType) async {
    await box.put(skinTypeKey, skinType.toLowerCase());
  }

  String getSkinType() {
    return box.get(skinTypeKey);
  }

  Future<void> saveLastRoutine(DateTime date) async {
    await box.put(lastRoutineLoadKey, date.toIso8601String());
  }

  DateTime? getToday() {
    final saved = box.get(lastRoutineLoadKey);
    if (saved != null) {
      return DateTime.tryParse(saved);
    }
    return null;
  }

  bool getMaskUsedToday() {
    return box.get('maskUsed', defaultValue: false);
  }

  Future<void> setMaskUsedToday(bool value) async {
    await box.put('maskUsed', value);
  }

// Future<void> initializeDefaults() async {
//   final routineType = box.get(routineTypeKey);
//   if (routineType == null) {
//     await box.put(routineTypeKey, 'morning');
//   }

// }
Future<void>saveSelectedImage(String imagePath)async{
await box.put(selectedImage, imagePath);
}
String ? getImageSaved(){
  return box.get(selectedImage);
}
}
