import 'dart:io';

void main() {
  print('Введить номер дня тижня від 1 до 7');

  String? input = stdin.readLineSync();

  if (input != null && int.tryParse(input) != null) {
    int dayNumber = int.parse(input);

    if (dayNumber >= 1 && dayNumber <= 7) {
      String dayName;

      if (dayNumber == 1) {
        dayName = 'Понеділок';
      } else if (dayNumber == 2){
        dayName ='Вівторок';
      }else if (dayNumber == 3){
        dayName ='Середа';
      }else if (dayNumber == 4){
        dayName ='Четвер';
      }else if (dayNumber == 5){
        dayName ="П'ятниця";
      }else if (dayNumber == 6){
        dayName ='Субота';
      }else {
        dayName ='Неділя';
      }

      print ('Ви обрали $dayName');
    }else {
      main();
      print ('Оберіть день від 1 до 7');
    }
  }else {
    main ();
    print ('Введить число від 1 до 7');
  }

}