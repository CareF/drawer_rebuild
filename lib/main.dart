import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

Widget _foo() {
  return Scaffold(
    appBar: AppBar(),
    body: Text('Foo', style: TextStyle(fontSize: 200),),
    drawer: SettingDrawer(),
  );
}

Widget _bar() {
  return Scaffold(
    appBar: AppBar(),
    body: Text('Bar', style: TextStyle(fontSize: 200),),
    drawer: SettingDrawer(),
  );
}

class MyAppState extends State<MyApp> {
  bool isFoo = true;
  void toggleFooBar() {
    setState(() {
      isFoo = !isFoo;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: isFoo ? _foo() : _bar(),
//      home: isFoo ? Foo() : Bar(),
    );
  }
}

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _foo();
  }
}

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _bar();
  }
}



class SettingDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FlatButton(
        child: Text('Switch Foo/Bar'),
        onPressed: () {
          MyAppState state = context.findAncestorStateOfType<MyAppState>();
          state.toggleFooBar();
          // Navigator.pop(context);
        },
      ),
    );
  }
}
