import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'e-Ukraine',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.title});

  final String title;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFb5d7d8),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'e-UkraineHead',
            color: Colors.black,
            fontSize: 30,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
        padding: EdgeInsets.all(8.0),
          child: Text(
            '\u2646',
            style: TextStyle(fontSize: 60),
          ),
          ),
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
          height: 35,
          width: 5,
          color: const Color(0xFF0057B7),
          ),
          Container(
          height: 35,
          width: 5,
          color: const Color(0xFFFFDD00),
          ),
        ],
        ),
          const SizedBox(width: 13),
          const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Міністерство', style: TextStyle(fontFamily: 'e-UkraineHead', color: Colors.black, fontSize: 16)),
          Text('Потужності', style: TextStyle(fontFamily: 'e-UkraineHead', color: Colors.black, fontSize: 16)),
          Text('України', style: TextStyle(fontFamily: 'e-UkraineHead', color: Colors.black, fontSize: 16)),
        ],
          ),
          const SizedBox(width: 13),
        ],
      ),
    );
  }
}