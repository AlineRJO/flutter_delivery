
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dw9_delirery_app/dto/order_product_dto.dart';
import 'package:dw9_delirery_app/pages/order/widget/order_state.dart';
import 'package:dw9_delirery_app/repositories/auth/order/order_repository.dart';

class OrderController extends Cubit<OrderState>{
  final OrderRepository _orderRepository;

  OrderController(this._orderRepository): super(OrderState.initial());

  Future<void> load(List<OrderProductDto> products) async {
    // try {
      emit(state.copyWith(status: OrderStatus.loading));
      final paymentTypes = await _orderRepository.getAllPaymentsTypes();
      
      emit(state.copyWith(
        orderProducts: products,
        status: OrderStatus.loaded,
        paymentTypes: paymentTypes
        ),
      );
    // } catch (e, s) {
    //   log('Erro ao carregar a pagina', error: e, stackTrace: s);
    //   emit(state.copyWith(status: OrderStatus.error, errorMessage: 'Erro ao carregar pagina'));
    // }
  }

}