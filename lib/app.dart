import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'love_dialog/love_dialog.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (_, child) => ChangeNotifierProvider(
        create: (context) => LoveDialogVisibilityNotifier(),
        builder: (context, child) => Stack(
          children: <Widget>[
            child,
            Visibility(
              visible: context.watch<LoveDialogVisibilityNotifier>().value,
              child: LoveDialog.wrapped(
                onFinish: () {
                  context.read<LoveDialogVisibilityNotifier>().toggle();
                },
              ),
            ),
          ],
        ),
        child: child,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoveDialogVisibilityNotifier extends ValueNotifier<bool> {
  LoveDialogVisibilityNotifier() : super(false);

  void toggle() => value = !value;
}
