import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Prak4"),
              bottom: const TabBar(tabs: [
                Tab(text: 'Draggable и DragTarget'),
                Tab(text: 'GridView'),
                Tab(text: 'Table'),
                Tab(text: 'DataTable'),
              ]),
            ),

            body:  TabBarView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DragTarget(
                      builder: (context, accepted, rejected){
                        return Container(
                            width: 100, height: 200, color:Colors.purple);
                      },
                      onAccept: (data) => print(data)),
                  Container(height: 100),
                  Draggable(
                    data:"I was dragged",
                    feedback:
                    Container(width: 100,height: 200, color:Colors.blue),
                    child: Container(width:100, height: 200, color: Colors.red),
                  )
                ],
            ),
              GridView.count(
                crossAxisCount: 3,
                children: List.generate(
                  30,
                      (index) => Card(
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        ' ${index + 1}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
        Table(
          border: TableBorder.all(width: 1.0, color: Colors.green),
          children: const [
            TableRow(
              children: [
                TableCell(
                  child: Center(child: Text('FirstName',style: TextStyle(fontWeight:FontWeight.bold ),)),
                ),
                TableCell(
                  child: Center(child: Text('LastName',style: TextStyle(fontWeight:FontWeight.bold ),)),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Center(child: Text('Sattar')),
                ),

                TableCell(
                  child: Center(child: Text('Beknur')),
                ),

              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Center(child: Text('Akilbekov')),
                ),

                TableCell(
                  child: Center(child: Text('Ahat')),
                ),

              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Center(child: Text('Talibidinov')),
                ),

                TableCell(
                  child: Center(child: Text('Daryn')),
                ),

              ],
            ),
          ],
        ),
              DataTable(sortColumnIndex: 1,
                  columns: const [
                    DataColumn(label: Text("First Name")),
                    DataColumn(label: Text("Last Name")),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('Tarelka')),
                      DataCell(Text('Shatolka')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Shaurma')),
                      DataCell(Text('Doner')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Derevo')),
                      DataCell(Text('kamen')),
                    ]),
                  ]
              )
            ])
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyTabbedPage());
//
// // class MyApp extends StatelessWidget {
// //
// //   const MyApp({super.key});
// //
// //   final List<Tab> myTabs = [
// //     Tab(text: 'Draggable & DragTarget'),
// //     Tab(text: 'GridView'),
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: myTabs.length,
// //       child: Scaffold(
// //         appBar: AppBar(
// //           bottom: TabBar(
// //             tabs: myTabs,
// //           ),
// //         ),
// //         body: TabBarView(
// //           children: [
// //             // Виджет Draggable и DragTarget
// //             Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Draggable(
// //                   child: Container(
// //                     width: 100,
// //                     height: 100,
// //                     color: Colors.blue,
// //                   ),
// //                   feedback: Container(
// //                     width: 100,
// //                     height: 100,
// //                     color: Colors.red,
// //                   ),
// //                   childWhenDragging: Container(
// //                     width: 100,
// //                     height: 100,
// //                     color: Colors.green,
// //                   ),
// //                 ),
// //                 SizedBox(height: 50),
// //                 DragTarget(
// //                   builder: (BuildContext context, List<int?> candidateData, List<dynamic> rejectedData) {
// //                     return Container(
// //                       width: 100,
// //                       height: 100,
// //                       color: Colors.yellow,
// //                       child: Center(
// //                         child: Text('Drag Here'),
// //                       ),
// //                     );
// //                   },
// //                   onWillAccept: (data) => true,
// //                   onAccept: (data) {},
// //                 ),
// //               ],
// //             ),
// //
// //             // Виджет GridView
// //             GridView.count(
// //               crossAxisCount: 2,
// //               children: List.generate(
// //                 10,
// //                     (index) => Container(
// //                   color: Colors.purple,
// //                   margin: EdgeInsets.all(10),
// //                   child: Center(
// //                     child: Text(
// //                       'Item $index',
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 24,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// class MyTabbedPage extends StatefulWidget {
//   const MyTabbedPage({Key? key}) : super(key: key);
//
//   @override
//   _MyTabbedPageState createState() => _MyTabbedPageState();
// }
//
// class _MyTabbedPageState extends State<MyTabbedPage>
//     with SingleTickerProviderStateMixin {
//   late final TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tabbed Page'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(
//               text: 'Table',
//             ),
//             Tab(
//               text: 'DataTable',
//             ),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           Table(
//             border: TableBorder.all(),
//             children: [
//               TableRow(children: [
//                 TableCell(child: Text('Row 1 Column 1')),
//                 TableCell(child: Text('Row 1 Column 2')),
//                 TableCell(child: Text('Row 1 Column 3')),
//               ]),
//               TableRow(children: [
//                 TableCell(child: Text('Row 2 Column 1')),
//                 TableCell(child: Text('Row 2 Column 2')),
//                 TableCell(child: Text('Row 2 Column 3')),
//               ]),
//             ],
//           ),
//           DataTable(
//             columns: const <DataColumn>[
//               DataColumn(
//                 label: Text(
//                   'Name',
//                   style: TextStyle(fontStyle: FontStyle.italic),
//                 ),
//               ),
//               DataColumn(
//                 label: Text(
//                   'Age',
//                   style: TextStyle(fontStyle: FontStyle.italic),
//                 ),
//               ),
//               DataColumn(
//                 label: Text(
//                   'Role',
//                   style: TextStyle(fontStyle: FontStyle.italic),
//                 ),
//               ),
//             ],
//             rows: const <DataRow>[
//               DataRow(
//                 cells: <DataCell>[
//                   DataCell(Text('John')),
//                   DataCell(Text('28')),
//                   DataCell(Text('Engineer')),
//                 ],
//               ),
//               DataRow(
//                 cells: <DataCell>[
//                   DataCell(Text('Jane')),
//                   DataCell(Text('31')),
//                   DataCell(Text('Designer')),
//                 ],
//               ),
//               DataRow(
//                 cells: <DataCell>[
//                   DataCell(Text('Dave')),
//                   DataCell(Text('19')),
//                   DataCell(Text('Intern')),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );