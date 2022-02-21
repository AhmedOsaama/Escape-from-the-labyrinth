import 'package:escape_from_the_labyrinth/providers/management.dart';
import 'package:escape_from_the_labyrinth/widgets/gradient.dart';
import 'package:escape_from_the_labyrinth/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorScreen extends StatefulWidget {
  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  @override
  Widget build(BuildContext context) {
    final management = Provider.of<Management>(context);
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
                Text( management.language == Language.rus ? 'Выберите цвет' : "Choose Color",style: Theme.of(context).textTheme.headline2,),
                const SizedBox(height: 20,),
                if(management.color == LevelColor.red)
                  Image.asset('images/maze-colors/red.png'),
                if(management.color == LevelColor.cyan)
                  Image.asset('images/maze-colors/cyan.png'),
                if(management.color == LevelColor.yellow)
                  Image.asset('images/maze-colors/yellow.png'),
                if(management.color == LevelColor.black)
                  Image.asset('images/maze-colors/black.png'),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   if(management.color == LevelColor.black) MyIconButton(width: 55, height: 55,color: const Color.fromARGB(255, 125, 125, 125),selected: true) else MyIconButton(width: 55, height: 55,color: const Color.fromARGB(255, 125, 125, 125),onPressed: () => management.setColor(LevelColor.black),),
                    if(management.color == LevelColor.yellow) MyIconButton(width: 55, height: 55,color: const Color.fromARGB(255, 222, 193, 92),selected: true,) else  MyIconButton(width: 55, height: 55,color: const Color.fromARGB(255, 222, 193, 92),onPressed: () => management.setColor(LevelColor.yellow),),
                    if(management.color == LevelColor.red) MyIconButton(width: 55, height: 55,color: const Color.fromARGB(255, 222, 92, 92),selected: true,) else MyIconButton(width: 55, height: 55,color: const Color.fromARGB(255, 222, 92, 92),onPressed: () => management.setColor(LevelColor.red)),
                    if(management.color == LevelColor.cyan) MyIconButton(width: 55, height: 55,color: const Color.fromARGB(255, 65, 182, 208),selected: true,) else MyIconButton(width: 55, height: 55,color: const Color.fromARGB(255, 65, 182, 208),onPressed: () => management.setColor(LevelColor.cyan)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
