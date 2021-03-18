import 'package:calculadora/controller/main_controller.dart';
import 'package:calculadora/view/components/button_component.dart';
import 'package:calculadora/view/components/display_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  MainController mainController = new MainController();
  String displayText = '0';

  void _isNumber(String text) {
    mainController.addCurrentNumber(text);

    String txt = mainController.getOperation();
    setState(() {
      displayText = txt;
    });
  }

  void _isOperation(String text) {
    mainController.addOperation(text);

    String txt = mainController.getOperation();
    setState(() {
      displayText = txt;
    });
  }

  void _backward() {
    mainController.backward();

    String txt = mainController.getOperation();
    setState(() {
      displayText = txt;
    });
  }

  void _clear() {
    mainController.resetOperation();

    setState(() {
      displayText = '0';
    });
  }

  void _percent() {
    mainController.percent();

    String txt = mainController.getOperation();
    setState(() {
      displayText = txt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new DisplayComponent(displayText),
          new Expanded(
            flex: 1,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new ButtonComponent('C', onPressed: (text) => _clear()),
                new ButtonComponent('CC', onPressed: (text) => _backward()),
                new ButtonComponent('%', onPressed: (text) => _percent()),
                new ButtonComponent('*', onPressed: (text) => _isOperation(text)),
              ],
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new ButtonComponent('7', onPressed: (text) => _isNumber(text)),
                new ButtonComponent('8', onPressed: (text) => _isNumber(text)),
                new ButtonComponent('9', onPressed: (text) => _isNumber(text)),
                new ButtonComponent('/', onPressed: (text) => _isOperation(text)),
              ],
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new ButtonComponent('4', onPressed: (text) => _isNumber(text)),
                new ButtonComponent('5', onPressed: (text) => _isNumber(text)),
                new ButtonComponent('6', onPressed: (text) => _isNumber(text)),
                new ButtonComponent('+', onPressed: (text) => _isOperation(text)),
              ],
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new ButtonComponent('1', onPressed: (text) => _isNumber(text)),
                new ButtonComponent('2', onPressed: (text) => _isNumber(text)),
                new ButtonComponent('3', onPressed: (text) => _isNumber(text)),
                new ButtonComponent('-', onPressed: (text) => _isOperation(text)),
              ],
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new ButtonComponent('0', flex: 2, onPressed: (text) => _isNumber(text)),
                new ButtonComponent(',', onPressed: (text) => _isNumber(text)),
                new ButtonComponent('=', onPressed: (text) => _isOperation(text)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
