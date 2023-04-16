import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Laba 5'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const showDateTimePicker2(),

            const Divider(height: 20, thickness: 5, color: Colors.green,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [

                Tooltip4(),
              ],),
            const Divider(height: 20, thickness: 5, color: Colors.green,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SimpleDialog5(),

              ],),

            const Divider(height: 20, thickness: 5, color: Colors.green,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [

                AlertDialog6(),
              ],),

            const Divider(height: 20, thickness: 5, color: Colors.green,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SnackBar7(),
              ],),
            const Divider(height: 20, thickness: 5, color: Colors.green,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                AnimatedCrossFade9(),
              ],),
            const Divider(height: 20, thickness: 5, color: Colors.green,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                AnimatedContainer8(),
              ],),
            const Divider(height: 20, thickness: 5, color: Colors.green,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [

                AnimatedDefaultTextStyle10(),
              ],),
          ],
        ),
      ),
    );
  }
}

class showDateTimePicker2 extends StatelessWidget {
  const showDateTimePicker2({super.key});

  Future<void> _selectDate(inContext) async {
    DateTime? selectedDate = await showDatePicker(
        context: inContext,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2025));
    print(selectedDate);
  }


  Future<void> _selectTime(inContext) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: inContext,
      initialTime: TimeOfDay.now(),
    );
    print(selectedTime);
  }


  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(height: 50),
          ElevatedButton(
              child: const Text("Date Picker"),
              onPressed: () => _selectDate(context)),
          ElevatedButton(
              child: const Text("Time Picker"),
              onPressed: () => _selectTime(context))
        ]);
  }
}




class Tooltip4 extends StatelessWidget {
  const Tooltip4({super.key});



  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: 'Не нажимай на красную кнопку',
        padding: const EdgeInsets.all(20),
        showDuration: const Duration(seconds: 3),
        preferBelow: false,
        verticalOffset: 20,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Tooltip"),
            onPressed: () {}));
  }
}


class SimpleDialog5  extends StatelessWidget {
  const SimpleDialog5({super.key});


  @override
  Widget build(BuildContext inContext) {
    Future _showIt() async {
      switch (await showDialog(
          context: inContext,
          builder: (BuildContext inContext) {
            return SimpleDialog(
                title: const Text("Чего хотел Танос?"),
                children: [
                  SimpleDialogOption(
                      onPressed: () {
                        Navigator.pop(inContext, "Шаурму");
                      },
                      child: Text("Шаурму")),
                  SimpleDialogOption(
                      onPressed: () {
                        Navigator.pop(inContext, "Донер");
                      },
                      child: Text("Донер"))
                ]);
          })) {
        case "Шаурму":
          print("Шаурму");
          break;
        case "Донер":
          print("Донер");
          break;
      }
    }
    return ElevatedButton(onPressed: _showIt, child: const Text("SimpleDialog"));
  }
}



class AlertDialog6 extends StatelessWidget {
  const AlertDialog6({super.key});


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('AlertDialog'),
    );
  }
}


class SnackBar7 extends StatelessWidget {
  const SnackBar7({super.key});



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final snackBar = SnackBar(
          content: const Text('Hey! A SnackBar!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: const Text('SnackBar'),
    );
  }
}


class AnimatedCrossFade9 extends StatefulWidget {
  const AnimatedCrossFade9({super.key});

  @override
  State<AnimatedCrossFade9> createState() => _AnimatedCrossFade9();
}



class _AnimatedCrossFade9 extends State<AnimatedCrossFade9> {
  var _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedCrossFade(
            duration: const Duration(seconds: 1),
            firstChild:
            const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 80.0),
            secondChild:
            const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
            crossFadeState:
            _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
          ElevatedButton(
              child: const Text("CrossFade"),
              onPressed: () {
                setState(() {
                  _showFirst = !_showFirst;
                });
              }),
        ]);
  }
}



class AnimatedContainer8 extends StatefulWidget {
  const AnimatedContainer8({super.key});

  @override
  State<AnimatedContainer8> createState() => _AnimatedContainer8();
}



class _AnimatedContainer8 extends State<AnimatedContainer8> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: AnimatedContainer(
        width: selected ? 150.0 : 50.0,
        height: selected ? 50.0 : 150.0,
        color: selected ? Colors.cyan : Colors.limeAccent,
        alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: const FlutterLogo(size: 50),
      ),
    );
  }
}






class AnimatedDefaultTextStyle10 extends StatefulWidget {
  const AnimatedDefaultTextStyle10({super.key});

  @override
  State<AnimatedDefaultTextStyle10> createState() => _AnimatedDefaultTextStyle10();
}


class _AnimatedDefaultTextStyle10 extends State<AnimatedDefaultTextStyle10> {
  var _color = Colors.cyan;
  var _fontSize = 15.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
                duration: const Duration(seconds: 1),
                style: TextStyle(color: _color, fontSize: _fontSize),
                child: const Text("I am some text")),
            ElevatedButton(
                child: const Text("AnimatedTextStyle!"),
                onPressed: () {
                  _color = Colors.blue;
                  _fontSize = 30.0;
                  setState(() {

                  });
                }),
          ]),
    );
  }
}
