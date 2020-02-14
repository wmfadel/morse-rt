import 'package:flutter/material.dart';
import 'package:morse_rt/providers/morse_provider.dart';
import 'package:provider/provider.dart';

class BackPart extends StatefulWidget {
  @override
  _BackPartState createState() => _BackPartState();
}

class _BackPartState extends State<BackPart> {
  TextEditingController textController = TextEditingController();
  MorseProvider morseProvider;
  String message = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    morseProvider = Provider.of<MorseProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView(
        children: <Widget>[
          TextField(
            controller: textController,
            maxLines: 5,
            minLines: 1,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: 'Text to morse code',
              hintText: 'T to M',
            ),
            onSubmitted: submit,
          ),
          SizedBox(height: 20),
          Text(
            message,
            style: TextStyle(color: Colors.black, fontSize: 22),
          )
        ],
      ),
    );
  }

  submit(String text) {
    print(text);
    setState(() {
      message = morseProvider.textToCode(text);
    });
    print('message $message');
  }
}
