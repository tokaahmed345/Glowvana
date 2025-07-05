import 'package:firebase_auth/firebase_auth.dart';

class AuthModel {
 final  String email;
 final  String uid;
 final String ?displayName;
 
  


  AuthModel({this.displayName,required this.email, required this.uid});
  factory AuthModel.fromFirebaseAuth(User user){
    return AuthModel(email: user.email??'', uid: user.uid,displayName: user.displayName);
  }
  
  
  
  }