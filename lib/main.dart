import 'package:audioplayers/audioplayers.dart';
import 'package:escape_from_the_labyrinth/screens/maze_game.dart';
import 'package:escape_from_the_labyrinth/providers/management.dart';
import 'package:escape_from_the_labyrinth/screens/start_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maze/maze.dart';
import 'package:provider/provider.dart';
import '';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Management(currentLevel: Level(isLocked: false, num: 1,checkpoints:  [MazeItem('images/checkpoint1.png', ImageType.asset), MazeItem('images/checkpoint2.png', ImageType.asset),],rows: 10,cols: 10,startCol: 0,endRow: 9,endCol: 9,startRow: 0))),
        ChangeNotifierProvider(create: (ctx) => Levels()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Escape from the Labyrinth',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Alegreya",
          textTheme: const TextTheme(
            headline1: TextStyle(fontWeight: FontWeight.w700,color: Color.fromARGB(255, 86, 86, 86),fontSize: 20,),
            headline2: TextStyle(fontWeight: FontWeight.w700,color: Color.fromARGB(255, 86, 86, 86),fontSize: 27,),
          )
        ),
          home: WillPopScope(child: StartScreen(), onWillPop: () async {
            dispose();
            return Future.value(true);
          }),
      ),
    );
  }
}
