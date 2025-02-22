import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Flutter3DController femaleController;
  late Flutter3DController femaleTwoController;

  @override
  void initState() {
    super.initState();
    femaleController = Flutter3DController();
    femaleTwoController = Flutter3DController();
  }

  Future<void> playAnimationF(String animationName) async {
    femaleController.playAnimation(animationName: animationName);
    await Future.delayed(Duration(seconds: 10), () {
      femaleController.stopAnimation();
    });
  }

  Future<void> playAnimationFTwo(String animationName) async {
    femaleTwoController.playAnimation(animationName: animationName);
    await Future.delayed(Duration(seconds: 10), () {
      femaleTwoController.stopAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double modelWidth = screenWidth * 0.4;
    double modelHeight = screenHeight * 0.5;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blueGrey.shade900,
              Colors.blueGrey.shade600,
              Colors.blueGrey.shade300,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: modelHeight,
                  width: modelWidth,
                  child: Flutter3DViewer(
                    key: ValueKey('female_one'),
                    src: 'assets/female.glb',
                    controller: femaleController,
                    progressBarColor: Colors.transparent,
                    onLoad: (modelAddress) {
                      femaleController.setCameraOrbit(-90, 75, 300);
                    },
                  ),
                ),
                SizedBox(
                  height: modelHeight,
                  width: modelWidth,
                  child: Flutter3DViewer(
                    key: ValueKey('female_two'),
                    src: 'assets/female_two.glb',
                    controller: femaleTwoController,
                    progressBarColor: Colors.transparent,
                    onLoad: (modelAddress) {
                      femaleTwoController.setCameraOrbit(90, 75, 300);
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => playAnimationF("F_Talking_Variations_"),
                  icon: CircleAvatar(
                    child: Icon(Icons.waving_hand),
                  ),
                ),
                IconButton(
                  onPressed: () => playAnimationFTwo("F_Talking_Variations_"),
                  icon: CircleAvatar(
                    child: Icon(Icons.waving_hand),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
