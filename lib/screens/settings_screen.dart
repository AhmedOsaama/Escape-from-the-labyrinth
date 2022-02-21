import 'package:audioplayers/audioplayers.dart';
import 'package:escape_from_the_labyrinth/providers/management.dart';
import 'package:escape_from_the_labyrinth/widgets/gradient.dart';
import 'package:escape_from_the_labyrinth/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {





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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    management.language == Language.rus ? 'Звук' :
                    "Sound:",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  // SizedBox(width: 10,),
                  FlatButton(
                    onPressed: () {
                      management.switchSound();
                      management.playerState == PlayerState.PAUSED ? management.playMusic() : management.pauseMusic();
                    },
                    child: management.sound
                        ? Image.asset('images/sound-on.png')
                        : Image.asset('images/sound-off.png'),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    management.language == Language.rus ? 'Язык' :
                    "Language:",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  FlatButton(
                    onPressed: () {
                      management.switchLanguage();
                    },
                    child: management.language == Language.eng
                        ? Image.asset('images/eng.png')
                        : Image.asset('images/rus2.png',width: 45,height: 30,),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  // Provider.of<Management>(context, listen: false).language ==
                  //         Language.eng
                  //     ? Image.asset('images/eng.png')
                  //     : Image.asset(
                  //         'images/rus2.png',
                  //         width: 45,
                  //         height: 30,
                  //       )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
