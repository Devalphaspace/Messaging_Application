import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 0.1),
  ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  final CarouselController _carouselController = CarouselController();
  List<String> carousalMessageTitle = [
    'ENCRYPTED MESSAGES',
    'SUPER FAST MESSAGING',
    'BEAUTIFUL UI',
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack),
      child: Scaffold(
        backgroundColor: const Color(0xFF012E40),
        body: CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return Container(
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  SizedBox(
                    height: Get.height / 1.16,
                    width: Get.width,
                    child: Image.asset(
                      'assets/images/waterdrop_wave.png',
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      opacity: const AlwaysStoppedAnimation(0.5),
                      alignment: index == 0
                          ? Alignment.centerLeft
                          : index == 1
                              ? Alignment.center
                              : index == 2
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                    ),
                  ),
                  Positioned(
                    bottom: Get.width / 2,
                    child: index == 2
                        ? Container(
                            width: Get.width,
                            padding: const EdgeInsets.all(16),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      carousalMessageTitle[index],
                                      textAlign: TextAlign.right,
                                      textStyle: const TextStyle(
                                        fontFamily: 'world of water',
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      speed: const Duration(milliseconds: 100),
                                    ),
                                  ],
                                  totalRepeatCount: 1,
                                  pause: const Duration(milliseconds: 100),
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: true,
                                  repeatForever: false,
                                ),
                                const SizedBox(height: 12),
                                TweenAnimationBuilder(
                                  tween: Tween<double>(begin: 0, end: 1),
                                  duration: const Duration(milliseconds: 500),
                                  builder: (context, double value, child) {
                                    return AnimatedOpacity(
                                      opacity: value,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: Text(
                                        'Messages are encrypted with top notch industry level encryption algorithm. So, you don\'t need to think about privacy',
                                        textAlign: index == 0
                                            ? TextAlign.left
                                            : TextAlign.center,
                                        style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: Get.width,
                            width: Get.width,
                            child: SlideTransition(
                              position: _animation,
                              child: Image.asset(
                                index == 0
                                    ? 'assets/images/3d_padlock.png'
                                    : index == 1
                                        ? 'assets/images/3d_messaging_icon.png'
                                        : index == 2
                                            ? 'assets/images/3d_spaceship.png'
                                            : 'assets/images/3d_padlock.png',
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                  ),
                  Positioned(
                    top: Get.height * 0.06,
                    child: index == 2
                        ? SizedBox(
                            height: Get.width,
                            width: Get.width,
                            child: SlideTransition(
                              position: _animation,
                              child: Image.asset(
                                index == 0
                                    ? 'assets/images/3d_padlock.png'
                                    : index == 1
                                        ? 'assets/images/3d_messaging_icon.png'
                                        : index == 2
                                            ? 'assets/images/3d_spaceship.png'
                                            : 'assets/images/3d_padlock.png',
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          )
                        : Container(
                            width: Get.width,
                            padding: const EdgeInsets.all(16),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: index == 0
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.center,
                              crossAxisAlignment: index == 0
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.center,
                              children: [
                                AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      carousalMessageTitle[index],
                                      textAlign: index == 0
                                          ? TextAlign.left
                                          : TextAlign.center,
                                      textStyle: const TextStyle(
                                        fontFamily: 'world of water',
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      speed: const Duration(milliseconds: 100),
                                    ),
                                  ],
                                  totalRepeatCount: 1,
                                  pause: const Duration(milliseconds: 100),
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: true,
                                  repeatForever: false,
                                ),
                                const SizedBox(height: 12),
                                TweenAnimationBuilder(
                                  tween: Tween<double>(begin: 0, end: 1),
                                  duration: const Duration(milliseconds: 500),
                                  builder: (context, double value, child) {
                                    return AnimatedOpacity(
                                      opacity: value,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: Text(
                                        'Messages are encrypted with top notch industry level encryption algorithm. So, you don\'t need to think about privacy',
                                        textAlign: index == 0
                                            ? TextAlign.left
                                            : TextAlign.center,
                                        style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                  ),
                  Positioned(
                    bottom: Get.height * 0.06,
                    left: (Get.width / 2) - 50,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularPercentIndicator(
                          animation: true,
                          animateFromLastPercent: true,
                          animationDuration: 1000,
                          radius: 60,
                          percent: 0.3333 * (index + 1),
                          curve: Curves.easeInOut,
                          lineWidth: 6,
                          progressColor: Colors.white,
                          backgroundColor: Colors.white.withOpacity(0.25),
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                        FloatingActionButton.large(
                          onPressed: () {
                            setState(() {
                              _carouselController.nextPage();
                              // index = index + 1;
                              log(index.toString());
                            });
                          },
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            color: Color(0xFF012E40),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
              height: Get.height,
              viewportFraction: 1,
              scrollDirection: Axis.horizontal,
              enableInfiniteScroll: false,
              scrollPhysics: const NeverScrollableScrollPhysics()),
        ),
      ),
    );
  }
}
