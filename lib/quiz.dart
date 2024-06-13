import 'package:first_app/data/questions.dart';
import 'package:first_app/questions_screen.dart';
import 'package:first_app/results_screen.dart';
import 'package:first_app/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers =[];
  Widget? activeScreen;

  _QuizState() : activeScreen = StartScreen(() {});

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer,);
      });
  }

  @override
  void initState(){
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen(){
    setState(() {
      activeScreen= QuestionsScreen(onSelectAnswer: chooseAnswer,);
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length== questions.length){
      setState(() {
        
        activeScreen = ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz,);
      });
    }
  }

  @override
  Widget build(context){
    return MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 26, 35, 126),
              Color.fromARGB(255, 30, 136, 229),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: activeScreen,
      ),
    ),
  );
  }
}