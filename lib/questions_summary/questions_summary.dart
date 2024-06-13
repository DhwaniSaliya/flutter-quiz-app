import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: CircleAvatar(
                    backgroundColor: (data['user_answer'] == data['correct_answer'])
                    ? const Color.fromARGB(255, 68, 213, 208)
                    : const Color.fromARGB(255, 233, 88, 163),
                    child: Text(((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600)
                      ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['question'] as String,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      const SizedBox(height: 5,),
                      Text(data['user_answer'] as String,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 252, 171, 236),
                      )),
                      Text(data['correct_answer'] as String,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 181, 254, 246),
                      ),),
                    ],
                  ),
                )
              ],
              ),
            );
          },
          ).toList(),
        ),
      ),
    );
  }
}