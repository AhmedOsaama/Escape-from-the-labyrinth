import 'dart:async';

import 'package:escape_from_the_labyrinth/providers/management.dart';
import 'package:escape_from_the_labyrinth/screens/finish_screen.dart';
import 'package:escape_from_the_labyrinth/widgets/button.dart';
import 'package:escape_from_the_labyrinth/widgets/gradient.dart';
import 'package:escape_from_the_labyrinth/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:maze/maze.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class MazeGame extends StatefulWidget {
  @override
  State<MazeGame> createState() => _MazeGameState();
}

class _MazeGameState extends State<MazeGame> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(); // Create instance.
    bool checkpoint = false;
    String displayTime = "";
    var numItemsCollected = 0;

  @override
  void dispose() {
    super.dispose();
    print('Dispose called');
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final management = Provider.of<Management>(context,listen: false);
    final levelsManager = Provider.of<Levels>(context,listen: false);
    // _stopWatchTimer.setPresetSecondTime(50);
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    // _stopWatchTimer.setPresetSecondTime(-10);
    // print(_stopWatchTimer.minuteTime.value);
    // _stopWatchTimer.rawTime.listen((event) {
    //   setState(() {
    //   time = "seconds: ${StopWatchTimer.getDisplayTime(event,milliSecond: false,hours: false)}";
    //
    //   });
    // });
    return Scaffold(
      body: Stack(
        children: [
          GradientBackground(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MyIconButton(
                    width: 38,
                    height: 38,
                    icon: Icons.arrow_back,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Spacer(),
                Button(width: 95, height: 46,text: management.language == Language.rus ? 'Уровень' : "Level ${management.currentLevel.num}",onPressed: (){},),
                StreamBuilder<int>(
                  stream: _stopWatchTimer.rawTime,
                  initialData: 0,
                  builder: (context, snapshot) {
                     displayTime = StopWatchTimer.getDisplayTime(snapshot.data!,hours: false,milliSecond: false);
                     // print(displayTime);
                    return Button(width: 70, height: 46,text: displayTime,onPressed: (){},);
                  }
                ),
                if(checkpoint == true)
                Image.asset('images/-10s.png'),
              ],
            ),
          ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0,bottom: 10,right: 10,left: 10),
              child: Maze(player: MazeItem('images/character.png', ImageType.asset),
                columns: management.currentLevel.cols,
                checkpoints: management.currentLevel.checkpoints,
                startCol: management.currentLevel.startCol,
                startRow: management.currentLevel.startRow,
                endCol: management.currentLevel.endCol,
                endRow: management.currentLevel.endRow,
                finish: MazeItem('images/finish2.png',ImageType.asset),
                rows: management.currentLevel.rows,
                onCheckpoint: (value){
                  setState(() {
                  checkpoint = true;
                  _stopWatchTimer.setPresetSecondTime(-10);
                  numItemsCollected++;
                  print(displayTime);
                  });
                  Future.delayed(const Duration(seconds: 3),(){
                    setState(() {
                      checkpoint = false;
                    });
                  });
                },
                wallColor: management.getColor(management.color),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                onFinish: (){
                levelsManager.unlockLevel(management.currentLevel.num + 1);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => FinishScreen(displayTime, numItemsCollected)));
                },
              ),
            ),
          ],
        ),
      ],
      ),
    );
  }
}
