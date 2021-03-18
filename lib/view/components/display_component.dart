import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayComponent extends StatelessWidget {
  final String displayText;

  const DisplayComponent(this.displayText, {Key key}) : super(key: key);

  Text textToDisplay() {
    return new Text(
      displayText,
      textAlign: TextAlign.end,
      style: new TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 3,
      child: new Container(
        color: new Color.fromARGB(255, 120, 120, 120),
        child: new Padding(
          padding: const EdgeInsets.all(5.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [textToDisplay()],
          ),
        ),
      ),
    );
  }
}
