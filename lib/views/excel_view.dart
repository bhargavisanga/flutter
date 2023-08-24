import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: ExcelSheetPage(),
    );
  }
}

class ExcelSheetPage extends StatefulWidget {
  @override
  _ExcelSheetPageState createState() => _ExcelSheetPageState();
}

class _ExcelSheetPageState extends State<ExcelSheetPage> {
  List<List<String>> data = [
    ['Header 1', 'Header 2', 'Header 3'],
    ['Data 1', 'Data 2', 'Data 3'],
  ];

  void addRow() {
    setState(() {
      data.add(['', '', '']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excel Sheet'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    for (var item in data[index])
                      Expanded(
                        child: TextFormField(
                          initialValue: item,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            data[index][data[index].indexOf(item)] = value;
                          },
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: addRow,
            child: Text('Add Row'),
          ),
        ],
      ),
    );
  }
}
