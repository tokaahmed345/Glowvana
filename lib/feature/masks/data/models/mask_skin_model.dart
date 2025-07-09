class MasksSkin{
  final String skinType;
  final String docId;

  final String maskName;
    final String description;
      final String  ingredients;
  final String  instructions;
    final String frequency;
      final String imageLink;
  final String tutorialLink;

  MasksSkin({required this.docId,required this.skinType, required this.maskName, required this.description, required this.ingredients, required this.instructions, required this.frequency, required this.imageLink, required this.tutorialLink});

factory MasksSkin.fromJson(String docId,Map<String,dynamic>json){
return MasksSkin(
  docId:docId,
  skinType: json["skinType"],
 maskName:json['name'] ,
  description: json["description"],
   ingredients: json["ingredients"],
    instructions: json["instructions"],
     frequency: json["frequency"], 
     imageLink: json["imageLink"],
      tutorialLink:json["tutorialLink"] 
      
      );
}



}