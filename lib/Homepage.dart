import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Completed.dart';
import 'Options.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic> responseData = []; // Store the list of questions
  int number = 0; // Track the current question index
  int? selectedOptionIndex; // Track the selected option index
  bool isAnswerCorrect = false; // Track if the selected option is correct
  int totalScore = 0;
  int WrongCount = 0;
  int CorrectCount = 0;
  List<Map<String, dynamic>> quizResults = [];// Track the total score

  Future<void> api() async {
    try {
      final response =
      await http.get(Uri.parse('https://api.jsonserve.com/Uw5CrX'));
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse.containsKey('questions') &&
            decodedResponse['questions'] != null) {
          setState(() {
            responseData = decodedResponse[
            'questions']; // Populate responseData with questions
          });
        } else {
          print('Questions key is missing or null in the API response');
        }
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    api(); // Fetch data when the widget is initialized
  }

  // Function to handle option selection
  void onOptionSelected(int index) {
    if (selectedOptionIndex != null) return; // Prevent multiple selections

    setState(() {
      selectedOptionIndex = index;
      isAnswerCorrect = responseData[number]['options'][index]['is_correct'];

      // Update the total score based on the correctness of the answer
      if (isAnswerCorrect) {
        totalScore += 4;
        CorrectCount++;
      } else {
        totalScore -= 1;
        WrongCount++;
      }
      quizResults.add({
        "question": responseData[number]['description'],
        "userAnswer": responseData[number]['options'][index]['description'],
        "correctAnswer": responseData[number]['options']
            .firstWhere(
              (option) => option['is_correct'] == true,
          orElse: () => {'description': 'No correct answer found'},
        )['description'],
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 421,
              width: 400,
              child: Stack(
                children: [
                  Container(
                    height: 240,
                    width: 390,
                    decoration: BoxDecoration(
                      color: const Color(0xffA42FC1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 22,
                    child: Container(
                      height: 180,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 5,
                            spreadRadius: 3,
                            color: const Color(0xffA42FC1).withOpacity(.4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Que ${number + 1}',
                                  style: const TextStyle(
                                      color: Colors.green, fontSize: 20),
                                ),
                                Text(
                                  'Left ${9 - number}',
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Text(
                              responseData.isNotEmpty
                                  ? responseData[number]['description']
                                  : 'No question available',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 210,
                    left: 150,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.white,
                      child: Center(
                        child:
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset("assets/img.png")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Display options for the current question
            if (responseData.isNotEmpty &&
                responseData[number]['options'] != null)
              ...responseData[number]['options']
                  .asMap()
                  .entries
                  .map<Widget>((entry) {
                int index = entry.key;
                var option = entry.value;
                return GestureDetector(
                  onTap: () => onOptionSelected(index),
                  child: Options(
                    option: option['description'],
                    isSelected: selectedOptionIndex == index,
                    isCorrect: option['is_correct'],
                  ),
                );
              }).toList(),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffA42FC1),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  if (number < 9) {
                    // 10 questions (index 0-9)
                    setState(() {
                      number++; // Move to the next question
                      selectedOptionIndex = null; // Reset selection
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Completed(
                          totalScore: totalScore,
                          wrongcount: WrongCount,
                          correctcount: CorrectCount,
                          quizResults: quizResults,// Pass the total score,
                        ),
                      ),
                    );;
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}