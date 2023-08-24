import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Screen',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatelessWidget {
  final TextEditingController _rollNoController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _rollNoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Roll No'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _dateController,
                    decoration: InputDecoration(labelText: 'Date'),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Implement your search functionality here
                    String rollNo = _rollNoController.text;
                    String date = _dateController.text;
                    print('Roll No: $rollNo, Date: $date');
                  },
                  child: Text('Search'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Period:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                for (int period = 1; period <= 8; period++)
                  Container(
                    margin: EdgeInsets.only(right: 20), // Adjust the spacing as needed
                    child: Text(
                      period.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Subject:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                for (String subject in ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'])
                  Container(
                    margin: EdgeInsets.only(right: 20), // Adjust the spacing as needed
                    child: Text(
                      subject,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Text(
                  'Rollno:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                for (int rollno = 1; rollno <= 8; rollno++)
                  Container(
                    margin: EdgeInsets.only(right: 20), // Adjust the spacing as needed
                    child: Text(
                      rollno.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement your submit functionality here
                  // This button can be used to process the data or perform other actions
//Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
                },
                child: Text('check for CA'),
              ),
            ),
            // Add additional content here
          ],
        ),
      ),
    );
  }
}
