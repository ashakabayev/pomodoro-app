import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1500;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Timer _timer = Timer(Duration(minutes: 25), () {});

  bool isActive = false;

  @override
  void dispose() {
    _timer.cancel();
  }

  void startTimer() {
    isActive = true;
    const oneSec = const Duration(seconds: 1);

    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_counter == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          print('tiktok');
          setState(() {
            _counter -= 1;
          });
        }
        // if (timeLeft.s) {
        // setState(() {
        //   timer.cancel();
        // });
        // } else {
        //   setState(() {
        //     // _start--;
        //   });
        // }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isActive ? Colors.greenAccent : Colors.redAccent,
      appBar: AppBar(
        title: Text("ASAN's POMODORO TIMER"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Text(
            'POMODORO TIMER:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            '${(_counter / 60).toInt()}:${_counter % 60}',
            style: Theme.of(context).textTheme.headline4,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  if (isActive == false) startTimer();
                },
                child: Text(
                  'START',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isActive = false;
                    _timer.cancel();
                  });
                },
                child: Text(
                  'STOP',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isActive = false;
                    _counter = 1500;
                    _timer.cancel();
                  });
                },
                child: Text(
                  'RESET',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100)
        ],
      ),
    );
  }
}
