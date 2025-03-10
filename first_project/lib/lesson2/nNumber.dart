import 'dart:io';
import 'dart:math';

  void main() {
  stdout.write('Введіть ціле число більше 0: ');
  String? input = stdin.readLineSync();

  // Перевіряємо, чи введене значення є числом
  if (input == null || int.tryParse(input) == null) {
    print('Помилка: введене значення не є коректним числом.');
    main();
    return;
  }

  int n = int.parse(input);

  // Перевіряємо, чи число більше 0
  if (n <= 0) {
    print('Помилка: число має бути більше 0.');
    main();
  }

  int sum = 0;
  int i = 1;

  while (i <= n) {
    sum += i;
    i++;
  }

  print('Сума чисел від 1 до $n дорівнює $sum.');
}