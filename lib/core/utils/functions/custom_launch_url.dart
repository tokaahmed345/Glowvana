import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void>launchCustomUrl(context,String ?url)async{

  if (url!=null) {
  Uri link = Uri.parse(url);
  
                   if (await canLaunchUrl(link)) {
                          await launchUrl(link);
  
                   }
}else{
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("can't Launch $url")));
}

}