import 'package:flutter/material.dart';

class AdaptiveNetworkImage extends StatelessWidget {
  const AdaptiveNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
  });

  final String url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.cover,

      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return SizedBox(
          width: width,
          height: height,
          child: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },

      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          width: width,
          height: height,
          child: const Center(
            child: Icon(
              Icons.broken_image,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}