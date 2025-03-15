void main(List<String> args) {
  Piano piano = Piano();
  Guitar guitar = Guitar();

  piano.play("Грає піаніно");
  guitar.play('Грає Гітара');
}

mixin Playing {
  void play(String sound) {
    print(sound);
  }
}

class Piano with Playing{
  void play(sound);
}

class Guitar with Playing{
  void play(sound);
}