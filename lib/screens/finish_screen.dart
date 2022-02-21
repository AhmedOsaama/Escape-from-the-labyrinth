import 'package:escape_from_the_labyrinth/providers/management.dart';
import 'package:escape_from_the_labyrinth/screens/maze_game.dart';
import 'package:escape_from_the_labyrinth/widgets/button.dart';
import 'package:escape_from_the_labyrinth/widgets/gradient.dart';
import 'package:escape_from_the_labyrinth/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinishScreen extends StatelessWidget {
  final finishTime;
  final numItemsCollected;
  FinishScreen(this.finishTime,this.numItemsCollected);
  @override
  Widget build(BuildContext context) {
    final management = Provider.of<Management>(context);
    final levelsManager = Provider.of<Levels>(context);
    final bool engLanguage = management.language == Language.eng;
    final finishText = engLanguage ? "Great!\n$finishTime\nNumber of items collected: $numItemsCollected"
        : "Здорово!\n$finishTime\nКоличество собранных предметов: $numItemsCollected";
    return Scaffold(
      body: Stack(
        children: [
          GradientBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Button(width: 285, height: 201,text: finishText,fontSize: 30.0,onPressed: (){},),
                  if(management.currentLevel.num < 3)
                  Button(width: 275, height: 55,text: engLanguage ? "Next Level" : 'Следующий уровень',onPressed: () {
                    management.currentLevel = levelsManager.findLevelByNum(management.currentLevel.num + 1);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => MazeGame()));
                  },),
                  Button(width: 275, height: 55,text: engLanguage ? "Main menu" : 'Главное меню',onPressed: () => Navigator.of(context).pop(),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
