enum Operator {
  clear,
  sign,
  percent,
  divide,
  multiply,
  subtract,
  add,
  equal,
  backspace,
  decimal,
}

class CalculatorState {
  double firstInput;
  double secondInput;
  Operator? operator;


  CalculatorState({
    this.firstInput = 0,
    this.secondInput = 0,
    this.operator,
  });


  void addInput(String value) {
    print(value);
    double input = double.tryParse(value) ?? 0;

    if (operator == null) {
      firstInput = (firstInput * 10) + input;
    } else {
      secondInput = (secondInput * 10) + input;
    }
  }

  void addOperator(Operator newOperator) {
    print(newOperator);
    if (newOperator == Operator.clear) {
      firstInput = 0;
      secondInput = 0;
      operator = null;
      return;
    }

    if (newOperator == Operator.sign) {
      if (operator == null) {
        firstInput = -firstInput;
      } else {
        secondInput = -secondInput;
      }
      return;
    }

    if (newOperator == Operator.percent) {
      if (operator == null) {
        firstInput = firstInput / 100;
      } else {
        secondInput = secondInput / 100;
      }
      return;
    }

    if (newOperator == Operator.backspace) {
      if (operator == null) {
        firstInput = (firstInput / 10).floorToDouble();
      } else {
        secondInput = (secondInput / 10).floorToDouble();
      }
      return;
    }

    if (newOperator == Operator.decimal) {
      if (operator == null) {
        firstInput = firstInput + 0.1;
      } else {
        secondInput = secondInput + 0.1;
      }
      return;
    }

    if (operator == null) {
      operator = newOperator;
    } else {
      firstInput = calculate();
      secondInput = 0;
      operator = newOperator;
    }
  }

  double calculate() {
    switch (operator) {
      case Operator.add:
        return firstInput + secondInput;
      case Operator.subtract:
        return firstInput - secondInput;
      case Operator.multiply:
        return firstInput * secondInput;
      case Operator.divide:
        return firstInput / secondInput;
      default:
        return firstInput;
    }
  }
}