import 'package:dot_of/dot_of.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          /// haribote
          Image.asset('images/Image-1.jpg'),

          Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    _ButtonSection(
                      label: 'pop',
                      onTap: () => context.navigator.maybePop(),
                    ),
                    _ButtonSection(
                      label: 'push',
                      onTap: () => context.navigator.push(
                        MaterialPageRoute(
                          builder: (_context) => MyHomePage(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _ButtonSection(
                label: 'pop up',
                onTap: context.read<LoveDialogVisibilityNotifier>().toggle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ButtonSection extends StatelessWidget {
  const _ButtonSection({
    @required this.onTap,
    @required this.label,
    Key key,
  }) : super(key: key);

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        alignment: Alignment.center,
        child: RaisedButton(
          child: Text(label),
          onPressed: onTap,
        ),
      ),
    );
  }
}
