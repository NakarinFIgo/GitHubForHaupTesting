import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'bloc_shop_event.dart';
part 'bloc_shop_state.dart';

class BlocShopBloc extends Bloc<BlocShopEvent, BlocShopState> {
  BlocShopBloc() : super(BlocShopInitial()) {
    on<FetchProduct>(_onFetchProduct);
  }

  Future<void> _onFetchProduct(FetchProduct event, Emitter<BlocShopState> emit) async {
    emit(BlocShopLoading());
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products/category/${event.category}'));
      if (response.statusCode == 200) {
        final products = json.decode(response.body)['products'];
        emit(BlocShopLoaded(products));
      } else {
        emit(BlocShopError('Failed to load products'));
      }
    } catch (e) {
      emit(BlocShopError(e.toString()));
    }
  }
}
