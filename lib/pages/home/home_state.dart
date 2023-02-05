
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dw9_delirery_app/dto/order_product_dto.dart';
import 'package:dw9_delirery_app/models/product_model.dart';

part 'home_state.g.dart';
// TODO: gera um arquivo com as validacoes como se fosse um switch case dos enums - parter_match
@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDto> shoppingBag;

  const HomeState({
    required this.status,
    required this.products,
    required this.shoppingBag,
    this.errorMessage,
  });
  
  const HomeState.initial() 
  : status = HomeStateStatus.initial,
    products = const [],
    shoppingBag = const [],
    errorMessage = null;

  @override
  List<Object?> get props => [status, products, errorMessage, shoppingBag];
  

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
    List<OrderProductDto>? shoppingBag,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      shoppingBag: shoppingBag ?? this.shoppingBag,
    );
  }
}