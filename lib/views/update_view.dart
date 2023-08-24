import 'package:flutter/material.dart';
import 'postattendance_view.dart';
void main() {
  runApp(MyApP());
}

class MyApP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add and Remove Roll Numbers',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: AddRemoveScreen(),
    );
  }
}

class AddRemoveScreen extends StatefulWidget {
  @override
  _AddRemoveScreenState createState() => _AddRemoveScreenState();
}

class _AddRemoveScreenState extends State<AddRemoveScreen> {
  List<int> rollNumbers = [];

  TextEditingController _addController = TextEditingController();
  TextEditingController _removeController = TextEditingController();

  void addRollNumber(int rollNo) {
    setState(() {
      rollNumbers.add(rollNo);
      _addController.clear();
    });
  }

  void removeRollNumber(int rollNo) {
    setState(() {
      rollNumbers.remove(rollNo);
      _removeController.clear();
    });
  }

  @override
  void dispose() {
    _addController.dispose();
    _removeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add and Remove Roll Numbers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ADD',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _addController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Roll Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    int rollNo = int.tryParse(_addController.text) ?? 0;
                    if (rollNo != 0) {
                      addRollNumber(rollNo);
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'REMOVE',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _removeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Roll Number to Remove',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    int rollNo = int.tryParse(_removeController.text) ?? 0;
                    if (rollNo != 0) {
                      removeRollNumber(rollNo);
                    }
                  },
                  child: Text('Remove'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                children: rollNumbers.map((rollNo) {
                  return Row(
                    children: [
                      Text('Roll No: $rollNo'),
                    ],
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Submit button action
               Navigator.push(context, MaterialPageRoute(builder: (context) => MyApps()),);   
                },
                child: Text('Go Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
