import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(
  new MaterialApp(
    title: 'Alert',
    home: new MyApp(),
  )
);

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Alert'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('data'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => new CustomAlertDialog(
                content: Text('Bla'),
                actions: <Widget>[
                  new IconButton(
                    icon: Icon(Icons.ac_unit),
                    onPressed: () {
                      print("object");
                    },
                  ),
                  new IconButton(
                    icon: Icon(Icons.ac_unit),
                    onPressed: () {
                      print("object");
                    },
                  ),
                  new IconButton(
                    icon: Icon(Icons.ac_unit),
                    onPressed: () {
                      print("object");
                    },
                  ),
                ],
              )
            );
          },
        ),
      ),
    );
  }
}



class CustomAlertDialog extends AlertDialog{
  CustomAlertDialog({Key key, Widget title, Widget content, List<Widget> actions}):
  super(key : key, title: title, content : content, actions : actions);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData theme = Theme.of(context);
    final DialogTheme dialogTheme = DialogTheme.of(context);
    final List<Widget> children = <Widget>[];
    String label = semanticLabel;

    if (title != null) {
      children.add(Padding(
        padding: titlePadding ?? EdgeInsets.fromLTRB(24.0, 24.0, 24.0, content == null ? 20.0 : 0.0),
        child: DefaultTextStyle(
          style: titleTextStyle ?? dialogTheme.titleTextStyle ?? theme.textTheme.title,
          child: Semantics(
            child: title,
            namesRoute: true,
            container: true,
          ),
        ),
      ));
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          label = semanticLabel;
          break;
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          label = semanticLabel ?? MaterialLocalizations.of(context)?.alertDialogLabel;
      }
    }

    if (content != null) {
      children.add(Flexible(
        child: Padding(
          padding: contentPadding,
          child: DefaultTextStyle(
            style: contentTextStyle ?? dialogTheme.contentTextStyle ?? theme.textTheme.subhead,
            child: content,
          ),
        ),
      ));
    }

    if (actions != null) {
      children.add(ButtonTheme.bar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: actions,
        ),
      ));
    }

    Widget dialogChild = IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );

    if (label != null)
      dialogChild = Semantics(
        namesRoute: true,
        label: label,
        child: dialogChild,
      );

    return Dialog(
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      child: dialogChild,
    );
  }

}