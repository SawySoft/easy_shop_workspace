import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCubit extends Cubit<Map<String, File?>> {
  ImagePickerCubit() : super({});

  final ImagePicker _imagePicker = ImagePicker();


  Future<void> pickImage({required String key}) async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final updatedMap = Map<String, File?>.from(state);
      updatedMap[key] = File(image.path);
      emit(updatedMap);
    }
  }

  void removeImage(String key) {
    if (state.containsKey(key)) {
      final updatedMap = Map<String, File?>.from(state);
      updatedMap.remove(key);
      emit(updatedMap);
    }
  }

}

abstract class ImageKeys {
  static const String taxCard = 'taxCard';
  static const String product = 'product';
  static const String profile = 'profile';
  static const String commercialRegister = 'commercialRegister';
}