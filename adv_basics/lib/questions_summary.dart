import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: (data['is_correct'] as bool)
                        ? const Color.fromARGB(255, 241, 102, 216)
                        : const Color.fromARGB(255, 155, 154, 243),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  transformAlignment: Alignment.topLeft,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Your answer: ${data['user_answer']}',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 225, 107, 189),
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Correct answer: ${data['correct_answer']}',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 185, 165, 251),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
