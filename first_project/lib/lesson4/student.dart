import 'dart:async';
void main() {
Student student1 = Student('Сергій', 'Програмування','Flutter developer');
Student student2 = Student('Кристина', 'Програмування', 'C++');
Student student3 = Student('Микола', 'Дизайн', 'Figma');

student1.displayInfo();
student2.displayInfo();
student3.displayInfo();
}

class Student {
  String name;
  String course;
  String profession;

  Student(this.name,this.course, this.profession);
  
  void displayInfo(){
    print(name);
    print(course);
    print(profession);
  }
}


