class Animals {
  int? id;
  String? name;
  String? color;

  Animals(this.id, this.name, this.color);

  void display() {
    print("Animlas Id:  $id");
    print("Animlas Name:  $name");
    print("Animlas Colo:  $color");
  }
}

class Cat extends Animals {
  String? sound;

  Cat(super.id, super.name, super.color, this.sound);

  void display() {
    print("Animlas Id:  $id");
    print("Animlas Name:  $name");
    print("Animlas Color:  $color");
    print("Animlas Sound:  $sound");
  }
}

void main(List<String> args) {
  var myCat = Cat(1, "tekir", "gray", "miav");

  myCat.display();
}
