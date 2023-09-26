// import 'package:flutter/material.dart';

class MyHomePage  {
  // const MyHomePage({super.key});

  // This function calculates the days left until the end of the year
  int getDaysLeft() {
    final currentDate = DateTime.now();
    final endOfYear = DateTime(currentDate.year, 12, 31);
    return endOfYear.difference(currentDate).inDays;
  }
}
