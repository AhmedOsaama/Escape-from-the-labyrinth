import 'package:escape_from_the_labyrinth/providers/management.dart';
import 'package:escape_from_the_labyrinth/widgets/button.dart';
import 'package:escape_from_the_labyrinth/widgets/gradient.dart';
import 'package:escape_from_the_labyrinth/widgets/icon_button.dart';
import 'package:escape_from_the_labyrinth/widgets/locked_level.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final management = Provider.of<Management>(context);
    final levels = Provider.of<Levels>(context);
    return Scaffold(
      body: Stack(
        children: [
          GradientBackground(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: MyIconButton(
              width: 38,
              height: 38,
              icon: Icons.arrow_back,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 20),
                  child: Text(
                    management.language == Language.rus ? 'Выберите уровень' :
                    "Choose level",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Wrap(
                  children: [
                    Button(
                      width: 70,
                      height: 70,
                      text: "1",
                      fontSize: 44.0,
                      onPressed: () {
                        management.currentLevel = levels.findLevelByNum(1);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Level 1 is Selected")));
                      },
                    ),
                    if (!levels.findLevelByNum(2).isLocked)
                      Button(
                        width: 70,
                        height: 70,
                        text: "2",
                        fontSize: 44.0,
                        onPressed: () {
                          management.currentLevel = levels.findLevelByNum(2);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Level 2 is Selected")));
                        },
                      )
                    else
                      LockedLevel(),
                    if (!levels.findLevelByNum(3).isLocked)
                      Button(
                        width: 70,
                        height: 70,
                        text: "3",
                        fontSize: 44.0,
                        onPressed: () {
                          management.currentLevel = levels.findLevelByNum(3);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Level 3 is Selected")));
                        },
                      )
                    else
                      LockedLevel(),
                    // if (!levels.findLevelByNum(4).isLocked)
                    //   Button(
                    //       width: 70,
                    //       height: 70,
                    //       text: "4",
                    //       fontSize: 44.0,
                    //       onPressed: () {
                    //         management.currentLevel = levels.findLevelByNum(4);
                    //         ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    //         ScaffoldMessenger.of(context).showSnackBar(
                    //             SnackBar(content: Text("Level 4 is Selected")));
                    //       })
                    // else
                      Column(
                        children: [
                          LockedLevel(),
                          Text(management.language == Language.rus ? 'планирование':"Being planned")
                        ],
                      ),
                  ],
                ),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
