enum Gender { Male, Female, Others }

class Person {
  String? firstName;
  String? lastName;
  Gender? gender;

  Person(this.firstName, this.lastName, this.gender);

  void display() {
    print("First Name: $firstName");
    print("Last Name: $lastName");
    print("Gender: ${gender.toString().split('.').last}");
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
