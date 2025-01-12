import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/camera.dart';
import 'screens/recorder.dart';
import 'screens/settings.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'e-Ukraine',
    ),
    home: const MainScreen(),
  ));
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Color> _screenColors = [
    Color(0xFFafc6e6),
    Color(0xFF74b4d8),
    Color(0xFFdec7d9),
    Color(0xFFb5d7d8),
  ];

  Color get _currentColor => _screenColors[_selectedIndex];

  static const List<Widget> _screens = [
    HomeScreen(title: '<logo3>'),
    CameraScreen(title: '<logo3>'),
    RecorderScreen(title: '<logo3>'),
    SettingsScreen(title: '<logo3>'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _currentColor,
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        indicatorColor: Colors.transparent,
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (_) => Colors.transparent,
        ),
        backgroundColor: _currentColor,
        height: 100,
        onDestinationSelected: _onItemTapped,
        selectedIndex: _selectedIndex,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/navbar/house-chimney.svg',
            height: 25,
            ),
            selectedIcon: SvgPicture.asset('assets/icons/navbar/house-chimney-selected.svg',
            height: 25,
            ),
            label: 'Головна',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/navbar/photo-capture.svg',
            height: 25,
            ),
            selectedIcon: SvgPicture.asset('assets/icons/navbar/photo-capture-selected.svg',
            height: 25,
            ),
            label: 'Камера',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/navbar/voicemail.svg',
            height: 25,
            ),
            selectedIcon: SvgPicture.asset('assets/icons/navbar/voicemail-selected.svg',
            height: 25,
            ),
            label: 'Мікрофон',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/navbar/menu-burger.svg',
            height: 25,
            ),
            selectedIcon: SvgPicture.asset(
              'assets/icons/navbar/menu-burger-selected.svg',
              height: 25,
            ),
            label: 'Інше',
          ),
        ],
      ),
    );
  }
}