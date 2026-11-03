import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCubit extends Cubit<File?> {
  ImagePickerCubit() : super(null);

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      emit(File(image.path));
    }
  }

  void removeImage() {
    emit(null);
  }
}