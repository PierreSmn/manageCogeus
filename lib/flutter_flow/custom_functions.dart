import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? newCustomFunction(String url) {
  // youll be given a url for a file hosted on supabase. if the last character are not equal to .mp4 you'll return false. True if it is

  if (url.endsWith('.mp4')) {
    return 'True';
  } else {
    return 'False';
  }
}
