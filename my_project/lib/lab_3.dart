class Calc {
  double start;
  double end;
  double step;
  double sum = 0.0;

  Calc(this.start, this.end, [this.step = 0.1]);

  void setStep(double newStep) {
    step = newStep;
  }

  double computeFunction(double x) {
    return (4 * x * x != 0) ? (5 * x) / (4 * x * x) : 0.0;
  }

  void tabulate() {
    double x = start;
    while (x <= end) {
      double y = computeFunction(x);
      print('x = ${x.toStringAsFixed(2)}, y = ${y.toStringAsFixed(4)}');
      sum += y;
      x += step;
    }
    print('Сума значень функції: ${sum.toStringAsFixed(4)}');
  }
}