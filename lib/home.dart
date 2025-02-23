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

  void playAnimationF(String animationName) {
    femaleController.playAnimation(animationName: animationName);

    if (animationName == "Dance") {
      Future.delayed(Duration(milliseconds: 4333), () {
        femaleController.stopAnimation();
      });
    } else if (animationName == "Talk") {
      Future.delayed(Duration(milliseconds: 8000), () {
        femaleController.stopAnimation();
      });
    }
  }

  void playAnimationFTwo(String animationName) {
    femaleTwoController.playAnimation(animationName: animationName);

    if (animationName == "Dance.001") {
      Future.delayed(Duration(milliseconds: 5900), () {
        femaleTwoController.stopAnimation();
      });
    } else if (animationName == "Talk") {
      Future.delayed(Duration(milliseconds: 5000), () {
        femaleTwoController.stopAnimation();
      });
    }
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
                    src: 'assets/female_1.glb',
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
                    src: 'assets/female_2.glb',
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
                  onPressed: () => playAnimationF("Talk"),
                  icon: CircleAvatar(
                    child: Icon(Icons.waving_hand),
                  ),
                ),
                IconButton(
                  onPressed: () => playAnimationFTwo("Talk"),
                  icon: CircleAvatar(
                    child: Icon(Icons.waving_hand),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => playAnimationF("Dance"),
                  icon: CircleAvatar(
                    child: Icon(Icons.music_note),
                  ),
                ),
                IconButton(
                  onPressed: () => playAnimationFTwo("Dance.001"),
                  icon: CircleAvatar(
                    child: Icon(Icons.music_note),
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
