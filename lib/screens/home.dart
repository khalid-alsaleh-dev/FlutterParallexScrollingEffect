import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_parallex_scrolling_effect/utils/custom_colors.dart';
import 'package:flutter_parallex_scrolling_effect/utils/image_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController controller = ScrollController();
  late final ScrollAdapter foregroundAdapter;
  late final ScrollAdapter textAdapter;
  late final ScrollAdapter cloudAdapter;
  @override
  void initState() {
    foregroundAdapter = ScrollAdapter(controller);
    textAdapter = ScrollAdapter(controller);
    cloudAdapter = ScrollAdapter(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Container(
         color: CustomColors.background,
          height: 1.2 * 1.sh,
          width: 1.sw,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                ImageAssets.background,
                width: 1.sw,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                top: 800.w,
                child: Container(
                  color: CustomColors.background,
                  height: 1.2 * 1.sh,
                  width: 1.sw,
                ),
              ),
              Positioned(
                  top: 450.w,
                  left: 700.w,
                  child: SimpleShadow(
                    color: CustomColors.textShadow,
                    opacity: 1,
                    sigma: 15,
                    offset: const Offset(1, 3),
                    child: Text(
                      'Parallex',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 90.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ).animate(adapter: textAdapter).moveX(end: 500.w).fadeOut()),
              Positioned(
                  top: 160.w,
                  right: 100.w,
                  child: Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      ImageAssets.cloud,
                      width: 600.w,
                      height: 250.w,
                    )
                        .animate(adapter: cloudAdapter)
                        .moveY(end: 100.w)
                        .fadeOut(),
                  )),
              Positioned(
                top: 350.w,
                child: Image.asset(
                  ImageAssets.foreground,
                  width: 1.sw,
                ).animate(adapter: foregroundAdapter).moveY(end: -200.w),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
