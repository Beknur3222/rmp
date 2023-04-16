
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            centerTitle: true,
            title: const Text('Game'),
          ),
          body: Column(
            children: <Widget>[
              Expanded(child: MyKNB()),
            ],
          ),
        ),
      ),
    );
  }
}

class MyKNB extends StatefulWidget {
  const MyKNB({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyStateKNB();
  }
}

class MyStateKNB extends State<MyKNB> {
  final List<String> images = const [
    'assets/images/stone.jpg', //0
    'assets/images/paper.jpg', //1
    'assets/images/scissors.jpg', //2
  ];
  final winners = 'assets/images/winner.jpg';
  late String image1;
  late String image2;
  late bool stopper;
  late double oc1;
  late double oc2;
  late int index1;
  late int index2;

  late Timer _timer1;
  late Timer _timer2;
  late double _rotationAngle1;
  late double _rotationAngle2;
  bool _rotationistrue = false;
  double opacityLevel = 0.0;

  String getImage1() {
    setState(() {
      index1 = Random().nextInt(3);
    });
    return images[index1];
  }

  String getImage2() {
    setState(() {
      index2 = Random().nextInt(3);
    });
    return images[index2];
  }

  @override
  void initState() {
    super.initState();
    image1 = getImage1();
    image2 = getImage2();
    stopper = false;

    oc1 = 0;
    oc2 = 0;
    _rotationAngle1 = 0;
    _rotationAngle2 = 0;
    _startRotating();
    _rotationistrue = false;
  }

  @override
  void dispose() {
    _stopRotating();
    super.dispose();
  }

  void _startRotating() {
    _timer1 = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      setState(() {
        _rotationAngle1 += 0.1;
        _rotationistrue = false;
      });
    });

    _timer2 = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      setState(() {
        _rotationAngle2 += 0.1;
        _rotationistrue = false;
      });
    });
  }

  void _stopRotating() {
    _timer1.cancel();
    _timer2.cancel();
  }

  void winner() {
    if (index1 == 0 && index2 == 1 ||
        index1 == 1 && index2 == 2 ||
        index1 == 2 && index2 == 0) {
      setState(() {
        oc1 = 1;
        oc2 = 0;
      });
    } else if (index2 == 0 && index1 == 1 ||
        index2 == 1 && index1 == 2 ||
        index2 == 2 && index1 == 0) {
      setState(() {
        oc1 = 0;
        oc2 = 1;
      });
    } else {
      setState(() {
        oc1 = 0;
        oc2 = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
      Transform.rotate(
             angle: _rotationAngle1,
             child: ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image1),
                    ),
                  ),
                ),
              ),),
              const Padding(padding: EdgeInsets.all(10)),
              AnimatedOpacity(
                opacity: oc1,
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(winners),
                        ),
                      ),
                    ),
                  ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(20)),
          Stack(
            children: [
    Transform.rotate(
             angle: _rotationAngle2,
             child: ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image2),
                    ),
                  ),
                ),
              ),),
              const Padding(padding: EdgeInsets.all(10)),
              AnimatedOpacity(
                opacity: oc2,
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(winners),
                        ),
                      ),
                    ),
                  ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 40)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    stopper = false;
                    oc2 = 0;
                    oc1 = 0;
                  });
                  Timer.periodic(const Duration(milliseconds: 1),
                      (timer) async {
                    setState(() {
                      image1 = getImage1();
                      image2 = getImage2();
                      _rotationAngle1 += 0.1;
                      _rotationAngle2 += 0.1;
                    });
                    if (stopper) {
                      _timer1.cancel();
                      _timer2.cancel();
                      timer.cancel();
                      winner();
                    }
                  });
                },
                child: const Text(
                  "START",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  shadowColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                ),
              ),
              Padding(padding: EdgeInsets.all(20)),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _timer1.cancel();
                    _timer2.cancel();
                    stopper = true;
                  });
                },
                child: const Text(
                  "STOP",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  shadowColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
