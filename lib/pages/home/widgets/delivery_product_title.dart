
import 'package:dw9_delirery_app/core/extensions/formatter_extension.dart';
import 'package:dw9_delirery_app/core/ui/styles/colors_app.dart';
import 'package:dw9_delirery_app/core/ui/styles/text_styles.dart';
import 'package:dw9_delirery_app/dto/order_product_dto.dart';
import 'package:dw9_delirery_app/models/product_model.dart';
import 'package:dw9_delirery_app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryProductTitle extends StatelessWidget {
  final ProductModel product;
  final OrderProductDto? orderProduct;

  const DeliveryProductTitle({
    Key? key,
    required this.product,
    required this.orderProduct
  }) : super(key: key);

   @override
   Widget build(BuildContext context) {
      return InkWell(
        onTap: () async {
          final controller = context.read<HomeController>();
          final orderProductResult = await Navigator.of(context).pushNamed(
            '/productDetail',
             arguments: {
              'product': product, // TODO: passando dados para a rota
              'order': orderProduct
            });

            if(orderProductResult != null) {
              // TODO: Flutter reclama de acessar o context depois de um metodo assincrono por isso foi criado uma variavel antes
              controller.addOrUpdateBag(orderProductResult as OrderProductDto);
            }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded( // TODO: expandir a nossa coluna
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        product.name,
                        style: context.textStyles.textExtraBold.copyWith(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        product.description,
                        style: context.textStyles.textRegular.copyWith(fontSize: 12),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        product.price.currencyPTBR, // TODO: já entrega no valor certo com .toString() n estaria no formato de moeda
                        style: context.textStyles.textMedium.copyWith(
                          fontSize: 12,
                          color: context.colors.secondary
                          ),
                      ),
                    ),
                  ],
                ),
              ),
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                 image: product.image,
                 width: 100,
                 height: 100,
                 fit: BoxFit.contain // TODO: vai tentar encaixar neste tamanho
                 )
            ],        
          ),
        ),
      );
  }
}