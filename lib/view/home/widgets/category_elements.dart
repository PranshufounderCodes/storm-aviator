import 'dart:async';
import 'package:stormaviator/Plinko/my_game.dart';
import 'package:stormaviator/generated/assets.dart';
import 'package:stormaviator/main.dart';
import 'package:stormaviator/plinko/lesson_02/game_lesson_02.dart';
import 'package:stormaviator/res/aap_colors.dart';
import 'package:stormaviator/view/home/dragon_tiger_new/dragon_tiger.dart';
import 'package:flutter/material.dart';

class CategoryElement extends StatefulWidget {
  final int selectedCategoryIndex;
  const CategoryElement({super.key, required this.selectedCategoryIndex});

  @override
  State<CategoryElement> createState() => _CategoryElementState();
}

class _CategoryElementState extends State<CategoryElement> {
  @override
  void initState() {
    startCountdown();
    super.initState();
  }

  int countdownSeconds = 60;
  Timer? countdownTimer;
  Future<void> startCountdown() async {
    DateTime now = DateTime.now().toUtc();

    int initialSeconds = 60 - now.second; // Calculate initial remaining seconds
    setState(() {
      countdownSeconds = initialSeconds;
    });

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateUI(timer);
    });
  }

  void updateUI(Timer timer) {
    setState(() {
      if (countdownSeconds == 60) {
      } else if (countdownSeconds == 1) {
        // Do something
      }
      countdownSeconds = (countdownSeconds - 1) % 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<MiniGameModel> miniGameList = [
      MiniGameModel(
          image: Assets.categoryLimbo,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DragonTiger(gameId: '10')));
          }),
      MiniGameModel(
          image: Assets.categoryPlinko,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyGameWidget(game: PlinkoMains())),
            );
          }),

      // MiniGameModel(
      //     image: Assets.categoryHeadsTails,
      //     onTap: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context)=> HeadTailHome(gameId: "14")));
      //     }),
    ];

    // List<RummylistModel> Rummylist = [
    //   RummylistModel(
    //       image: Assets.imagesAviatorFirst,
    //       onTap: () {
    //         Navigator.push(context, MaterialPageRoute(builder: (context)=>const DragonTiger(gameId: '10')));
    //       }),
    //   RummylistModel(
    //       image: Assets.imagesAviatorFirst,
    //       onTap: () {
    //         Navigator.push(context, MaterialPageRoute(builder: (context)=>const DragonTiger(gameId: '10')));
    //       }),
    // ];
    return widget.selectedCategoryIndex == 0
        ? Image.asset(
            Assets.imagesCommingsoon,
            fit: BoxFit.cover,
            height: height * 0.25,
            width: width * 0.8,
          )
        : widget.selectedCategoryIndex == 1
            ? Image.asset(
                Assets.imagesCommingsoon,
                fit: BoxFit.cover,
                height: height * 0.25,
                width: width * 0.8,
              )
            : widget.selectedCategoryIndex == 2
                ? Image.asset(
                    Assets.imagesCommingsoon,
                    fit: BoxFit.cover,
                    height: height * 0.25,
                    width: width * 0.8,
                  )
                : Image.asset(
                    Assets.imagesCommingsoon,
                    fit: BoxFit.cover,
                    height: height * 0.25,
                    width: width * 0.8,
                  );
  }

  lotteryContainer(double height, double width, String title, String subtitle,
      VoidCallback onTap, String imagePath) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.2,
        width: width * 0.9,
        decoration: BoxDecoration(
            gradient: AppColors.primaryUnselectedGradient,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: height * 0.15,
              width: width * 0.24,
              decoration: BoxDecoration(
                  gradient: AppColors.btnBlueGradient,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(imagePath),
            ),
            SizedBox(
              height: height * 0.15,
              width: width * 0.55,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Container(
                        height: height * 0.04,
                        width: width * 0.22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: AppColors.loginSecondryGrad,
                        ),
                        child: const Center(
                          child: Text(
                            "GO →",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: height * 0.04,
                      width: width * 0.52,
                      decoration: BoxDecoration(
                          gradient: AppColors.buttonGradient,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "   The Hightest bonus in history",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 8),
                          ),
                          Container(
                            height: height * 0.03,
                            width: width * 0.005,
                            color: Colors.white,
                          ),
                          const Text(
                            "0.00",
                            style: TextStyle(
                                color: AppColors.gradientFirstColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 0.02,
                        width: width * 0.005,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: width * 0.48,
                        child: Text(
                          subtitle,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 9),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LotteryModel {
  final String titleText;
  final String subTitleText;
  final String gameText;
  final String? member;
  final String? memberImage;
  final String decorationImage;
  final String? decoImage;
  final String? winAmount;
  final VoidCallback? onTap;
  LotteryModel(
      {required this.titleText,
      required this.subTitleText,
      required this.gameText,
      this.member,
      this.memberImage,
      required this.decorationImage,
      this.decoImage,
      this.winAmount,
      this.onTap});
}

class MiniGameModel {
  final String image;
  final VoidCallback? onTap;
  MiniGameModel({required this.image, this.onTap});
}

class RummylistModel {
  final String image;
  final VoidCallback? onTap;
  RummylistModel({required this.image, this.onTap});
}
