import 'package:equatable/equatable.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

abstract class AllProductsState extends Equatable {
  final List<ProductsResponseBody> list;
  final bool hasMore;
  const AllProductsState({
    required this.list,
    required this.hasMore,
  });
  @override
  List<Object> get props => [list, hasMore];
}

class AllProductsInitial extends AllProductsState {
  const AllProductsInitial({required super.list, required super.hasMore});
}

class AllProductsLoading extends AllProductsState {
  const AllProductsLoading({required super.list, required super.hasMore});
}

class AllProductsSuccess extends AllProductsState {
  const AllProductsSuccess({required super.list, required super.hasMore});
}

class AllProductsFailure extends AllProductsState {
  final String errMessage;
  const AllProductsFailure({
    required this.errMessage,
    required super.list,
    required super.hasMore,
  });
  @override
  List<Object> get props => [errMessage];
}

class AllProductsEmpty extends AllProductsState {
  final String errMessage;
  const AllProductsEmpty({
    required this.errMessage,
    required super.list,
    required super.hasMore,
  });
  @override
  List<Object> get props => [errMessage];
}
