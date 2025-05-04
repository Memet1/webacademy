
import 'package:equatable/equatable.dart';
void main(List<String> args) {
  final Rectangle2 rectangle1 = Rectangle2(200, 300);
  final Rectangle2 rectanle2 = Rectangle2(100, 300);  
  print('Equtable перевірка ${rectangle1 == rectanle2}');
  
  Rectangle rectangle3 = Rectangle(50, 50);
  Rectangle rectangle4 = Rectangle(50, 50);
  print(rectangle3);
  print(rectangle3 == rectangle4);

}

class Rectangle {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  

  @override
  String toString() {
    // TODO: implement toString
    return 'Висота елемента $height, ширина елемента $width';
  }
  @override
  bool operator  == (Object other) => 
      identical(this, other) || 
      other is Rectangle && 
      runtimeType == other.runtimeType &&
      width == other.width &&
      height == other.height;
  
  @override
  int get hashcode => width.hashCode ^ height.hashCode;

}

class Rectangle2 extends Equatable{
  final double width;
  final double height;

  const Rectangle2(
    this.width,
    this.height
  );

  @override
  List<Object> get props => [height,width];
  }