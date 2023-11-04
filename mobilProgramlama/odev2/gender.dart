enum Gender { Male, Female }

class Person {
  // Properties
  String? firstName;
  String? lastName;
  Gender? gender;

  // Constructor
  Person(this.firstName, this.lastName, this.gender);

  // display() method
  void display() {
    print("First Name: $firstName");
    print("Last Name: $lastName");
    print("Gender: $gender");
  }
}

void main() {
  var personList = <Person>{
    Person("abdulah", "sahin", Gender.Male),
    Person("nuri", "acar", Gender.Male),
    Person("meliha", "bircan", Gender.Female)
  };
  personList.forEach((person) {
    person.display();
    print("----------------------");
  });
}
