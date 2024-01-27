import 'package:flutter/material.dart';

enum leisure { sleep, food, video, games, travel }

const leisureIcons = {
  leisure.sleep: Icons.bedtime,
  leisure.food: Icons.breakfast_dining,
  leisure.games: Icons.gamepad,
  leisure.travel: Icons.flight,
  leisure.video: Icons.video_call_sharp,
};

class Todo {
  Todo(
      {required this.myLeisure,
      required this.Title,
      required this.amount,
      required this.dateCreated});
  leisure myLeisure;
  final String? Title;
  final double amount;
  final DateTime? dateCreated;
}
