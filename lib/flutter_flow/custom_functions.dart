import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime getCurrentTime(DateTime currentTimeValue) {
  return currentTimeValue.subtract(const Duration(hours: 8));
}

double getAverageRating(List<CommissionRow>? commissionRows) {
// If the list is empty or null, return a default starting rating
  if (commissionRows == null || commissionRows.isEmpty) {
    return 0.0;
  }

  double total = 0.0;
  int count = 0;

  for (var row in commissionRows) {
    // Replace 'commissionRating' with your exact column field name if different
    if (row.commissionRating != null) {
      total += row.commissionRating!;
      count++;
    }
  }

  // Prevent dividing by zero if no rows had ratings
  return count > 0 ? (total / count) : 0.0;
}

List<String>? parseStringToList(String inputString) {
  if (inputString.isEmpty) {
    return [];
  }

  try {
    String cleanInput = inputString.trim();

    // Parse the clean string representation of a JSON array
    if (cleanInput.startsWith('[')) {
      List<dynamic> decoded = jsonDecode(cleanInput);
      return decoded.map((item) => item.toString().trim()).toList();
    }

    // Fallback: If Gemini ignores format rules and sends a comma/newline separated string
    return cleanInput
        .split(RegExp(r'[\n,]'))
        .map((item) => item.trim())
        .where((item) => item.isNotEmpty)
        .toList();
  } catch (e) {
    return [];
  }
}
