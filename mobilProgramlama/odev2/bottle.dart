abstract class Bottle {
  void open();
}

class CokeBottle implements Bottle {
  @override
  void open() {
    print("Coke bottle is opened");
  }
}

Bottle createCokeBottle() {
  return CokeBottle();
}

void main() {
  Bottle cokeBottle = createCokeBottle();
  cokeBottle.open();
}
