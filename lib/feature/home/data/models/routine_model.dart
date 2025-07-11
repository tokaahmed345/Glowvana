// class RoutineModel{
//   final String docId;
//  final String skinType;
//   final String routineType;
//   final int stepOrder;
//   final String title;
//   final String why;
//   final String howTo;
//   final String tutorialUrl;
//   final String imageUrl;
// final String description;
// final bool isDone;
//   RoutineModel( {
//     required this.description,required this.docId, required this.skinType, required this.routineType, required this.stepOrder, required this.title, required this.why, required this.howTo, required this.tutorialUrl, required this.imageUrl,required this.isDone});

// factory RoutineModel.fromJson(String docId,Map<String,dynamic>json){
//   return RoutineModel(docId: docId, skinType: json['skinType'], 
//   routineType: json['routineType'], 
//   isDone:json['isDone']??false,
//   stepOrder: json['stepOrder'], 
//   title: json['title'],
//    why: json['why'], 
//    howTo: json['howTo'],
//    tutorialUrl: json['tutorialUrl'], 
//    imageUrl: json['imageUrl'],
//    description:json['suggestedProduct']
   
//    );
// }

// }
class RoutineModel {
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
  final bool isDone;

  RoutineModel({
    required this.description,
    required this.docId,
    required this.skinType,
    required this.routineType,
    required this.stepOrder,
    required this.title,
    required this.why,
    required this.howTo,
    required this.tutorialUrl,
    required this.imageUrl,
    required this.isDone,
  });

  factory RoutineModel.fromJson(String docId, Map<String, dynamic> json) {
    return RoutineModel(
      docId: docId,
      skinType: json['skinType'],
      routineType: json['routineType'],
      isDone: json['isDone'] ?? false,
      stepOrder: json['stepOrder'],
      title: json['title'],
      why: json['why'],
      howTo: json['howTo'],
      tutorialUrl: json['tutorialUrl'],
      imageUrl: json['imageUrl'],
      description: json['suggestedProduct'],
    );
  }

  RoutineModel copyWith({bool? isDone}) {
    return RoutineModel(
      docId: docId,
      skinType: skinType,
      routineType: routineType,
      stepOrder: stepOrder,
      title: title,
      why: why,
      howTo: howTo,
      tutorialUrl: tutorialUrl,
      imageUrl: imageUrl,
      description: description,
      isDone: isDone ?? this.isDone,
    );
  }
}
