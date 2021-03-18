import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final int flex;
  final void Function(String text) onPressed;

  const ButtonComponent(this.text, {Key key, this.flex = 1, this.onPressed}) : super(key: key);

  Text textButton() {
    return new Text(
      text,
      style: new TextStyle(
        fontSize: 22,
      ),
    );
  }

  ElevatedButton elevatedButton() {
    return new ElevatedButton(
      onPressed: () => onPressed(text),
      style: ElevatedButton.styleFrom(
        primary: new Color.fromARGB(255, 20, 20, 20),
        onPrimary: Colors.red,
        side: BorderSide(
          color: new Color.fromARGB(255, 18, 18, 18),
        ),
        shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      child: textButton(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: flex,
      child: new Padding(
        padding: const EdgeInsets.all(0.0),
        child: elevatedButton(),
      ),
    );
  }
}
