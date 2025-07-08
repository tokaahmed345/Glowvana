import 'package:hive_flutter/adapters.dart';

class UserSettingsStorage{
  static const boxName='userBox';
  static const skinTypeKey='skintype';
final box =Hive.box(boxName);

Future <void>saveSkinType(String skinType)async{
await box.put(skinTypeKey, skinType.toLowerCase());

}
String getSkinType(){
  
 return box.get(skinTypeKey);
}


}