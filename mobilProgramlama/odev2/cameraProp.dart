class CameraProp {
  int? id;
  String? brand;
  String? color;
  int? prize;

  int? get Id => id;
  String? get Brand => brand;
  String? get Color => color;
  int? get Prize => prize;

  set Id(int? value) {
    id = value;
  }

  set Brand(String? value) {
    brand = value;
  }

  set Color(String? value) {
    color = value;
  }

  set Prize(int? value) {
    prize = value;
  }
}

void main(List<String> args) {
  CameraProp cam1 = CameraProp();
  cam1.id = 1;
  cam1.brand = "Canon V1";
  cam1.color = "Black";
  cam1.prize = 2500;

  CameraProp cam2 = CameraProp();
  cam2.id = 2;
  cam2.brand = "Canon V2";
  cam2.color = "Red";
  cam2.prize = 6000;

  CameraProp cam3 = CameraProp();
  cam3.id = 3;
  cam3.brand = "Sony";
  cam3.color = "Black";
  cam3.prize = 6350;

  List<CameraProp> camList = [cam1, cam2, cam3];

  for (var camera in camList) {
    print("\nCamera Details:");
    print("ID: ${camera.id}");
    print("Brand: ${camera.brand}");
    print("Color: ${camera.color}");
    print("Prize: ${camera.prize}");
    print("----------------------");
  }
}
