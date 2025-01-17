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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFafc6e6),
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
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                'Потужнометр середовища',
                style: TextStyle(
                  fontFamily: 'e-UkraineHead',
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                  child: SizedBox(
                  width: 360,
                  child: Text(
                'Натисніть кнопку переіврки, аби дізнатись інформацію про потужність навколишнього середовища, в якому ви перебуваєте.',
                style: TextStyle(
                  fontFamily: 'e-Ukraine',
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                ),),
              ),
              const SizedBox(height: 20),
              const Text(
                'Останнє вимірювання: 0 Вт',
                style: TextStyle(
                  fontFamily: 'e-Ukraine',
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  minimumSize: const Size(230, 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: () {},
                child: const Text('Перевірити потужність',
                  style: TextStyle(
                  fontWeight: FontWeight.w300,
                  ),
                )
                ),
            ],
          ),
      ),
    );
  }
}