import 'dart:async';

import 'package:flutter/material.dart';
import 'package:morse_rt/providers/morse_provider.dart';

import 'package:flare_flutter/flare_actor.dart';
import 'package:provider/provider.dart';

class FrontPart extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPart> {
  Size size;
  String message = '';
  Duration spaceDuration = const Duration(milliseconds: 1000);
  MorseProvider morseProvider;
  Timer typeTimer;

  startTimer() {
    if (typeTimer != null) {
      typeTimer.cancel();
      typeTimer = null;
    }
    typeTimer = Timer(spaceDuration, () {
      if (message.isEmpty || message == '') {
        return;
      } else if (message[message.length - 1] != ' ') {
        morseProvider.addCode(message);
        message = '';
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    morseProvider = Provider.of<MorseProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Column(children: [
      StreamBuilder<String>(
        stream: morseProvider.codeToCharStream,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Container(
            width: size.width,
            height: size.height * 0.2,
            padding: EdgeInsets.all(10),
            child: Text(
              snapshot.data ?? 'Start typing/tapping',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          );
        },
      ),
      Expanded(
        child: GestureDetector(
          onDoubleTap: () {
            if (typeTimer != null) {
              typeTimer.cancel();
            }
            message += '-';

            startTimer();
          },
          onTap: () {
            if (typeTimer != null) {
              typeTimer.cancel();
            }
            message += '.';
            startTimer();
          },
          child: Center(
            child: FlareActor("assets/flare/empty_area.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "otp"),
          ),
        ),
      ),
    ]);
  }
}
