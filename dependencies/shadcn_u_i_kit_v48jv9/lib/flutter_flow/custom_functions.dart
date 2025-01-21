import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

DateTime? setMonth(
  bool? isForward,
  DateTime? currentMonth,
) {
  // If either isForward or currentMonth is null, return null
  if (isForward == null || currentMonth == null) {
    return null;
  }

  // If isForward is true, return the first day of the next month
  if (isForward) {
    return DateTime(currentMonth.year, currentMonth.month + 1, 1);
  } else {
    // Otherwise, return the first day of the previous month
    return DateTime(currentMonth.year, currentMonth.month - 1, 1);
  }
}

List<DateTime>? returnDays(DateTime? currentMonth) {
  // If currentMonth is null, return null
  if (currentMonth == null) {
    return null;
  }

  // Return calendar days for current month, in a 7 x 5 grid beginning with Sundays
  List<DateTime> days = [];

  // Get the first day of the current month
  DateTime firstDay = DateTime(currentMonth.year, currentMonth.month, 1);

  // Find the weekday of the first day (1 - Monday, ..., 7 - Sunday)
  int startWeekday = firstDay.weekday;

  // Calculate the number of days in the current month
  int numDays = DateTime(currentMonth.year, currentMonth.month + 1, 0).day;

  // Calculate the number of days from the previous month to display
  int prevMonthDays = startWeekday == 7 ? 0 : startWeekday - 1;

  // Get the last day of the previous month
  DateTime lastDayPrevMonth =
      DateTime(currentMonth.year, currentMonth.month, 0);

  // Add the days from the previous month to the list
  for (int i = lastDayPrevMonth.day - prevMonthDays + 1;
      i <= lastDayPrevMonth.day;
      i++) {
    days.add(DateTime(lastDayPrevMonth.year, lastDayPrevMonth.month, i));
  }

  // Add the days of the current month to the list
  for (int i = 1; i <= numDays; i++) {
    days.add(DateTime(currentMonth.year, currentMonth.month, i));
  }

  // Calculate the number of days from the next month to display
  int nextMonthDays = 35 - days.length;

  // Add the days from the next month to the list
  for (int i = 1; i <= nextMonthDays; i++) {
    days.add(DateTime(currentMonth.year, currentMonth.month + 1, i));
  }

  return days;
}

bool? isCurrentMonth(
  DateTime? date,
  DateTime? month,
) {
  if (date == null || month == null) {
    return null; // Return null if either date or month is null
  }

  // If both are not null, check if date is in the same month and year as month
  return date.month == month.month && date.year == month.year;
}

List<MenuItemStruct>? filterMenuList(
  List<MenuItemStruct> items,
  String? input,
) {
  // return list of items filtered by input against name field, else if input is empty, return full list of items
  if (input != null && input.isNotEmpty) {
    return items
        .where((item) => item.name.toLowerCase().contains(input.toLowerCase()))
        .toList();
  } else {
    return items;
  }
}

DateTime? currentDay() {
  // Get the current date and time
  final now = DateTime.now();

  // Return only the year, month, and day as a DateTime object
  return now != null ? DateTime(now.year, now.month, now.day) : null;
}
