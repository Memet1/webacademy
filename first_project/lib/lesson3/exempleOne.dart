
void main (){
  List<String> listAnimals = ['Кішка','Собака','Попуга','Пацюк','Миша','Змія','Корова','Кінь','Коза','Вівця'];

  //Додаємо новий елемент
  listAnimals.add('Жаба');
  print('Додаємо Жабу в список');
  print('$listAnimals');

  //Видаляємо елемент за індексом
  List<String> minusIndex = [];
  minusIndex.addAll(listAnimals);
  minusIndex.removeAt(1);
  print('Видаляємо 2-й елемент за індексом');
  print('$minusIndex');

  //Видаляємо за назвою
  List<String> minusName = List<String>.from(listAnimals);
  minusName.remove('Кінь');
  print('Видаляємо значення Кінь');
  print('$minusName');

  //перевіряємо чи містить список певний елемент
  List<String> checkList = List<String>.from(listAnimals);
  bool check = checkList.contains('Курка');
  if(check == true){
  print('Курка є в списку');
  } print('Курка в списку відсутня');

  //Сщртування списку за алфавітом

  List<String> alpha = List<String>.from(listAnimals);
  alpha.sort();
  print('Список сортований за алфавітом');
  print('$alpha');

  // Фідьтруємо з використанням where()
  List<String> whereList = List<String>.from(listAnimals);
  List<String> newWhereList = whereList.where((word)=> !word.startsWith('К')).toList();
  print('Список видаляє всі слова де перша буква К');
  print('$newWhereList');

  //Додавання списку в новий список
  List<String> newList = List<String>.from(newWhereList);
  print('Виводимо назви по одному');
  newList.forEach((e){
    print('$e');  
  });
}