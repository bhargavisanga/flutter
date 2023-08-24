import 'package:flutter/material.dart';
import 'postsuccess_view.dart';
import 'update_view.dart';
void main() {
  runApp(MyApps());
}

class Student {
  final int rollNo;
  final String month;
  bool isPresent;

  Student({required this.rollNo, required this.month, this.isPresent = true});
}

class MyApps extends StatelessWidget {
  final List<Student> studentList = [
    Student(rollNo: 101, month: 'January'),
    Student(rollNo: 102, month: 'February'),
    Student(rollNo: 103, month: 'March'),
    // Add more students here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Attendance',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(studentList: studentList),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<Student> studentList;

  MyHomePage({required this.studentList});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _rollNoController;
  late TextEditingController _monthController;

  List<Student> _studentsWithAttendance = [];

  //Set<int> _selectedStudents = {};

  @override
  void initState() {
    super.initState();
    _rollNoController = TextEditingController();
    _monthController = TextEditingController();
    _studentsWithAttendance = List.from(widget.studentList);
  }

  @override
  void dispose() {
    _rollNoController.dispose();
    _monthController.dispose();
    super.dispose();
  }

  void _updateAttendance(int rollNo, bool isPresent) {
    setState(() {
      final studentIndex = _studentsWithAttendance
          .indexWhere((student) => student.rollNo == rollNo);
      if (studentIndex != -1) {
        _studentsWithAttendance[studentIndex].isPresent = isPresent;
      }
    });
  }

  void _submitAttendance() {
    // Process and submit attendance data
    // You can add your logic here
      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyApp()),
  );
  }

  void _updateAttendanceForAll() {
    // Update attendance for all students
    // You can add your logic here
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyApP()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Attendance'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://image.shutterstock.com/image-vector/abstract-backgroundvector-illustration-260nw-665629954.jpg'), // Add your image asset path here
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Post Attendance Here',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Roll No',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Present',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Absent', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: _studentsWithAttendance.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Roll No: ${_studentsWithAttendance[index].rollNo}'),
                        Radio<bool>(
                          value: true,
                          groupValue: _studentsWithAttendance[index].isPresent,
                          onChanged: (value) => _updateAttendance(
                              _studentsWithAttendance[index].rollNo, value!),
                        ),
                        Radio<bool>(
                          value: false,
                          groupValue: _studentsWithAttendance[index].isPresent,
                          onChanged: (value) => _updateAttendance(
                              _studentsWithAttendance[index].rollNo, value!),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _updateAttendanceForAll,
                    child: Text('Update'),
                  ),
                  ElevatedButton(
                    onPressed: _submitAttendance,
                    
                    child: Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
