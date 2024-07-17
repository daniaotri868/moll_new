part of 'auth_bloc.dart';

@immutable
class HomeEvent {}

class DepartmentProductEvent extends HomeEvent {
  final DetailsParams detailsParams;

  DepartmentProductEvent({required this.detailsParams,});
}

class ChangeFavEvent extends HomeEvent {
  final ChangeFavParams changeFavParams;

  ChangeFavEvent({required this.changeFavParams,});
}
class GetAllFavEvent extends HomeEvent {
  final DetailsParams detailsParams;

  GetAllFavEvent({required this.detailsParams,});
}

class DepartmentDetailsEvent extends HomeEvent {
  final DetailsParams detailsParams;

  DepartmentDetailsEvent({required this.detailsParams,});
}

class AllDepartmentEvent extends HomeEvent {
  final DetailsParams detailsParams;

  AllDepartmentEvent({required this.detailsParams,});
}
class AllMollEvent extends HomeEvent {
  final MollParams detailsParams;

  AllMollEvent({required this.detailsParams,});
}

class GetHomeEvent extends HomeEvent {
  final MollParams detailsParams;

  GetHomeEvent({required this.detailsParams,});
}

class SaveProductsToPosEvent extends HomeEvent {
  final String ?id;
  final String ?name;
  final int ?qun;
  final int? offer;
  final int ?price;
  final int ?max;

   SaveProductsToPosEvent({
  this.id,
  this.name,
  this.qun,
  this.offer,
  this.price,
  this.max,
  });
}
class updateProductToOrderInPosEvent extends HomeEvent {
  final int index;
  final int count;

   updateProductToOrderInPosEvent({
    required this.count,
    required this.index,
  });
}

class DeleteProductsToPosEvent extends HomeEvent {
  final ProductCart productItem;

   DeleteProductsToPosEvent({
    required this.productItem,
  });
}
class MollDetailsEvent extends HomeEvent {
  final DetailsParams detailsParams;

  MollDetailsEvent({required this.detailsParams,});
}

class ProductDetailsEvent extends HomeEvent {
  final DetailsParams detailsParams;

  ProductDetailsEvent({required this.detailsParams,});
}

class CreateOrderEvent extends HomeEvent {
  final CreateOrderParams createOrderParams;
  final Function(OrderDetailsModel ) data;

  CreateOrderEvent({required this.createOrderParams,required this.data});
}
class ConfirmOrderEvent extends HomeEvent {
  final ConfirmOrderParams confirmOrderParams;
  final VoidCallback onSuccess;


  ConfirmOrderEvent({required this.confirmOrderParams,required this.onSuccess});
}
class RateOrderEvent extends HomeEvent {
  final RateOrderParams confirmOrderParams;
  final VoidCallback onSuccess;


  RateOrderEvent({required this.confirmOrderParams,required this.onSuccess});
}

class GetOrderEvent extends HomeEvent {
  final GetOrderParams getOrderParams;

  GetOrderEvent({required this.getOrderParams,});
}

class GetOrderDetailsEvent extends HomeEvent {
  final OrderDetailsParams orderDetailsParams;


  GetOrderDetailsEvent({required this.orderDetailsParams,});
}



