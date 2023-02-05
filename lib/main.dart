import 'package:dw9_delirery_app/app/dw9_delivery_app.dart';
import 'package:flutter/material.dart';
import 'core/config/env/env.dart';

Future<void> main() async {
  await Env.i.load();
  
  runApp(const Dw9DeliveryApp());
}

