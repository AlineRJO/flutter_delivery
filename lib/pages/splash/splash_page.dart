import 'package:dw9_delirery_app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delirery_app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

import '../../core/config/env/env.dart';

class SplashPage extends StatelessWidget {

  const SplashPage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
          //  appBar: AppBar(title: const Text('Splash'),), // TODO: BARRA LÁ ENCIMA
           body: ColoredBox(
            color: Color(0XFF140e0e),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: context.screenWidth,
                    child: Image.asset
                    (
                      'assets/images/lanche.png',
                      fit: BoxFit.cover
                    ),                  
                    ),
                ),
                Center(
                  child: Column(
                    children: [
                        SizedBox(
                          height: context.percentHeight(.30),
                        ),
                        Image.asset('assets/images/logo.png'),
                        const SizedBox(
                        height: 80,
                      ),
                      DeliveryButton(
                        width: context.percentWidth(.6),
                        height: 35,
                        label: 'ACESSAR',
                         onPressed: () {
                          Navigator.of(context).popAndPushNamed('/home');
                         }
                         )
                      ],
                    ),
                )
              ],
            ),
           ),
       );
  }
}