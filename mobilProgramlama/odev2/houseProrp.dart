class HouseProp {
  int? id;
  String? name;
  int? prize;

  HouseProp(this.id, this.name, this.prize);

  void display() {
    print("House Id: $id");
    print("House Name: $name");
    print("House Prize: $prize");
    print("--------------------");
  }
}

void main(List<String> args) {
  HouseProp house1 = HouseProp(1, "mustakil", 150000);
  HouseProp house2 = HouseProp(2, "apartman", 750000);
  HouseProp house3 = HouseProp(3, "villa", 100000);

  List<HouseProp> houses = [];

  houses.add(house1);
  houses.add(house2);
  houses.add(house3);

  houses.forEach((house) {
    house.display();
  });
}
