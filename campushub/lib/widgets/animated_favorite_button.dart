import 'package:flutter/material.dart';

class AnimatedFavoriteButton extends StatefulWidget {
  const AnimatedFavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onPressed,
  });

  final bool isFavorite;
  final VoidCallback onPressed;

  @override
  State<AnimatedFavoriteButton> createState() {
    return _AnimatedFavoriteButtonState();
  }
}

class _AnimatedFavoriteButtonState extends State<AnimatedFavoriteButton>
    with SingleTickerProviderStateMixin {

  late final AnimationController controller;
  late final Animation<double> scale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.4)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.4, end: 1.0)
            .chain(CurveTween(curve: Curves.bounceOut)),
        weight: 50,
      ),
    ]).animate(controller);
  }

  @override
  void didUpdateWidget(covariant AnimatedFavoriteButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isFavorite != oldWidget.isFavorite) {
      controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,

      child: IconButton(
        onPressed: widget.onPressed,

        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),

          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },

          child: Icon(
            widget.isFavorite
                ? Icons.favorite
                : Icons.favorite_border,
            key: ValueKey<bool>(widget.isFavorite),
            color: widget.isFavorite
                ? Colors.red
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}