import 'package:flutter/material.dart';
import 'package:morse_rt/providers/morse_provider.dart';
import 'package:morse_rt/providers/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final MorseProvider morseProvider = MorseProvider();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => morseProvider,
      child: MaterialApp(
        title: 'Morse Real Time',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
        },
      ),
    );
  }
}
