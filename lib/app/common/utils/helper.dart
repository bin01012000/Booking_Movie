import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StringHelpers {
  static String convertNull(String? a) {
    if (a == null || a == '') {
      return 'N/A';
    } else {
      return a;
    }
  }

  static String convertStatusReservation(String? a) {
    if (a == null || a == '') {
      return 'N/A';
    } else {
      if (a == 'PENDING') {
        a = 'Pending Approval';
      }
      return a.replaceAll('_', ' ').toTitleCase();
    }
  }

  static String formatDate(String date) {
    if (date != '') {
      DateTime tempDate = DateTime.parse(date);
      String dateConverted = DateFormat("MM-dd-yyyy").format(tempDate);
      return dateConverted;
    }
    return 'N/A';
  }

  static String formatName(String? firstName, lastName) {
    if (firstName == null || firstName == '') {
      firstName = 'N/A';
    }
    if (lastName == null || lastName == '') {
      lastName = 'N/A';
    }
    return '$firstName $lastName';
  }

  static DateTime formatDateTimeToUtc(String time) {
    var dateTime = DateTime.parse(time).toLocal();
    return dateTime;
  }

  static String formatLocalToUtc(String time) {
    var dateTime = DateTime.parse(time).toUtc();
    String timeFormated = '${DateFormat.Hm().format(dateTime)}:00';
    return timeFormated;
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber == '') {
      return 'N/A';
    }
    return "(" +
        phoneNumber.toString().substring(0, 3) +
        ") " +
        phoneNumber.toString().substring(3, 6) +
        "-" +
        phoneNumber.toString().substring(6, phoneNumber.toString().length);
  }

  static Color convertColorStatus(String? status) {
    Color color = const Color(0xFF53D1B6);
    if (status == 'SCHEDULED') {
      color = const Color(0xFF40BFFF);
    } else if (status == 'PENDING') {
      color = const Color(0xFFEEB210);
    } else if (status == 'CANCELLED') {
      color = const Color(0xFFF5222D);
    } else if (status == 'IN_PROCESS') {
      color = const Color(0xFF5C61F4);
    } else if (status == 'REJECTED') {
      color = const Color(0xFFF5222D);
    }
    return color;
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
