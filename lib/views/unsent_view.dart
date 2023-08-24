import 'package:flutter/material.dart';

class MyUnsent extends StatefulWidget {
  const MyUnsent({Key? key}) : super(key: key);

  @override
  _MyUnsentState createState() => _MyUnsentState();
}

class _MyUnsentState extends State<MyUnsent> {
  // List of pending students
  List<Map<String, String>> pendingStudents = [
    {'rollNo': '101', 'phoneNumber': '123-456-7890'},
    {'rollNo': '102', 'phoneNumber': '987-654-3210'},
    // Add more students as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMS Re-Sending'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://image.shutterstock.com/image-vector/abstract-backgroundvector-illustration-260nw-665629954.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading for successful SMS
              Container(
                alignment: Alignment.center,
                child: Text(
                  'SMS Sent Successfully for n students',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Heading for pending students
              Text(
                'Pending Students are as follows',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              // List of pending students
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Roll No',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ...pendingStudents.map((student) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          student['rollNo']!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          student['phoneNumber']!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
              SizedBox(height: 20),
              // Submit button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submit logic here
                    print('Resent sms button pressed');
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.purple),
                  child: Text('Resend SMS'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}