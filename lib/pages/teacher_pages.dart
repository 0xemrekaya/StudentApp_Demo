import 'package:app/repository/teachers_repo.dart';
import 'package:flutter/material.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage(this.teachersRepository, {Key? key}) : super(key: key);
  final TeachersRepository teachersRepository;
  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teachers')),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 5,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "${widget.teachersRepository.teachers.length} Teachers",
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => TeachersName(widget.teachersRepository.teachers[index], widget.teachersRepository),
              itemCount: widget.teachersRepository.teachers.length,
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}

class TeachersName extends StatelessWidget {
  final Teacher student;
  final TeachersRepository studentsRepository;
  const TeachersName(
    this.student,
    this.studentsRepository, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${student.name} ${student.lastName}"),
    );
  }
}
