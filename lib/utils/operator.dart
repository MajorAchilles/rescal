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

getHumanReadableString(Operator operator) {
  switch (operator) {
    case Operator.divide:
      return '/';
    case Operator.multiply:
      return 'x';
    case Operator.subtract:
      return '-';
    case Operator.add:
      return '+';
    default:
      return '';
  }
}