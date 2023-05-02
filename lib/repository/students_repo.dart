class StudentsRepository {
  final List<Student> students = [Student(name: "Ali", lastName: "Ericek", age: 18, gender: "Male"), Student(name: "Ayşe", lastName: "Koç", age: 19, gender: "Female")];
  final Set<Student> liked = {};

  void like(Student student, bool doIlove) {
    if (doIlove) {
      liked.add(student);
    } else {
      liked.remove(student);
    }
  }

  bool doILove(Student student) {
    return liked.contains(student);
  }
}

class Student {
  final String name;
  final String lastName;
  final int age;
  final String gender;
  Student({required this.name, required this.lastName, required this.age, required this.gender});
}
