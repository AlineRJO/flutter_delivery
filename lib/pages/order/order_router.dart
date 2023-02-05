
import 'package:dw9_delirery_app/pages/order/order_page.dart';
import 'package:dw9_delirery_app/pages/order/widget/order_controller.dart';
import 'package:dw9_delirery_app/repositories/auth/order/order_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/auth/order/order_repository.dart';

class OrderRouter {
  OrderRouter._();

  static Widget get page => MultiProvider(
    providers: [
      Provider<OrderRepository>(
        create: (context) => OrderRepositoryImpl(dio: context.read())),
      Provider(
        create: (context) => OrderController(context.read()),
      ),
    ],
    child: const OrderPage(),
  );
}