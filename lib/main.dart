import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class SingletonClass {
  static final SingletonClass _instance = SingletonClass._internal();
  SingletonClass._internal();
  factory SingletonClass() {
    return _instance;
  }

  FocusNode? focusNode;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    super.initState();
    SingletonClass().focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    print('node: ${SingletonClass().focusNode}');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(focusNode: SingletonClass().focusNode),
            ElevatedButton(
              focusNode: SingletonClass().focusNode,
              child: const Text('Go to Page 2'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Page2()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  void initState() {
    super.initState();
    SingletonClass().focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(focusNode: SingletonClass().focusNode),
            ElevatedButton(
              focusNode: SingletonClass().focusNode,
              child: const Text('Go Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
