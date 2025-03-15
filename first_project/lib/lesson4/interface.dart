void main(List<String> args) {
  Soccer soccer = Soccer();
  soccer.play();

  Basketball basketball = Basketball();
  basketball.play();
}

class Playeble {
  void play() {}
  
}

class Soccer implements Playeble {
  @override
  play(){
    print('Play soccer');
    }
  }
class Basketball {
  @override
  play(){
    print('Play bascketball');
  }
}