

void main(){

  Set<int> first = {1,3,5,7};
  Set<int> second = {3,5,8,10};

  //Додавання елементів в набори
  Set<int> newFirst = {};
  newFirst.addAll(first);
  newFirst.add(11);
  print('Старий пакет $first');
  print('Додано 11 до пакету: $newFirst');

  //Видалення елементів 
  Set<int> newSecond = {};
  newSecond.addAll(second);
  newSecond.remove(8);
  print('Старий пакет $second');
  print('Видаляємо 8 $newSecond');

// Обєднання наборів 
Set<int> newNew = {};
newNew = first.union(second);
print('Обєднання наборів $newNew');

// Інтерсекція наборів
Set<int> intersectionSet = first.intersection(second);
print('Інтерсекція наборів $intersectionSet');

//Різниця 
Set<int> diference = first.difference(second);
print('Різниця наборів $diference');


}