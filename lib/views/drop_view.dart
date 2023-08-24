import 'package:flutter/material.dart';
import 'postattendance_view.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Branch Selection App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: BranchSelectionScreen(),
    );
  }
}

class BranchSelectionScreen extends StatefulWidget {
  @override
  _BranchSelectionScreenState createState() => _BranchSelectionScreenState();
}

class _BranchSelectionScreenState extends State<BranchSelectionScreen> {
  String selectedBranch = 'IT';
  String selectedSubject = 'DMT';
  int selectedPeriod = 1;
  String selectedRegulation = '2023';
  String selectedSemester = '1st';

  final List<String> branchOptions = ['IT', 'DS', 'CSE'];
  final List<String> subjectOptions = ['DMT', 'DBMS', 'DAA'];
  final List<int> periodOptions = [1, 2, 3, 4, 5, 6, 7, 8];
  final List<String> regulationOptions = ['2023', '2022', '2021'];
  final List<String> semesterOptions = ['1st', '2nd', '3rd'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FACULTY PAGE'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 16), // Adjust the padding here
                  Expanded(
                    child: Text(
                      'Regulation',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: DropdownButton<String>(
                        value: selectedRegulation,
                        onChanged: (newValue) {
                          setState(() {
                            selectedRegulation = newValue!;
                          });
                        },
                        items: regulationOptions.map<DropdownMenuItem<String>>((String regulation) {
                          return DropdownMenuItem<String>(
                            value: regulation,
                            child: Text(regulation),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 16), // Adjust the padding here
                  Expanded(
                    child: Text(
                      'Semester',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: DropdownButton<String>(
                        value: selectedSemester,
                        onChanged: (newValue) {
                          setState(() {
                            selectedSemester = newValue!;
                          });
                        },
                        items: semesterOptions.map<DropdownMenuItem<String>>((String semester) {
                          return DropdownMenuItem<String>(
                            value: semester,
                            child: Text(semester),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 16), // Adjust the padding here
                  Expanded(
                    child: Text(
                      'Branch',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: DropdownButton<String>(
                        value: selectedBranch,
                        onChanged: (newValue) {
                          setState(() {
                            selectedBranch = newValue!;
                          });
                        },
                        items: branchOptions.map<DropdownMenuItem<String>>((String branch) {
                          return DropdownMenuItem<String>(
                            value: branch,
                            child: Text(branch),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 16), // Adjust the padding here
                  Expanded(
                    child: Text(
                      'Subject',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: DropdownButton<String>(
                        value: selectedSubject,
                        onChanged: (newValue) {
                          setState(() {
                            selectedSubject = newValue!;
                          });
                        },
                        items: subjectOptions.map<DropdownMenuItem<String>>((String subject) {
                          return DropdownMenuItem<String>(
                            value: subject,
                            child: Text(subject),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 16), // Adjust the padding here
                  Expanded(
                    child: Text(
                      'Period',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: DropdownButton<int>(
                        value: selectedPeriod,
                        onChanged: (newValue) {
                          setState(() {
                            selectedPeriod = newValue!;
                          });
                        },
                        items: periodOptions.map<DropdownMenuItem<int>>((int period) {
                          return DropdownMenuItem<int>(
                            value: period,
                            child: Text('Period $period'),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Perform actions based on selected options
                 // print('Selected Regulation: $selectedRegulation');
                  //print('Selected Semester: $selectedSemester');
                  //print('Selected Branch: $selectedBranch');
                  //print('Selected Subject: $selectedSubject');
                  //print('Selected Period: $selectedPeriod');
                  // You can navigate to another screen or perform other actions here
Navigator.push(context, MaterialPageRoute(builder: (context) => MyApps()),);
                },
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
