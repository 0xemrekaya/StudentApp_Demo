class TeachersRepository {
  List<Teacher> teachers = [Teacher(name: "Faruk", lastName: "Yılmaz", age: 25, gender: "Male"), Teacher(name: "Emre", lastName: "Kaya", age: 28, gender: "Male")];
}

class Teacher {
  final String name;
  final String lastName;
  final int age;
  final String gender;
  Teacher({required this.name, required this.lastName, required this.age, required this.gender});
}
