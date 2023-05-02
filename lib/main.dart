import 'package:app/pages/messages_page.dart';
import 'package:app/pages/student_page.dart';
import 'package:app/pages/teacher_pages.dart';
import 'package:app/repository/messages_repo.dart';
import 'package:app/repository/students_repo.dart';
import 'package:app/repository/teachers_repo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Student App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MessagesRepository messagesRepository = MessagesRepository();

  StudentsRepository studentsRepository = StudentsRepository();

  TeachersRepository teachersRepository = TeachersRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () {
                  _navigatorMessages(context);
                },
                child: Text(" ${messagesRepository.newMessageCounter} new messages")),
            TextButton(
              child: Text('${studentsRepository.students.length} students'),
              onPressed: () {
                _navigatorStudent(context);
              },
            ),
            TextButton(
              child: Text('${teachersRepository.teachers.length} teachers'),
              onPressed: () {
                _navigatorTeacher(context);
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Student Name'),
            ),
            ListTile(
              title: const Text('Students'),
              onTap: () {
                _navigatorStudent(context);
              },
            ),
            ListTile(
              title: const Text('Teachers'),
              onTap: () {
                _navigatorTeacher(context);
              },
            ),
            ListTile(
              title: const Text('Messages'),
              onTap: () {
                _navigatorMessages(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigatorStudent(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return StudentPage(studentsRepository);
      },
    ));
  }

  void _navigatorTeacher(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return TeacherPage(teachersRepository);
      },
    ));
  }

  Future<void> _navigatorMessages(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return MessagesPage(messagesRepository);
      },
    ));
    setState(() {});
  }
}
