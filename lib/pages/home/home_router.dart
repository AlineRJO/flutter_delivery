import 'package:dw9_delirery_app/pages/home/home_controller.dart';
import 'package:dw9_delirery_app/pages/home/home_page.dart';
import 'package:dw9_delirery_app/repositories/products/products_repository.dart';
import 'package:dw9_delirery_app/repositories/products/products_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// TODO: como se fosse um modulo de rotas
class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
    providers: [
      Provider<ProductsRepository>(
        create: (context) => ProductsRepositoryImpl(
          dio: context.read(),
          ),
        ),
        Provider(create: ((context) => HomeController(context.read())),
        ),
    ],
    child: const HomePage(),
  );
}