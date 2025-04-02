
import 'package:image_picker/image_picker.dart';

class LocalFiles {
  Future<String> getImage() async {
    String imagePath = '';
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      imagePath = file.path;
    }

    return imagePath;
  }
}
