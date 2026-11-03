import 'package:flutter/material.dart';

mixin ClientFormControllersMixin {

  final TextEditingController otpController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void disposeClientControllers() {
    otpController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    priceController.dispose();
    quantityController.dispose();
    passwordController.dispose();
    nationalIdController.dispose();
    descriptionController.dispose();
    businessNameController.dispose();
    addressController.dispose();
    confirmPasswordController.dispose();
  }
}