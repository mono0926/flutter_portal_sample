import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

import 'home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (_, child) => Portal(child: child),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
