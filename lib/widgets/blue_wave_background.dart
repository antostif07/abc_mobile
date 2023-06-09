import 'package:flutter/cupertino.dart';

class BlueWaveBackground extends StatelessWidget {
  const BlueWaveBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFFABDCFF),
          Color(0xFF0396FF),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
    );
  }

}