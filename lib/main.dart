import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImplicitAnimation(),
    );
  }
}

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  bool _isLarge = false;
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: _isLarge ? 200.0 : 100.0,
              height: _isLarge ? 100.0 : 200.0,
              color: _isLarge ? Colors.red : Colors.blue,
              child: const Center(
                child: Text(
                  'AnimatedContainer',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'AnimatedOpacity',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isLarge = !_isLarge;
            _isVisible = !_isVisible;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
