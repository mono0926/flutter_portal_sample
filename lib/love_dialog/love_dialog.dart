import 'dart:ui';

import 'package:disposable_provider/disposable_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsync_provider/vsync_provider.dart';

import '../app.dart';
import 'love_dialog_animation_manager.dart';

class LoveDialog extends StatelessWidget {
  const LoveDialog._({Key key}) : super(key: key);

  static Widget wrapped({@required VoidCallback onFinish}) {
    return MultiProvider(
      providers: [
        VsyncProvider(),
        DisposableProvider(
          create: (_context) => LoveDialogAnimationManager(
            vsync: _context.read(),
            onFinish: onFinish,
          ),
        ),
      ],
      child: const LoveDialog._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<LoveDialogAnimationManager>();
    return FadeTransition(
      opacity: model.fadeAnimation,
      child: ScaleTransition(
        scale: model.scaleAnimation,
        child: const _Dialog(),
      ),
    );
  }
}

class _Dialog extends StatelessWidget {
  const _Dialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.6,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.65),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 30),
                      Icon(
                        Icons.favorite,
                        size: 90,
                        color: Color.fromRGBO(79, 70, 70, 1.0),
                      ),
                      const SizedBox(height: 20),
                      const _Content(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Text(
            'ラブ済み',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          Text(
            'これに似たものをFor Youでもっとおすすめするようにします。',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.9,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
