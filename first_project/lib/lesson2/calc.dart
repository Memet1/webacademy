import 'dart:io';

int add (int first, int second){
  return first + second;
}

int subtract (int first, int second){
  return first - second;
}

int multiply (int first, int second){
  return first * second;
}

double? divide (int first, int second){
  if (second == 0){
    print ('Ділення на 0 неможлива');
    return null;
  }
  return first / second;
}

void main(){

print('Вітаємо в калькуляторі');
print('Вас попросять ввести значення та операцію');
print('дозволені операції "+" "-" "*" "/"');

print('Введіть перше значення');
String? firstInput = stdin.readLineSync();
if (firstInput == null || int.tryParse(firstInput) == null){
  print('Ви не ввели перше значення');
  return;
}
int a = int.parse(firstInput);

print ('Введіть друге значення');
String? secondInput = stdin.readLineSync();
if (secondInput == null || int.tryParse(secondInput) == null){
  print('Ви не ввели друге значення');
  return;
}

int b = int.parse(secondInput);

print ('Введіть оператор "+","-","*","/"');
String? operation = stdin.readLineSync();

if (operation == null || !['+','-','*','/'].contains(operation)){
  print('Оберіть один з операторів');
  return;
}
double? result;

if (operation == '+'){
  result = add(a, b).toDouble();
  print('Результат $a+$b= $result');
}else if (operation == '-'){
  result = subtract(a, b).toDouble();
  print('Результат $a-$b = $result');
}else if (operation == '*'){
  result = multiply(a, b).toDouble();
  print('Результат $a*$b= $result');
}else if (operation == '/'){
  result = divide(a, b)?.toDouble();
  if (result != null){
    print('Результат $a/$b= $result');
}
}
}