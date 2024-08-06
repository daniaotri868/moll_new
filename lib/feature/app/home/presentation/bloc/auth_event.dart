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

class NewRateOrderEvent extends HomeEvent {
  final NewRateOrderParams newRateOrderParams;
  final VoidCallback onSuccess;


  NewRateOrderEvent({required this.newRateOrderParams,required this.onSuccess});
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
  final double ?Lng;
  final double ?Lat;
  final int? offer;
  final int ?price;
  final int ?max;
  final String ?image;
  final String ?mallId;

   SaveProductsToPosEvent({
  this.id,
  this.name,
  this.qun,
  this.Lng,
  this.Lat,
  this.offer,
  this.price,
  this.max,
  this.image,
  this.mallId,
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

class DeleteAllProductsToPosEvent extends HomeEvent {

  DeleteAllProductsToPosEvent();
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
class UpdateOrderEvent extends HomeEvent {
  final UpdateOrderParams createOrderParams;
  final Function(OrderDetailsModel ) data;

  UpdateOrderEvent({required this.createOrderParams,required this.data});
}
class ToggleProductFavourite extends HomeEvent {
  final ProductItem product;
  final bool? fav;
  final VoidCallback onSuccess;
  final VoidCallback? onToggle;
  final bool? isRequest;
  ToggleProductFavourite(
      {required this.product, this.fav, required this.onSuccess,this.onToggle,this.isRequest=false});
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
class CancelOrderEvent extends HomeEvent {
  final CancelOrderParams confirmOrderParams;
  final VoidCallback onSuccess;


  CancelOrderEvent({required this.confirmOrderParams,required this.onSuccess});
}

class SearchHomeEvent extends HomeEvent {
  final SearchParams searchParams;
  final VoidCallback onSuccess;


  SearchHomeEvent({required this.searchParams,required this.onSuccess});
}

class GetOrderEvent extends HomeEvent {
  final GetOrderParams getOrderParams;

  GetOrderEvent({required this.getOrderParams,});
}

class MyPointEvent extends HomeEvent {
  final MyPointParams getOrderParams;

  MyPointEvent({required this.getOrderParams,});
}

class GetMollNameEvent extends HomeEvent {
  final DetailsParams detailsParams;

  GetMollNameEvent({required this.detailsParams,});
}
class DriverEvent extends HomeEvent {
  final DriverParams driverParams;
  final VoidCallback onSuccess;


  DriverEvent({required this.driverParams,required this.onSuccess});
}

class GetOrderDetailsEvent extends HomeEvent {
  final OrderDetailsParams orderDetailsParams;


  GetOrderDetailsEvent({required this.orderDetailsParams,});
}



