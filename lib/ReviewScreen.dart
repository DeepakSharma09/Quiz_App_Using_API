import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  final List<Map<String, dynamic>> quizResults;

  const ReviewScreen({super.key, required this.quizResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Answers"),
        backgroundColor: const Color(0xffA42FC1),
      ),
      body: quizResults.isEmpty
          ? const Center(
        child: Text(
          "No answers to review!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: quizResults.length,
        itemBuilder: (context, index) {
          final questionData = quizResults[index];
          final userAnswer = questionData['userAnswer'] ?? 'No answer';
          final correctAnswer = questionData['correctAnswer'] ?? 'No correct answer';
          bool isCorrect = userAnswer == correctAnswer;

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Q${index + 1}: ${questionData['question'] ?? 'No question'}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Your Answer: $userAnswer",
                    style: TextStyle(
                      fontSize: 14,
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                  ),
                  Text(
                    "Correct Answer: $correctAnswer",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        isCorrect ? Icons.check_circle : Icons.cancel,
                        color: isCorrect ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        isCorrect ? "Correct" : "Wrong",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isCorrect ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}