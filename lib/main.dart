import 'dart:async';
import 'package:flutter/material.dart';
import 'next_page.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(title: 'タイマー'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _centiSecond = 0;
  int _second = 0;
  int _minute = 0;
  Timer? _timer;
  bool _isRunning = false;

  String _timerText = '';

  @override
  void initState() {
    super.initState();

    setState(() {
      _timerText = '${_minute.toString().padLeft(2, '0')}:${_second.toString().padLeft(2, '0')}.${_centiSecond.toString().padLeft(2, '0')}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _timerText,
              style: const TextStyle(fontSize: 64),
            ),
            ElevatedButton(
              onPressed: () {
                toggleTimer();
              },
              child: Text(
                _isRunning ? 'stop' : 'start',
                style: TextStyle(color: _isRunning ? Colors.red : Colors.green),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                resetTimer();
              },
              child: const Text(
                'reset',
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void toggleTimer() {
    if (_isRunning) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(
        const Duration(milliseconds: 10), (timer) {
          if (_centiSecond == 99) {
            setState(() {
              _second++;
              _centiSecond = 0;
            }); 
          } else if (_second == 59) {
            setState(() {
              _minute++;
              _second = 0;
            });
          } else {
            setState(() {
              _centiSecond++;
            });
          }

          setState(() {
            _timerText = '${_minute.toString().padLeft(2, '0')}:${_second.toString().padLeft(2, '0')}.${_centiSecond.toString().padLeft(2, '0')}';
          });
        }
      );
    }
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  void resetTimer() {
    _timer?.cancel();
    setState(() {
      _second = 0;
      _isRunning = false;
    });
  }
}
