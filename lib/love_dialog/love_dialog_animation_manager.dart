import 'dart:ui';

import 'package:disposable_provider/disposable_provider.dart';
import 'package:flutter/material.dart';

class LoveDialogAnimationManager extends Disposable {
  LoveDialogAnimationManager({
    @required this.onFinish,
    @required TickerProvider vsync,
  }) : _animationController = AnimationController(
          vsync: vsync,
          duration: Duration(milliseconds: 200),
        ) {
    _initialize();
    _animationController.forward().then((_) async {
      _setReverseAnimation();
      await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
      _animationController.reverse().then((value) => onFinish());
    });
  }

  final VoidCallback onFinish;
  final AnimationController _animationController;

  Animation<double> _scaleAnimation;
  Animation<double> _fadeAnimation;

  Animation<double> get scaleAnimation => _scaleAnimation;
  Animation<double> get fadeAnimation => _fadeAnimation;

  void _initialize() {
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutQuad,
    ).drive(Tween<double>(begin: 0.8, end: 1));
  }

  void _setReverseAnimation() {
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ).drive(Tween<double>(begin: 0.8, end: 1));
  }

  @override
  void dispose() {
    _animationController.dispose();
  }
}
