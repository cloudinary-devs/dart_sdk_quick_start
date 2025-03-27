// Import the Cloudinary packages.
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';
import 'package:cloudinary_api/uploader/cloudinary_uploader.dart';
import 'package:cloudinary_api/src/request/model/uploader_params.dart';
import 'package:cloudinary_url_gen/transformation/effect/effect.dart';
import 'package:cloudinary_url_gen/transformation/resize/resize.dart';

// Create a Cloudinary instance and set your cloud name.
var cloudinary=Cloudinary.fromStringUrl('cloudinary://API_KEY:API_SECRET@CLOUD_NAME');

void main() async{
  cloudinary.config.urlConfig.secure = true;
  await upload();
  transform();
}

upload() async{
  // Upload the asset from a remote source. Assign the public ID `quickstart_butterfly`.
  var response = await cloudinary.uploader().upload('https://cloudinary-devs.github.io/cld-docs-assets/assets/images/butterfly.jpeg',
    params: UploadParams(
        publicId: 'quickstart_butterfly',
        uniqueFilename: false,
        overwrite: true));
  print("Public ID:");
  print(response?.data?.publicId);
  print("Secure URL:");
  print(response?.data?.secureUrl);
}

transform() {
  // Generate a delivery URL for the uploaded image with the desired transformation applied.
  String url = (cloudinary.image('quickstart_butterfly')
    ..transformation(Transformation()
      ..resize(Resize.fill()
        ..width(250)
        ..height(250))
      ..effect(Effect.sepia())))
       .toString();
  print("Secure URL with Transformation:");
  print(url);
}
