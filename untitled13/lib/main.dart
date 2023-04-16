import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyListView());
  }
}

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Laba 6'),
        ),
        body: ListView(children: [
// ------------------------------------1--------------------------------
          ListTile(
            leading: const Icon(Icons.apple),
            title: const Text('1'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Nav1()),
              );
            },
          ),

// ------------------------------------2--------------------------------
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('2'),
            onLongPress: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                      title: const Text("Color?"),
                      children: [
                        SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context, "Red");
                            },
                            child: const Text("Red")),
                        SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context, "Blue");
                            },
                            child: const Text("Blue"))
                      ]);
                },
              );
            },
          ),

// ------------------------------------3--------------------------------
          ListTile(
            leading: const Icon(Icons.qr_code),
            title: const Text('3'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Nav3()),
              );
            },
            onLongPress: () {
              final snackBar = SnackBar(
                content: const Text('QR yes???'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ]));
  }
}

class Nav1 extends StatelessWidget {
  const Nav1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apple'),
      ),
      body: const Center(
        child: Icon(Icons.phone_iphone_rounded),
      ),
    );
  }
}

class Nav2 extends StatelessWidget {
  const Nav2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color'),
      ),
      body: const Center(
        child: Text('Color'),
      ),
    );
  }
}

class Nav3 extends StatelessWidget {
  const Nav3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR'),
      ),
      body: const Center(
        child: Icon(Icons.qr_code_2_sharp),
      ),
    );
  }
}
