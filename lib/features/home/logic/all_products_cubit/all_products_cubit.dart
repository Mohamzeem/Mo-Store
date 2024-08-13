import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/features/home/logic/all_products_cubit/all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit() : super(const AllProductsState.initial());
}
