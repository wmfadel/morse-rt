import 'package:flippable_box/flippable_box.dart';
import 'package:flutter/material.dart';
import 'package:morse_rt/providers/morse_provider.dart';
import 'package:morse_rt/widgets/back_part.dart';
import 'package:morse_rt/widgets/front_part.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final String routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size size;

  @override
  Widget build(BuildContext context) {
    MorseProvider morseProvider = Provider.of<MorseProvider>(context);
    size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          ],
        ),
        floatingActionButton: morseProvider.isBack
            ? Container()
            : FloatingActionButton(
                onPressed: () {
                  morseProvider.addCode('#');
                },
                child: Text('Space'),
              ),
        body: GestureDetector(
          onHorizontalDragStart: (_){
             setState(() => morseProvider.isBack = !morseProvider.isBack);
          },
          child: FlippableBox(
            front: Container(
              child: FrontPart(),
              width: size.width,
              height: size.height,
            ),
            back: Container(
              width: size.width,
              height: size.height,
              child: BackPart(),
            ),
            isFlipped: morseProvider.isBack,
          ),
        ));
  }
}
