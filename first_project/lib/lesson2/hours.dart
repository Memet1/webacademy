import 'dart:io';
double hoursToMinutes(double hours) {
  return hours * 60;
}

double hoursToSeconds(double hours) {
  return hours * 3600;
}

double minutesToHours(double minutes) {
  return minutes / 60;
}

double minutesToSeconds(double minutes) {
  return minutes * 60;
}
void main(){ 
print ('Привіт, я конвертер часу');
print ('1. Години в хвилини');
print ('2. Години в секунди');
print ('3. Хвилини в години');
print ('4. Хвилини в секунди');

print ('Оберіть тип конверотора відправивши номер конвертора');
String? converterInput = stdin.readLineSync();

if (converterInput == null || int.tryParse(converterInput) == null){
  print ('Введіть номер конвертора');
  return;
}

int converter = int.parse(converterInput);

if (converter <1 || converter > 4){
  print('Невірний номер конвертора. Оберіть від 1 до 4');
  return;
}

print('Введіть час для конвертації');
String? timeInput = stdin.readLineSync();

if (timeInput == null || double.tryParse(timeInput) == null) {
    print('Помилка: Введіть числове значення.');
    return;
  }

double time = double.parse(timeInput);

double result;
String unit;

if (converter == 1) {
result = hoursToMinutes(time);
unit = 'хвилин';
}else if (converter == 2){
  result = hoursToSeconds(time);
  unit = 'секунд';
}else if (converter == 3){
  result = minutesToHours(time);
  unit = 'часів';
}else {
  result = minutesToSeconds(time);
  unit = 'секунд';
}

print('Результат $result $unit');
}

