import 'dart:io';
import 'dart:math';

void main() {
  int secretNumber = Random().nextInt(100) + 1; // Генеруємо випадкове число від 1 до 100
  print('Гра "Вгадай число"');
  print('Я загадав число від 1 до 100. Спробуйте його вгадати!');
  
  guessNumber(secretNumber); // Викликаємо функцію для вгадування
}

void guessNumber(int secretNumber) {
  stdout.write('Введіть ваше число: ');
  String? input = stdin.readLineSync();

  if (input == null || int.tryParse(input) == null) {
    print('Помилка: введіть коректне число.');
    guessNumber(secretNumber); // Повторний виклик функції
    return;
  }

  int guess = int.parse(input);

  if (guess < 1 || guess > 100) {
    print('Число має бути в діапазоні від 1 до 100.');
    guessNumber(secretNumber);
    return;
  }

  if (guess < secretNumber) {
    print('Загадане число більше.');
    guessNumber(secretNumber);
    return;
  }

  if (guess > secretNumber) {
    print('Загадане число менше.');
    guessNumber(secretNumber);
    return;
  }

  print('Вітаю! Ви вгадали число $secretNumber 🎉');
}