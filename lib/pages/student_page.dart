import 'dart:ui';

import 'package:app/repository/students_repo.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  const StudentPage(this.studentsRepository, {Key? key}) : super(key: key);
  final StudentsRepository studentsRepository;
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Students')),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 5,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "${widget.studentsRepository.students.length} Students",
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => StudentName(widget.studentsRepository.students[index], widget.studentsRepository),
              itemCount: widget.studentsRepository.students.length,
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}

class StudentName extends StatefulWidget {
  final Student student;
  final StudentsRepository studentsRepository;
  const StudentName(
    this.student,
    this.studentsRepository, {
    super.key,
  });

  @override
  State<StudentName> createState() => _StudentNameState();
}

class _StudentNameState extends State<StudentName> {
  @override
  Widget build(BuildContext context) {
    final bool _doILove = widget.studentsRepository.doILove(widget.student);
    return ListTile(
      title: Text("${widget.student.name} ${widget.student.lastName}"),
      trailing: IconButton(
        icon: Icon(_doILove ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          setState(() {
            widget.studentsRepository.like(widget.student, !_doILove);
          });
        },
      ),
    );
  }
}
