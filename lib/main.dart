import 'package:flutter/material.dart';

void main() {
  runAppWithStyle(WidgetsPracticeApp());
}

class WidgetsPracticeApp extends StatefulWidget {
  @override
  _WidgetsPracticeAppState createState() => _WidgetsPracticeAppState();
}

class _WidgetsPracticeAppState extends State<WidgetsPracticeApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets Practice',
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: WelcomeScreen(
        onToggleDarkMode: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onToggleDarkMode;

  WelcomeScreen({required this.onToggleDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to my App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to my App',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            CounterWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onToggleDarkMode,
        tooltip: 'Toggle Dark Mode',
        child: Icon(Icons.brightness_6),
      ),
    );
  }
}

class GreetingWidget extends StatelessWidget {
  final String greetingMessage;

  GreetingWidget({Key? key, this.greetingMessage = 'Hello, World!'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        greetingMessage,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Counter Value:',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          '$counter',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Increment'),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: _resetCounter,
              child: Text('Reset'),
            ),
          ],
        ),
      ],
    );
  }
}

class WidgetTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Tree Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GreetingWidget(greetingMessage: 'Welcome to the Widget Tree!'),
            CounterWidget(),
            Text('Another Widget Level'),
          ],
        ),
      ),
    );
  }
}

void runAppWithStyle(Widget app) {
  runApp(
    MaterialApp(
      title: 'Styled Widgets App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
      home: app,
    ),
  );
}
