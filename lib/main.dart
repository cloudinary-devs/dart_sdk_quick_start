import 'package:cloudinary_dart/cloudinary.dart';
import 'package:cloudinary_dart/transformation/transformation.dart';
import 'package:flutter/material.dart';
import 'package:cloudinary_dart/transformation/effect/effect.dart';
import 'package:cloudinary_dart/transformation/resize/resize.dart';

var cloudinary=Cloudinary.fromStringUrl('cloudinary://373364719177799:aa9f1c5a3d4c6ddd85d7c5f7673c4500@demo');

void main() async{
  cloudinary.config.urlConfig.secure = true;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
              width: 300,
              height: 300,
              child: Image.network(cloud()),
              ),
          ),
        ),
      );
  }
}

cloud() {
  String url = (cloudinary.image('docs/models')
    ..transformation(Transformation()
      ..resize(Resize.fill()
        ..width(250)
        ..height(250))
      ..effect(Effect.sepia())))
       .toString();
  return url;
}
