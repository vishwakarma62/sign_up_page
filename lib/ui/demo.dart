import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  int number = 0;
  List<int> table = [];

  void generateTable() {
    setState(() {
      table.clear();
      for (int i = 1; i <= 10; i++) {
        if (number > 0) {
          table.add(number * i);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController tabledata = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Enter a number to generate its multiplication table:',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                number = int.tryParse(value) ?? 0;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: generateTable,
            child: Text('Generate Table'),
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: table.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('$number x ${index + 1} = ${table[index]}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
