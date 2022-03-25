import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dragging IMage',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDropped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Draggable<String>(
                data: 'red',
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  child: Center(
                    child: Image.asset('assets/images/apple.png'),
                  ),
                ),
                feedback: Container(
                  height: 120.0,
                  width: 120.0,
                  child: Center(
                    child: Image.asset('assets/images/apple.png'),
                  ),
                ),
                childWhenDragging: Container(
                  height: 120.0,
                  width: 120.0,
                  child: Center(
                    child: Image.asset('assets/images/greyed.png'),
                  ),
                ),
              ),
              DragTarget<String>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                    height: 300,
                    width: 300,
                    child: Center(
                      child: Image.asset(_isDropped
                          ? 'assets/images/bunch.png'
                          : 'assets/images/bunch.png'),
                    ),
                  );
                },
                onWillAccept: (data) {
                  return data == 'red';
                },
                onAccept: (data) {
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('dropped successfully'),
                      ),
                    );

                    //  (context, 'Dropped succesfully');
                    _isDropped = true;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
