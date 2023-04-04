import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:cloudinary_url_gen/transformation/effect/effect.dart';
import 'package:cloudinary_url_gen/transformation/resize/resize.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';
import 'package:flutter/material.dart';

var cloudinary=Cloudinary.fromStringUrl('<api_environment_variable>');

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
  String url = (cloudinary.image('cld-sample')
    ..transformation(Transformation()
      ..resize(Resize.fill()
        ..width(250)
        ..height(250))
      ..effect(Effect.sepia())))
       .toString();
  return url;
}
