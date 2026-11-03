import 'package:flutter/material.dart';

class ProductHeaderImage extends StatelessWidget {
  final String imageUrl;

  const ProductHeaderImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 240,
      child: Image.network(
        imageUrl,
        fit: .cover,
        errorBuilder: (context, error, stackTrace) => const Center(
          child: Icon(Icons.broken_image, size: 60, color: Colors.grey),
        ),
      ),
    );
  }
}