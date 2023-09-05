import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double bmi;
  final String result;
  final String interpretation;

  Result(
      {@required this.bmi,
      @required this.result,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        result,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 120,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            TextButton(
              onPressed: () => {Navigator.pop(context)},
              child: Text(
                'Re-calculate',
                style: TextStyle(
                    fontSize: 32, color: Theme.of(context).primaryColorDark),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
