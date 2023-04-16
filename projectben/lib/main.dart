import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: ProFirebaseOptions.current,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Control(),
    );
  }
}

class Control extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return ControlState();
  }
}

class ControlState extends State<Control>{
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase!"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            databaseReference.child('message').set('Привет, Андрей');
          },
          child: Text('Загрузить'),
        ),
      ),
    );
  }
}
