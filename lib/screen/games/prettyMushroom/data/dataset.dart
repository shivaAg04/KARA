import 'package:flutter/material.dart';

class Questions {
  List<String> questions = [
    "Which animal lays eggs?",
    "A male cow is called?",
    "All animals need food, air, and ____ to survive.",
    "Which one is a fur-bearing animal?",
    "What is Earth’s only natural satellite?",
    "The tree has a branch filled with green _____.",
    "What part of the body helps you move?",
    "The two holes of the nose are called?",
    "What star shines in the day and provides light?",
    "Legs have feet and arms have ___."
  ];

  List<dynamic> answers = [
    ['Dog' , 'Cat' , 'Duck' , 'Sheep'],
    ['Ox' , 'Dog' , 'Sheep' , 'Monkey'],
    ['House' , 'Water' , 'Chocolate' , 'Fruits'],
    ['Hen' , 'Crocodile' , 'Tortoise' , 'Cat'],
    ['Sun' , 'Mars' , 'Venus' , 'Moon'],
    ['Hair' , 'Root' , 'Leaves', 'Trunk'],
    ['Eyes' , 'Lungs' , 'Pancreas', 'Muscles'],
    ['Eyelids','Nostrils' , 'Nails','Hair'],
    ['Moon' , 'Venus','Mars','Sun'],
    ['Ankles','Pelvis' ,'Hands','Skull'],
  ];
  List<int> correctOption = [3,1,2,4,4,3,4,2,4,3];
}