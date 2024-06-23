part of 'bloc_shop_bloc.dart';

@immutable
sealed class BlocShopState {}

class BlocShopInitial extends BlocShopState {}

class BlocShopLoading extends BlocShopState {}

class BlocShopLoaded extends BlocShopState {
  final List<dynamic> products;

  BlocShopLoaded(this.products);
}

class BlocShopError extends BlocShopState{
  final String errorMessage;

  BlocShopError(this.errorMessage);
}
