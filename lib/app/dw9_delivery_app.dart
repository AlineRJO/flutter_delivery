import 'package:dw9_delirery_app/core/provider/application_binding.dart';
import 'package:dw9_delirery_app/pages/auth/login/login_router.dart';
import 'package:dw9_delirery_app/pages/product_detail/product_detail_router.dart';
import 'package:dw9_delirery_app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

import '../core/ui/theme/theme_config.dart';
import '../pages/auth/register/register_router.dart';
import '../pages/home/home_router.dart';
import '../pages/order/order_router.dart';


class Dw9DeliveryApp extends StatelessWidget {
// TODO: configuracao do projeto, estrutura inicial + rotas
  const Dw9DeliveryApp({ super.key });

   @override
   Widget build(BuildContext context) {
       return ApplicationBinding(
         child: MaterialApp(
          title: 'Delivery App',
          theme: ThemeConfig.theme,
          routes: {
            '/': (context) => const SplashPage(), // TODO: ROTA PRINCIPAL
            '/home': (context) => HomeRouter.page,
            '/productDetail': (context) => ProductDetailRouter.page,
            '/auth/login': (context) => LoginRouter.page,
            '/auth/register': (context) => RegisterRouter.page,
            '/order': (context) => OrderRouter.page,
          }
         ),
       );
  }
}