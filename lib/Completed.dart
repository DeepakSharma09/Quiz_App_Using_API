import 'package:app_quiz/ReviewScreen.dart';
import 'package:flutter/material.dart';
import 'Homepage.dart';

class Completed extends StatelessWidget {
  final int totalScore;
  final int wrongcount;
  final int correctcount;
  final List<Map<String, dynamic>> quizResults;

  const Completed({
    super.key,
    required this.totalScore,
    required this.wrongcount,
    required this.correctcount,
    required this.quizResults,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 521,
                width: MediaQuery.sizeOf(context).width,
                child: Stack(
                  children: [
                    Container(
                      height: 340,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: const Color(0xffA42FC1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: CircleAvatar(
                          radius: 85,
                          backgroundColor: Colors.white.withOpacity(0.3),
                          child: CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.white.withOpacity(0.4),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Your Score",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffA42FC1),
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: "$totalScore",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffA42FC1),
                                        ),
                                        children: const [
                                          TextSpan(
                                            text: " pt",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xffA42FC1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 60,
                      left: 22,
                      child: Container(
                        height: 190,
                        width: 360,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 3,
                              color: const Color(0xffA42FC1).withOpacity(.7),
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffA42FC1),
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "${(correctcount / (correctcount + wrongcount) * 100).toStringAsFixed(1)}%",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: Color(0xffA42FC1),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text("Accuracy"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffA42FC1),
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "${correctcount + wrongcount}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: Color(0xffA42FC1),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text("Total Attempted"),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 25),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "$correctcount",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text("Correct"),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 48.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 15,
                                                width: 15,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                "$wrongcount",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Text("Wrong"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Homepage(),
                                ),
                              );
                            },
                            child: const CircleAvatar(
                              backgroundColor: Color(0xffA42FC1),
                              radius: 45,
                              child: Center(
                                child: Icon(
                                  Icons.refresh,
                                  size: 45,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Play Again",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              print("Quiz Results: $quizResults");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReviewScreen(quizResults: quizResults),
                                ),
                              );
                            },
                            child: const CircleAvatar(
                              backgroundColor: Color(0xffA42FC7),
                              radius: 45,
                              child: Center(
                                child: Icon(
                                  Icons.visibility_rounded,
                                  size: 45,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Review Answers",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}