import 'package:untitled10/six.dart';
import 'package:untitled10/four.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Five extends StatefulWidget {
  const Five({Key? key}) : super(key: key);

  @override
  _Five createState() => _Five();

}

class _Five extends State {
  var _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Flutter Playground',),
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
                          MaterialPageRoute(builder: (context) => const Six()));
                    },
                    child: Text("6 page")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Four()));
                    },
                    child: Text("4 page")),
              ],
            ),
          ),

          body: Stepper(
              type: StepperType.vertical,
              currentStep: _currentStep,
              onStepContinue: _currentStep < 2
                  ?() => setState(() => _currentStep += 1)
                  :null,
              onStepCancel: _currentStep > 0
                  ?() => setState(() => _currentStep -= 1)
                  :null,
              steps: const [
                Step(
                    title: Text("Get Ready"),
                    isActive: true,
                    content: Text("Let's begin...")),
                Step(
                    title: Text("Get Ready"),
                    isActive: true,
                    content: Text("Let's begin...")),
                Step(
                    title: Text("Get Ready"),
                    isActive: true,
                    content: Text("Let's begin...")),
              ]),
        )
    );
  }
}