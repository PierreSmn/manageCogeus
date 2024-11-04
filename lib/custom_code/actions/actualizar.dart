// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:html' as html;

Future actualizar() async {
  // Add your function code here!
  // Limpiar la caché
  try {
    await html.window.caches!.keys().then((cacheNames) async {
      for (var cacheName in cacheNames) {
        var cache = await html.window.caches!.open(cacheName);
        await cache.clear();
      }
    });
    print('Caché limpiada.');
  } catch (e) {
    print('Error al limpiar la caché: $e');
  }
  // Reload all pages
  html.window.location.reload();
  html.window.onLoad.listen((event) {
    html.window.location.reload();
  });
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
