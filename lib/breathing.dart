import 'dart:async';
import 'package:flutter/material.dart';

class BreathingExercisePage extends StatefulWidget {
  @override
  _BreathingExercisePageState createState() => _BreathingExercisePageState();
}

class _BreathingExercisePageState extends State<BreathingExercisePage> {
  int _secondsRemaining = 0;
 Timer? _timer;
  final _animationController = ValueNotifier<double>(0);
  String _breathingText = '';
  int _breathCount = 0;

  void _startTimer() {
    _breathCount = 0;
    _secondsRemaining = 12;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
          if (_secondsRemaining >= 7) { // breathe in for 5 seconds
            _animationController.value = 1 - ((_secondsRemaining - 7) / 5);
            _breathingText = 'Breathe In';
          } else if (_secondsRemaining >= 5) { // hold breath for 2 seconds
            _animationController.value = 1;
            _breathingText = 'Hold Breath';
          } else { // breathe out for 5 seconds
            _animationController.value = (_secondsRemaining - 5) / 5;
            _breathingText = 'Breathe Out';
          }
        } else {
          _breathCount++;
          if (_breathCount == 5) {
            timer.cancel();
          } else {
            _secondsRemaining = 12;
          }
        }
      });
    });
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      _timer = null;
    }
  }

  @override
  void dispose() {
    _stopTimer();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breathing Exercise'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _breathingText,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ValueListenableBuilder<double>(
                    valueListenable: _animationController,
                    builder: (context, value, child) {
                      return CircularProgressIndicator(
                        value: value,
                        strokeWidth: 10,
                        backgroundColor: Colors.black,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_timer == null || !_timer!.isActive) {
                  _startTimer();
                } else {
                  _stopTimer();
                }
              },
              child: Text(_timer == null || !_timer!.isActive ? 'Start' : 'Stop'),
            ),
          ],
        ),
      ),
    );
  }
}
