// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'unsent_view.dart';
void main() {
  runApp(MyApp());
}

class Student {
  final int rollNo;
  final String phoneNo;

  Student({required this.rollNo, required this.phoneNo});
}

class MyApp extends StatelessWidget {
  final List<Student> studentList = [
    Student(rollNo: 101, phoneNo: '123-456-7890'),
    Student(rollNo: 102, phoneNo: '987-654-3210'),
    Student(rollNo: 103, phoneNo: '555-555-5555'),
    // Add more students here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student SMS',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(studentList: studentList),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Student> studentList;

  MyHomePage({required this.studentList});

  @override
  Widget build(BuildContext context) {
    var container = Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://image.shutterstock.com/image-vector/abstract-backgroundvector-illustration-260nw-665629954.jpg'), // Replace with your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Roll No',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    'Phone No',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: studentList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Roll No: ${studentList[index].rollNo}'),
                        Text(studentList[index].phoneNo),
                      ],
                    );
                  },
                ),
              ),
              Spacer(), // Adds space to push the button to the center
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Implement sending SMS logic here
                    // This is just a placeholder
Navigator.push(context, MaterialPageRoute(builder: (context) => MyUnsent()),);
                  },  
                  child: Text('Send SMS'),
                ),
              ),
            ],
          ),
        ),
      );
    return Scaffold(
      appBar: AppBar(
        title: Text('Send SMS to Students'),
      ),
      body: container,
    );
  }
}