import 'dart:io';

void main(){

  Map<String,String> user = {
    'name':'Петро',
    'role': 'User',
    'age': '21'
  };

  // додавання нового значення
  print('Додаємо нове значення');

  user['sex'] = 'Man';
  print('Мапа з доданним значенням $user');

  // putIAbsent 

  user.putIfAbsent('sex', ()=>'Woman');
  print('if absent function');
  print(user);

  user.putIfAbsent('tall', ()=>'194');
  print('if absent function');
  print(user);

  // оновлення елемнту
  user['role'] = 'admin';
  print(user);

  // видалення запису з мапи
  Map<String,String> newUser = Map.from(user);
  newUser.remove('role');

  print('Видаляємо роль');
  print(newUser);
  
  // обєднання 
  Map<String,String> emptyUser = {
    'lastName': 'Petrov',
    'age': '33',
  };

  newUser.addAll(emptyUser);
  print('додаємо призвіще з іншої мапи');
  print(newUser);

  //for each

  print('for each');
  newUser.forEach((key, value) => print('$key: $value'),);

  // map to list 

  List<MapEntry<String,String>> keyList = newUser.entries.toList();
  print(keyList);
}