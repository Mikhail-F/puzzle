import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then(
    (_) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.teal, brightness: Brightness.dark),
      home: const Puzzle(),
    );
  }
}

class Puzzle extends StatefulWidget {
  const Puzzle({Key? key}) : super(key: key);

  @override
  _PuzzleState createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {
  bool _isBlueDropped = false;
  bool _isRedDropped = false;
  bool _isYelloDropped = false;
  bool _isGreenDropped = false;
  String _blue = 'blue';
  String _red = 'red';
  String _yellow = 'yellow';
  String _green = 'green';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 20,
            ),
            Center(
              child: SizedBox(
                height: 314,
                width: 315,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: DragTarget<String>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return SizedBox(
                            height: 160,
                            width: 200,
                            child: Image.asset(_isBlueDropped
                                ? 'assets/images/bo.png'
                                : 'assets/images/bt.png'),
                          );
                        },
                        onWillAccept: (data) {
                          return data == _blue;
                        },
                        onAccept: (data) {
                          setState(() {
                            _isBlueDropped = true;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: DragTarget<String>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return SizedBox(
                            height: 200,
                            width: 160,
                            child: Image.asset(_isRedDropped
                                ? 'assets/images/ro.png'
                                : 'assets/images/rt.png'),
                          );
                        },
                        onWillAccept: (data) {
                          return data == _red;
                        },
                        onAccept: (data) {
                          setState(() {
                            _isRedDropped = true;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: DragTarget<String>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return SizedBox(
                            height: 200,
                            width: 160,
                            child: Image.asset(_isYelloDropped
                                ? 'assets/images/yo.png'
                                : 'assets/images/yt.png'),
                          );
                        },
                        onWillAccept: (data) {
                          return data == _yellow;
                        },
                        onAccept: (data) {
                          setState(() {
                            _isYelloDropped = true;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: DragTarget<String>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return SizedBox(
                            height: 160,
                            width: 200,
                            child: Image.asset(_isGreenDropped
                                ? 'assets/images/go.png'
                                : 'assets/images/gt.png'),
                          );
                        },
                        onWillAccept: (data) {
                          return data == _green;
                        },
                        onAccept: (data) {
                          setState(() {
                            _isGreenDropped = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            const Divider(
              thickness: 5,
              color: Colors.white,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    itemDrop(
                        isVisible: !_isRedDropped,
                        data: _red,
                        image: "assets/images/ro.png"),
                    itemDrop(
                        isVisible: !_isGreenDropped,
                        data: _green,
                        image: "assets/images/go.png"),
                    itemDrop(
                        isVisible: !_isBlueDropped,
                        data: _blue,
                        image: "assets/images/bo.png"),
                    itemDrop(
                        isVisible: !_isYelloDropped,
                        data: _yellow,
                        image: "assets/images/yo.png"),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget itemDrop(
      {required bool isVisible, required String data, required String image}) {
    return Visibility(
      visible: isVisible,
      child: Draggable<String>(
        // Data is the value this Draggable stores.
        data: data,
        feedback: SizedBox(
          height: 165.0,
          width: 165.0,
          child: Center(
            child: Image.asset(image),
          ),
        ),
        childWhenDragging: const SizedBox.shrink(),
        child: SizedBox(
          height: 165.0,
          width: 165.0,
          child: Center(
            child: Image.asset(image),
          ),
        ),
      ),
    );
  }
}
