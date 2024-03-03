import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = 'Flutter Demo';
  final message = 'sample message';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        title: title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    title = 'Flutter Demo Home Page',
  }) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  static String _message = 'ok.';
  static final _janken = <String>['グー', 'チョキ', 'パー'];
  static final _controller = TextEditingController();
  static var _checked = false;
  static String _selected = _janken[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                _message,
                style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller,
                onChanged: textCanged,
                style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: buttonPressed,
                  child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        size: 50.0,
                        Icons.android,
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Checkbox(value: _checked, onChanged: checkChanged),
                  const Text("Checkbox", style: TextStyle(fontSize: 32.0)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Switch(value: _checked, onChanged: checkChanged),
                  const Text("Checkbox", style: TextStyle(fontSize: 32.0)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButton(
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: _janken[0],
                    child: Text(_janken[0]),
                  ),
                  DropdownMenuItem(
                    value: _janken[1],
                    child: Text(_janken[1]),
                  ),
                  DropdownMenuItem(
                    value: _janken[2],
                    child: Text(_janken[2]),
                  ),
                ],
                onChanged: popupSelected,
                value: _selected,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void buttonPressed() {
    setState(() {
      _message = 'you said: ${_controller.text}';
    });
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(_controller.text),
              content: Text(_message),
            ));
  }

  void textCanged(String val) {
    setState(() {
      _message = val.toUpperCase();
    });
  }

  void checkChanged(bool? value) {
    setState(() {
      _checked = value!;
      _message = _checked ? 'checked' : 'unchecked';
    });
  }

  void popupSelected(String? value) {
    setState(() {
      _selected = value ?? 'not selected...';
      _message = "selected: $_selected";
    });
  }
}
