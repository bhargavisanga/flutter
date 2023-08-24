import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Student {
  final int rollNo;
  final String month;

  Student({required this.rollNo, required this.month});
}

class MyApp extends StatelessWidget {
  final List<Student> studentList = [
    Student(rollNo: 101, month: 'January'),
    Student(rollNo: 102, month: 'February'),
    Student(rollNo: 103, month: 'March'),
    // Add more students here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Search',
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

  List<Student> _filteredStudents = [];

  @override
  void initState() {
    super.initState();
    _rollNoController = TextEditingController();
    _monthController = TextEditingController();
  }

  @override
  void dispose() {
    _rollNoController.dispose();
    _monthController.dispose();
    super.dispose();
  }

  void _searchStudents() {
    final int searchRollNo = int.tryParse(_rollNoController.text) ?? -1;
    final String searchMonth = _monthController.text.toLowerCase();

    setState(() {
      _filteredStudents = widget.studentList.where((student) {
        final matchesRollNo =
            searchRollNo == -1 || student.rollNo == searchRollNo;
        final matchesMonth = student.month.toLowerCase().contains(searchMonth);
        return matchesRollNo && matchesMonth;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Search'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                ''), // Replace with your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _rollNoController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Roll No',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: _monthController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Month',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _searchStudents,
                    child: Text('Search'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredStudents.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Roll No: ${_filteredStudents[index].rollNo}'),
                            Text('XX%'), // Replace with actual percentage data
                          ],
                        ),
                        Text('Month: ${_filteredStudents[index].month}'),
                        Divider(),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                'If attendance is less than 50%, consult your respected HOD\'s.',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 25,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}