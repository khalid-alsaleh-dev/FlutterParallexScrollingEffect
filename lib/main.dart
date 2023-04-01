import 'package:flutter/material.dart';
import 'package:flutter_parallex_scrolling_effect/screens/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ParallexScrollingEffect());
}

class ParallexScrollingEffect extends StatelessWidget {
  const ParallexScrollingEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1920, 1017),
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Home(),
          );
        });
  }
}
