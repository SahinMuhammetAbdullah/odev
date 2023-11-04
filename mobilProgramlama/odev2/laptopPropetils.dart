class LaptopProperties {
  int? id;
  String? name;
  int? ram;

  LaptopProperties(this.id, this.name, this.ram);

  void display() {
    print("Laptop id: $id.");
    print("Laptop name: $name.");
    print("RAM: $ram GB.");
  }
}

void main(List<String> args) {
  var laptopList = <LaptopProperties>{
    LaptopProperties(123, "asus", 32),
    LaptopProperties(456, "acer", 16),
    LaptopProperties(789, "msi", 64)
  };
  laptopList.forEach((element) {
    element.display();
    print("----------------------");
  });
}
