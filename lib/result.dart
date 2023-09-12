import 'package:flutter/material.dart';

class screentwo extends StatelessWidget {
  const screentwo({Key? key, required this.answers, required this.falses})
      : super(key: key);

  final int answers;
  final int falses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'the answers $answers',
              style: TextStyle(fontSize: 34),
            ),
            Text(
              'the falses $falses',
              style: TextStyle(fontSize: 43),
            ),
          ],
        ),
      ),
    );
  }
}
