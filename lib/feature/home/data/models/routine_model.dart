class RoutineModel{
  final String docId;
 final String skinType;
  final String routineType;
  final int stepOrder;
  final String title;
  final String why;
  final String howTo;
  final String tutorialUrl;
  final String imageUrl;
final String description;

  RoutineModel( {
    required this.description,required this.docId, required this.skinType, required this.routineType, required this.stepOrder, required this.title, required this.why, required this.howTo, required this.tutorialUrl, required this.imageUrl});

factory RoutineModel.fromJson(String docId,Map<String,dynamic>json){
  return RoutineModel(docId: docId, skinType: json['skinType'], 
  routineType: json['routineType'], 
  stepOrder: json['stepOrder'], 
  title: json['title'],
   why: json['why'], 
   howTo: json['howTo'],
   tutorialUrl: json['tutorialUrl'], 
   imageUrl: json['imageUrl'],
   description:json['suggestedProduct']
   
   );
}

}