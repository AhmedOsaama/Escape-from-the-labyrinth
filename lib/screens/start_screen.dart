// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:escape_from_the_labyrinth/providers/management.dart';
import 'package:escape_from_the_labyrinth/screens/color_screen.dart';
import 'package:escape_from_the_labyrinth/screens/level_screen.dart';
import 'package:escape_from_the_labyrinth/screens/maze_game.dart';
import 'package:escape_from_the_labyrinth/screens/settings_screen.dart';
import 'package:escape_from_the_labyrinth/widgets/button.dart';
import 'package:escape_from_the_labyrinth/widgets/gradient.dart';
import 'package:escape_from_the_labyrinth/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  late Management management;
  late Animation<RelativeRect> rect;


@override
  void initState() {
  management = Provider.of<Management>(context,listen: false);
  management.initializeAudio();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    management.audioPlayer.stop();
    management.audioPlayer.release();
    management.audioPlayer.dispose();
    management.audioCache.clearAll();
  }

  @override
  Widget build(BuildContext context) {
  final width = 275.0;
  final height = 55.0;
  final pi = 3.14159265359;
  Provider.of<Management>(context);
    return Scaffold(
      body: Stack(
        children: [
          GradientBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MyIconButton(
                  width: 38,
                  icon: Icons.settings,
                  height: 38,
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => SettingsScreen())),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-4.0),
                  // margin: EdgeInsets.only(bottom: 50),
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Text(
                    "Escape from the Labyrinth",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 86, 86, 86),
                        fontStyle: FontStyle.normal,
                        fontFamily: "Alegreya"),
                  ),
                ),
                // Spacer(flex: 20,),
                Button(
                  text: management.language == Language.rus ? "Начать игру" : "Start game",
                  width: width,
                  height: height,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => MazeGame())),
                ),
                Button(
                  text: management.language == Language.rus ? "расцветка" : "Colors",
                  width: width,
                  height: height,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ColorScreen())),
                ),
                Button(
                  text:  management.language == Language.rus ? "Уровни" : "Levels",
                  width: width,
                  height: height,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => LevelScreen())),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
