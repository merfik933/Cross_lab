void main() {
  double function(double x) {
    return x * x - 2 * x * x * x;
  }

  double start = -3.0;
  double end = 8.0;
  double step = 0.5;

  double sum = 0.0;
  double min = double.infinity;
  double max = double.negativeInfinity;
  int count = 0;

  for (double x = start; x <= end; x += step) {
    double y = function(x);
    sum += y;
    if (y < min) min = y;
    if (y > max) max = y;
    count++;
  }

  double average = sum / count;

  print('Мінімальне значення функції: $min');
  print('Максимальне значення функції: $max');
  print('Середнє арифметичне значення функції: $average');
  print('Сума значень функції: $sum');
}