import 'package:flutter/material.dart';

void pushTo(BuildContext context,Widget screen){
  Navigator.push(context,MaterialPageRoute(builder: (context)=> screen));
}

void pushwithReplacement(BuildContext context,Widget screen){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen));
}

void pushAndRemoveUntil(BuildContext context,Widget screen){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => screen), (route) => false);
}