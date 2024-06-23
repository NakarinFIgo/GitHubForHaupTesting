part of 'bloc_shop_bloc.dart';

@immutable
sealed class BlocShopEvent {}

class FetchProduct extends BlocShopEvent{
  final String category;

  FetchProduct(this.category);
}