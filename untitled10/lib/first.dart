import 'package:untitled10/six.dart';
import 'package:untitled10/second.dart';
import 'package:flutter/material.dart';


class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue, title: const Text("Неважно")),
      drawer: Drawer(
          width: 150,
          backgroundColor: Colors.greenAccent,
          child: Column(children: [
            Padding(padding: EdgeInsets.only(top: 100)),
            Text("кто ты!"),
            Divider(),
            Text("Важно"),
            Divider(),
            Text("что ты!!!")
          ])),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 100)),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Second()));
                },
                child: Text("2 page")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Six()));
                },
                child: Text("6 page")),
          ],
        ),
      ),
    );
  }
}