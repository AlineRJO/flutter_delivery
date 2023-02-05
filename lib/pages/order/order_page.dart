import 'package:dw9_delirery_app/core/ui/styles/text_styles.dart';
import 'package:dw9_delirery_app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delirery_app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delirery_app/dto/order_product_dto.dart';
import 'package:dw9_delirery_app/pages/order/widget/order_controller.dart';
import 'package:dw9_delirery_app/pages/order/widget/order_field.dart';
import 'package:dw9_delirery_app/pages/order/widget/order_product_title.dart';
import 'package:dw9_delirery_app/pages/order/widget/order_state.dart';
import 'package:dw9_delirery_app/pages/order/widget/payment_types_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/base_state/base_state.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  @override
  void onReady() {
    super.onReady();
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderController, OrderState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          loading: () => showLoader(),
          error: () {
            hideLoader();
            showError(state.errorMessage ?? 'Erro não informado');
          }
        );
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      'Carrinho',
                      style: context.textStyles.textTitle,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/trashRegular.png')),
                  ],
                ),
              ),
            ),
            BlocSelector<OrderController, OrderState, List<OrderProductDto>>(
              selector: (state) => state.orderProducts,
              builder: (context, orderProducts) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: orderProducts.length,
                    (context, index) {
                      final orderProduct = orderProducts[index];
                      return Column(
                        children: [
                          OrderProductTitle(
                            index: index,
                            orderProduct: orderProduct,
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total do pedido',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 16),
                      ),
                      Text(
                        r'R$ 200,00',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderField(
                    title: 'Endereço de Entrega',
                    controller: TextEditingController(),
                    validator: Validatorless.required('m'),
                    hintText: 'Digite um endereço'),
                const SizedBox(
                  height: 10,
                ),
                OrderField(
                    title: 'CPF',
                    controller: TextEditingController(),
                    validator: Validatorless.required('m'),
                    hintText: 'Digite o CPF'),
                const PaymentTypesField(),
              ]),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DeliveryButton(
                        width: double.infinity,
                        height: 48,
                        label: 'FINALIZAR',
                        onPressed: () {}),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
