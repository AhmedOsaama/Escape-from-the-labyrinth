// ignore_for_file: prefer_final_fields

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:maze/maze.dart';

enum LevelColor { yellow, red, black, cyan }

enum Language { rus, eng }

class Level{
 final int num;
 bool isLocked;
 final cols;
 final rows;
 final checkpoints;
 final startCol;
 final startRow;
 final endCol;
 final endRow;


   Level({this.isLocked = false,this.num = 1,this.endCol,this.endRow,this.startCol,this.startRow,this.checkpoints,this.cols,this.rows});

}

class Levels with ChangeNotifier{
   List<Level> _levels = [
     Level(isLocked: false, num: 1,checkpoints:  [MazeItem('images/checkpoint1.png', ImageType.asset), MazeItem('images/checkpoint2.png', ImageType.asset),],rows: 10,cols: 10,startCol: 0,startRow: 0,endCol: 9,endRow: 9),
     Level(isLocked: true, num: 2,rows: 15,cols: 15,startCol: 7,startRow: 7,checkpoints: [MazeItem('images/checkpoint1.png', ImageType.asset), MazeItem('images/checkpoint2.png', ImageType.asset),MazeItem('images/checkpoint3.png', ImageType.asset), MazeItem('images/checkpoint4.png', ImageType.asset),]),
     Level(isLocked: true, num: 3,rows: 20,cols: 20,startRow: 19,endRow: 0,endCol: 0,startCol: 19, checkpoints: [MazeItem('images/checkpoint1.png', ImageType.asset),MazeItem('images/checkpoint1.png', ImageType.asset),MazeItem('images/checkpoint4.png', ImageType.asset),MazeItem('images/checkpoint2.png', ImageType.asset),MazeItem('images/checkpoint2.png', ImageType.asset),MazeItem('images/checkpoint3.png', ImageType.asset)]),
     // Level(isLocked: true, num: 4),
  ];

  List<Level> get levels{
    return [..._levels];
  }

  Level findLevelByNum(int levelNum){
    final level = _levels.firstWhere((level) => level.num == levelNum);
    return level;
  }

  void unlockLevel(int levelNum){
    // final ind = _levels.indexWhere((level) => level.num == levelNum);
    // _levels[ind] = Level(isLocked: false,num: levelNum);
    if(levelNum > 3){
      return;
    }
    final level = findLevelByNum(levelNum);
    level.isLocked = false;
    notifyListeners();
  }
}


class Management with ChangeNotifier {
  bool sound;
  Language language;
  LevelColor color;
  Level currentLevel;

  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState playerState = PlayerState.PLAYING;
  AudioCache audioCache = AudioCache();
  String audioPath = "sounds/menu-game.mp3";

  Management(
      {this.language = Language.eng,
      this.sound = true,
      this.color = LevelColor.cyan,
        required this.currentLevel,
      // this.currentLevel = Level(isLocked: false, num: 1,checkpoints:  [MazeItem('images/checkpoint1.png', ImageType.asset), MazeItem('images/checkpoint2.png', ImageType.asset),],rows: 10,cols: 10),
      });




  void initializeAudio(){
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
        playerState = s;
        notifyListeners();
    });
    playMusic();
  }

  void playMusic() async {
    // await audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    await audioCache.loop(audioPath);
    // await audioCache.play(audioPath);
  }

  void pauseMusic() async{
    await audioPlayer.pause();
  }

  void switchSound(){
    sound = !sound;
    notifyListeners();
  }

  Color? getColor(LevelColor levelColor){
    if(levelColor == LevelColor.red){
      return const Color.fromARGB(255, 222, 92, 92);
    }
    if(levelColor == LevelColor.black){
      return const Color.fromARGB(255, 125, 125, 125);
    }
    if(levelColor == LevelColor.yellow){
      return const Color.fromARGB(255, 222, 193, 92);
    }
    if(levelColor == LevelColor.cyan){
      return const Color.fromARGB(255, 65, 182, 208);
    }
  }

  void setColor(LevelColor selectedColor){
    color = selectedColor;
    print("Color: "+ color.name);
    notifyListeners();
  }

  void switchLanguage(){
    if(language == Language.eng){
      language = Language.rus;
    }else{
      language = Language.eng;
    }
    notifyListeners();
  }
}
