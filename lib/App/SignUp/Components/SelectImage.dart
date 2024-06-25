import 'package:image_picker/image_picker.dart';

Future<XFile?> chooseImage() async {
  final ImagePicker _picker = ImagePicker();
  return await _picker.pickImage(source: ImageSource.gallery);
}

Future<XFile?> takePhoto() async {
  final ImagePicker _picker = ImagePicker();
  return await _picker.pickImage(source: ImageSource.camera);
}
