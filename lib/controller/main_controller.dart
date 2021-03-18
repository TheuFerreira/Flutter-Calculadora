import 'package:calculadora/controller/time_modifiers.dart';

class MainController {
  List<num> _numbers = [];
  List<String> _operations = [];
  TimeModifiers _time = TimeModifiers.None;
  String currentNumber = '';

  void addCurrentNumber(String text) {
    if (_time == TimeModifiers.Equals) _numbers = [];

    if (currentNumber.contains(',') && text == ',') return;

    currentNumber += text;
    _time = TimeModifiers.Number;
  }

  void addOperation(String operation) {
    if (_time == TimeModifiers.Operation) {
      if (operation == '=') {
        _operations.removeAt(_operations.length - 1);
        _calculate();
        return;
      }

      _operations[_operations.length - 1] = operation;
    } else {
      if (_time == TimeModifiers.Equals) {
        currentNumber = _numbers[0].toString();
        _numbers = [];
      } else if (_time == TimeModifiers.None) {
        currentNumber = '0';
      }

      _numbers.add(_stringToNumber());

      if (operation == '=') {
        _calculate();
        return;
      }

      _operations.add(operation);
      _time = TimeModifiers.Operation;
    }
  }

  void resetOperation() {
    _numbers = [];
    _operations = [];
    _time = TimeModifiers.None;
    currentNumber = '';
  }

  void backward() {
    if (_time == TimeModifiers.Number) {
      currentNumber = currentNumber.substring(0, currentNumber.length - 1);

      if (currentNumber.isEmpty) {
        currentNumber = '';
        if (_operations.length > 0)
          _time = TimeModifiers.Operation;
        else
          _time = TimeModifiers.None;
      }
    } else if (_time == TimeModifiers.Operation) {
      _operations.removeAt(_operations.length - 1);
      currentNumber = _numbers[_numbers.length - 1].toString();
      _numbers.removeAt(_numbers.length - 1);

      _time = TimeModifiers.Number;
    } else if (_time == TimeModifiers.Equals) {
      resetOperation();
    }
  }

  void percent() {
    if (_time == TimeModifiers.Number) {
      num value = double.parse(currentNumber);
      value /= 100;
      currentNumber = value.toString();
    } else if (_time == TimeModifiers.Equals) {
      num value = _numbers[0];
      value /= 100;
      currentNumber = value.toString();
      _numbers = [];
      _time = TimeModifiers.Number;
    }
  }

  void _calculate() {
    for (int i = 0; i < _operations.length; i++) {
      if (_operations[i] == '*') {
        _numbers[i] *= _numbers[i + 1];
      } else if (_operations[i] == '/') {
        _numbers[i] /= _numbers[i + 1];
      } else {
        continue;
      }

      _numbers.removeAt(i + 1);
      _operations.removeAt(i);
      i--;
    }

    num answer = _numbers[0];
    for (int i = 0; i < _operations.length; i++) {
      switch (_operations[i]) {
        case '+':
          answer += _numbers[i + 1];
          break;
        case '-':
          answer -= _numbers[i + 1];
          break;
      }
    }

    _numbers = [];
    _operations = [];
    currentNumber = '';

    _numbers.add(answer);
    _time = TimeModifiers.Equals;
  }

  num _stringToNumber() {
    currentNumber = currentNumber.replaceAll(',', '.');
    num value = num.parse(currentNumber);
    currentNumber = '';

    return value;
  }

  String getOperation() {
    if (_numbers.length == 0 && _operations.length == 0 && currentNumber == '') return '0';

    if (_time == TimeModifiers.Equals) {
      return '=' + _numbers[0].toString();
    }

    String text = _numbers.length == 0 ? currentNumber : _numbers[0].toString();

    for (int i = 0; i < _operations.length; i++) {
      text += _operations[i];
      text += _numbers.length == i + 1 ? currentNumber : _numbers[i + 1].toString();
    }
    return text;
  }
}
