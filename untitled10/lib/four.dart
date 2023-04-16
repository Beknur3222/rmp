import 'package:untitled10/five.dart';
import 'package:untitled10/third.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Four extends StatelessWidget {
  const Four({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("TabBar"),
              bottom: const TabBar(tabs: [
                Tab(icon: Icon(Icons.announcement),),
                Tab(icon: Icon(Icons.cake),),
                Tab(icon: Icon(Icons.cloud),),
              ]),
            ),
            drawer: Drawer(
              width: 150,
              backgroundColor: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Five()));
                      },
                      child: Text("5 page")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Third()));
                      },
                      child: Text("3 page")),
                ],
              ),
            ),

            body: const TabBarView(children: [
              Center(child: Text("Announcements"),),
              Center(child: Text("Birthdays"),),
              Center(child: Text("Data"),),
            ])
        ),
      ),
    );
  }
}