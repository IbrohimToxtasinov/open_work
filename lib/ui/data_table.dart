import 'package:flutter/material.dart';

class MyDataTable extends StatelessWidget {
  const MyDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Tables",
            style: TextStyle(color: Colors.green),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            horizontalMargin: 100,
            border: TableBorder.all(color: Colors.red, width: 2),
            dataRowColor :MaterialStateProperty.all(Colors.green),
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Name',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Age',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Role',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Flag',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Sarah')),
                  DataCell(Text('19')),
                  DataCell(Text('Student')),
                  DataCell(Text('Student')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Janine')),
                  DataCell(Text('43')),
                  DataCell(Text('Professor')),
                  DataCell(Text('Professor')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('William')),
                  DataCell(Text('27')),
                  DataCell(Text('Associate Professor')),
                  DataCell(Text('Associate Professor')),
                ],
              ),
              DataRow(cells: [
                DataCell(Text("Sample")),
                DataCell(Text("Sample")),
                DataCell(Text("Sample")),
                DataCell(Text("Sample")),
              ])
            ],
          ),
        )
    );
  }
}
