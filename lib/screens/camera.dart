import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key, required this.title});

  final String title;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool _isCameraInitialized = false;
  bool _isFlashOn = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeCamera();
    });
  }

  Future<void> _initializeCamera() async {
    try {
      final status = await Permission.camera.request();
      if (status.isDenied) {
        return;
      }

      final cameras = await availableCameras();
      if (cameras.isEmpty) return;

      final camera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      _controller = CameraController(
        camera,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await _controller!.initialize();
      
      if (mounted) {
        setState(() => _isCameraInitialized = true);
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> _toggleFlash() async {
    if (_controller != null) {
      try {
        if (_isFlashOn) {
          await _controller!.setFlashMode(FlashMode.off);
        } else {
          await _controller!.setFlashMode(FlashMode.torch);
        }
        setState(() {
          _isFlashOn = !_isFlashOn;
        });
      } catch (e) {
        print('Error toggling flash: $e');
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF74b4d8),
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
              'Потужнометр зображення',
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
              'Наведіться на суб\'єкт та натисніть кнопку переіврки, аби зробити знімок та дізнатись інформацію про його потужність.',
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
            Stack(
              children: [
              Container(
                width: 350,
                height: 400,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.hardEdge,
                child: _isCameraInitialized
                ? CameraPreview(_controller!)
                : Center(
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.5, end: 1.0),
                    duration: const Duration(seconds: 1),
                    builder: (context, value, child) {
                    return Opacity(
                    opacity: value, 
                    child: const Text(
                      '\u2646',
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'e-UkraineHead',
                      ),
                    ),
                    );
                    },
                    onEnd: () => setState(() {}),
                  ),
                  ),
              ),
              Positioned(
                bottom: 30,
                right: 10,
                child: IconButton(
                onPressed: _toggleFlash,
                icon: _isFlashOn 
                    ? SvgPicture.asset('assets/icons/camera/bolt.svg', width: 30, height: 30, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn))
                    : SvgPicture.asset('assets/icons/camera/bolt-slash.svg', width: 30, height: 30, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                ),
              ),
              ],
            ),
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
              child: const Text(
                'Перевірити потужність',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}