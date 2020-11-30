import 'package:flutter/material.dart';

typedef FocusWidgetBuild = Widget Function(BuildContext context, FocusNode focusNode, bool hasFocus);

class FocusWidget extends StatefulWidget {
  FocusWidgetBuild build;
  bool autofocus;

  FocusWidget({@required this.build, this.autofocus: false});

  @override
  _FocusWidgetState createState() => _FocusWidgetState();
}

class _FocusWidgetState extends State<FocusWidget> {
  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: widget.autofocus ?? false,
      child: Builder(
        builder: (BuildContext context) {
          final FocusNode focusNode = Focus.of(context);
          final bool hasFocus = focusNode.hasFocus;

          return GestureDetector(
            onTap: () {
              focusNode.requestFocus();
            },
            child: widget.build(context, focusNode, hasFocus),
          );
        },
      ),
    );
  }
}
