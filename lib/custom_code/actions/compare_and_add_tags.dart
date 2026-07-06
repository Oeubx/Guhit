// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> compareAndAddTags(
    List<String> postTags, List<String> userTags) async {
  // We use a Set to combine the lists.
  // A Set automatically ignores any value that is already present.
  final combinedSet = {...userTags, ...postTags};

  return combinedSet.toList();
}
