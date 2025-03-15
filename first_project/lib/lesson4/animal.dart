void main() {
  Animal myPet = Animal('Кішка', 3);
  myPet.checkAge();

  Animal newBornPet = Animal.newBorn('Собака');
  newBornPet.checkAge();
  
}

class Animal {
  String type;
  int age;

  Animal(this.type,this.age);
  Animal.newBorn(this.type) : age = 0;

  void checkAge(){
    if (this.age > 2){
      print('Ваш улюблинець дорослий');
    } else {
      print('Ваш улюблинець ще малий');
      }
  }

}