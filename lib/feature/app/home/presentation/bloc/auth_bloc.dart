import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:remy/common/models/page_state/bloc_status.dart';
import 'package:remy/common/models/page_state/page_state.dart';
import 'package:remy/feature/app/auth/presentation/ui/screen/login_screen.dart';
import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../data/model/all_department_model.dart';
import '../../data/model/all_order_model.dart';
import '../../data/model/department_details_model.dart';
import '../../data/model/department_product.dart';
import '../../data/model/home_model.dart';
import '../../data/model/moll_details.dart';
import '../../data/model/moll_model.dart';
import '../../data/model/moll_name.dart';
import '../../data/model/order_details_model.dart';
import '../../data/model/point_model.dart';
import '../../data/model/product_details_model.dart';

import '../../data/model/search_model.dart';
import '../../domain/use_case/cancel_order.dart';
import '../../domain/use_case/change_fav_usecase.dart';
import '../../domain/use_case/confirm_uscase.dart';
import '../../domain/use_case/department_details_use_case.dart';
import '../../domain/use_case/department_usecase.dart';
import '../../domain/use_case/driver_usecase.dart';
import '../../domain/use_case/get_all_fav_usecase.dart';
import '../../domain/use_case/get_department_product.dart';
import '../../domain/use_case/get_home_usecase.dart';
import '../../domain/use_case/get_order_usecase.dart';
import '../../domain/use_case/get_point_usecase.dart';
import '../../domain/use_case/get_product_details_usecase.dart';
import '../../domain/use_case/moll_name.dart';
import '../../domain/use_case/moll_use_case.dart';
import '../../domain/use_case/moll_details_use_case.dart';
import '../../domain/use_case/new_rate_order.dart';
import '../../domain/use_case/order_details.dart';
import '../../domain/use_case/post_order.dart';
import '../../domain/use_case/rate_usecase.dart';
import '../../domain/use_case/search_usecase.dart';
import '../../domain/use_case/update_order.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetMollDetailsUseCase getMollDetailsUseCase;
  final GetAllMollUseCase getAllMollUseCase;
  final GetAllDepartmentUseCase getAllDepartmentUseCase;
  final DepartmentDetailsUseCase departmentDetailsUseCase;
  final GetDepartmentProductUseCase getDepartmentProductUseCase;
  final GetProductDetailsUseCase getProductDetailsUseCase;
  final GetHomeUseCase getHomeUseCase;
  final DriverUseCase driverUseCase;
  final MollNameUseCase mollNameUseCase;
  final GetFavProductUseCase getFavProductUseCase;
  final ChangeFavUseCase changeFavUseCase;
  final GetOrdersUseCase getOrdersUseCase;
  final CreateOrdersUseCase createOrdersUseCase;
  final SearchHomeUseCase searchHomeUseCase;
  final OrderDetailsUseCase orderDetailsUseCase;
  final ConfirmOrdersUseCase confirmOrdersUseCase;
  final RateOrdersUseCase rateOrdersUseCase;
  final CancelOrdersUseCase cancelOrdersUseCase;
  final UpdateOrdersUseCase updateOrdersUseCase;
  final MyPointsUseCase myPointsUseCase;
  final NewRateOrdersUseCase newRateOrdersUseCase;


  HomeBloc(this.getMollDetailsUseCase,this.rateOrdersUseCase,this.confirmOrdersUseCase,this.orderDetailsUseCase,this.createOrdersUseCase, this.getOrdersUseCase,this.getAllMollUseCase, this.getAllDepartmentUseCase, this.departmentDetailsUseCase, this.getProductDetailsUseCase, this.getDepartmentProductUseCase, this.getHomeUseCase, this.getFavProductUseCase, this.changeFavUseCase, this.updateOrdersUseCase, this.myPointsUseCase, this.cancelOrdersUseCase, this.searchHomeUseCase, this.driverUseCase, this.mollNameUseCase, this.newRateOrdersUseCase

  ) : super( HomeState()) {
    on<ProductDetailsEvent>(_onProductDetailsEvent);
    on<MollDetailsEvent>(_onMollDetailsEvent);
    on<AllMollEvent>(_onAllMollEvent);
    on<AllDepartmentEvent>(_onAllDepartmentEvent);
    on<DepartmentDetailsEvent>(_onDepartmentDetailsEvent);
    on<DepartmentProductEvent>(_onDepartmentProductEvent);
    on<GetHomeEvent>(_onGetHomeEvent);
    on<NewRateOrderEvent>(_onNewRateOrderEvent);
    on<CreateOrderEvent>(_onCreateOrderEvent);
    on<GetOrderEvent>(_onGetOrderEvent);
    on<GetAllFavEvent>(_onGetAllFavEvent);
    on<ChangeFavEvent>(_onChangeFavEvent);
    on<ConfirmOrderEvent>(_onConfirmOrderEvent);
    on<GetOrderDetailsEvent>(_onGetOrderDetailsEvent);
    on<RateOrderEvent>(_onRateOrderEvent);
    on<SaveProductsToPosEvent>(_onSaveBrand);
    on<DeleteProductsToPosEvent>(_onDelete);
    on<DeleteAllProductsToPosEvent>(_onDeleteAll);
    on<SearchHomeEvent>(_onSearchHomeEvent);
    on<UpdateOrderEvent>(_onUpdateOrderEvent);
    on<CancelOrderEvent>(_onCancelOrderEvent);
    on<DriverEvent>(_onDriverEvent);
    on<GetMollNameEvent>(_onGetMollNameEvent);
    on<MyPointEvent>(_onMyPointEvent);
    // on<ToggleProductFavourite>(_onToggleProductFavouriteEvent);
    on<updateProductToOrderInPosEvent>(_onupdateProductToOrderInPosEvent);


  }


  FutureOr<void> _onProductDetailsEvent(
      ProductDetailsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getProductDetails: PageState.loading()));
    final result = await getProductDetailsUseCase(DetailsParams(userId: event.detailsParams.userId, id: event.detailsParams.id));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          getProductDetails:  PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          getProductDetails:  PageState.error(exception: exception, message: message),
        ));
    }
  }


  FutureOr<void> _onGetOrderEvent(
      GetOrderEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getOrders:PageState.loading()));
    final result = await getOrdersUseCase(GetOrderParams(userId: event.getOrderParams.userId,type:event.getOrderParams.type ));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          getOrders:  PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          getOrders:   PageState.error(exception: exception, message: message),
        ));
    }
  }
FutureOr<void> _onSearchHomeEvent(
    SearchHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getSearchHome:PageState.loading()));
    final result = await searchHomeUseCase(SearchParams(userId: event.searchParams.userId,search:event.searchParams.search ));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          getSearchHome:  PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          getSearchHome:   PageState.error(exception: exception, message: message),
        ));
    }
  }


 FutureOr<void> _onMyPointEvent(
     MyPointEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getMyPoints:PageState.loading()));
    final result = await myPointsUseCase(MyPointParams(userId: event.getOrderParams.userId ));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          getMyPoints:  PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          getMyPoints:   PageState.error(exception: exception, message: message),
        ));
    }
  }

  FutureOr<void> _onGetOrderDetailsEvent(
      GetOrderDetailsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(orderDetails:PageState.loading()));
    final result = await orderDetailsUseCase(OrderDetailsParams(id:event.orderDetailsParams.id ,userId: event.orderDetailsParams.userId,search:"" ));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          orderDetails:  PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          orderDetails:   PageState.error(exception: exception, message: message),
        ));
    }
  }
 FutureOr<void> _onCreateOrderEvent(
     CreateOrderEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(createOrder: PageState.loading()));
    final result = await createOrdersUseCase(CreateOrderParams(userId:event.createOrderParams.userId ,lat: event.createOrderParams.lat,lng: event.createOrderParams.lng,
        address: event.createOrderParams.address,areaId: event.createOrderParams.areaId,products: event.createOrderParams.products));
    switch (result) {
      case Success(value: final data):
        event.data(data.data);
        emit(state.copyWith(
          createOrder:  PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          createOrder: PageState.error(exception: exception, message: message),
        ));
    }
  }
FutureOr<void> _onUpdateOrderEvent(
    UpdateOrderEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(updateOrder: PageState.loading()));
    final result = await updateOrdersUseCase(UpdateOrderParams(userId:event.createOrderParams.userId ,
        id: event.createOrderParams.id,lng: event.createOrderParams.lng,lat: event.createOrderParams.lat,
        address: event.createOrderParams.address,areaId: event.createOrderParams.areaId,products: event.createOrderParams.products));
    switch (result) {
      case Success(value: final data):
        event.data(data.data);
        emit(state.copyWith(
          updateOrder:  PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          updateOrder: PageState.error(exception: exception, message: message),
        ));
    }
  }

  FutureOr<void> _onDepartmentProductEvent(
      DepartmentProductEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getDepartmentProduct: PageState.loading()));
    final result = await getDepartmentProductUseCase(DetailsParams(userId: event.detailsParams.userId, id: event.detailsParams.id));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(listDepartmentProduct: data.data.products,
           ));
        emit(state.copyWith(
          getDepartmentProduct:  PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          getDepartmentProduct:  PageState.error(exception: exception, message: message),
        ));
    }
  }

  FutureOr<void> _onGetAllFavEvent(
      GetAllFavEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getAllFav: PageState.loading()));
    final result = await getFavProductUseCase(DetailsParams(userId: event.detailsParams.userId, id: event.detailsParams.id));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          getAllFav:  PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          getAllFav:  PageState.error(exception: exception, message: message),
        ));
    }
  }

  FutureOr<void> _onChangeFavEvent(
      ChangeFavEvent event, Emitter<HomeState> emit) async {
  emit(state.copyWith(listDepartmentProduct:
    (state.listDepartmentProduct ?? []).map((e) {
    if (event.changeFavParams.id == e.id) return e.copyWith(isFavourite: !(e.isFavourite??false));
    return e;
  }).toList()));
  // emit(state.copyWith(getHome:HomeModel(
  //   ads:state.getHome ,
  //   products: ,
  //   malls: ,
  // )));
    emit(state.copyWith(changeFav: BlocStatus.loading()));
    final result = await changeFavUseCase(ChangeFavParams(userId: event.changeFavParams.userId, id: event.changeFavParams.id));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          changeFav: BlocStatus.success(),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          changeFav:  BlocStatus.fail(error: message),
        ));
    }
  }


  FutureOr<void> _onDriverEvent(
      DriverEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(driver: BlocStatus.loading()));
    final result = await driverUseCase(DriverParams(FirstName: event.driverParams.FirstName,
        LastName: event.driverParams.LastName,CV: event.driverParams.CV,Email: event.driverParams.Email,MallId: event.driverParams.MallId, PhoneNumber: event.driverParams.PhoneNumber));
    switch (result) {
      case Success(value: final data):
        event.onSuccess();
        emit(state.copyWith(
          driver: BlocStatus.success(),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          driver:  BlocStatus.fail(error: message),
        ));
    }
  }
  FutureOr<void> _onGetMollNameEvent(
      GetMollNameEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getAllMollName: PageState.loading()));
    final result = await mollNameUseCase(DetailsParams(userId: event.detailsParams.userId,));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          getAllMollName: PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          getAllMollName:  PageState.error(exception: exception, message: message),
        ));
    }
  }
  FutureOr<void> _onConfirmOrderEvent(
      ConfirmOrderEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(confirm: BlocStatus.loading()));
    final result = await confirmOrdersUseCase(ConfirmOrderParams(userId: event.confirmOrderParams.userId, id: event.confirmOrderParams.id,note: event.confirmOrderParams.note,pointsToUse: event.confirmOrderParams.pointsToUse));
    switch (result) {
      case Success(value: final data):
        event.onSuccess();
        emit(state.copyWith(
          confirm: BlocStatus.success(),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          confirm:  BlocStatus.fail(error: message),
        ));
    }
  }

  FutureOr<void> _onRateOrderEvent(
      RateOrderEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(rate: BlocStatus.loading()));
    final result = await rateOrdersUseCase(RateOrderParams(userId: event.confirmOrderParams.userId, id: event.confirmOrderParams.id,evaluation: event.confirmOrderParams.evaluation));
    switch (result) {
      case Success(value: final data):
        event.onSuccess();
        emit(state.copyWith(
          rate: BlocStatus.success(),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          rate:  BlocStatus.fail(error: message),
        ));
    }
  }

 FutureOr<void> _onCancelOrderEvent(
     CancelOrderEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(rate: BlocStatus.loading()));
    final result = await cancelOrdersUseCase(CancelOrderParams(userId: event.confirmOrderParams.userId, id: event.confirmOrderParams.id,reason: event.confirmOrderParams.reason));
    switch (result) {
      case Success(value: final data):
        event.onSuccess();
        emit(state.copyWith(
          rate: BlocStatus.success(),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          rate:  BlocStatus.fail(error: message),
        ));
    }
  }


 FutureOr<void> _onDepartmentDetailsEvent(
     DepartmentDetailsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getDepartmentDetails: PageState.loading()));
    final result = await departmentDetailsUseCase(DetailsParams(userId: event.detailsParams.userId, id: event.detailsParams.id));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          getDepartmentDetails:  PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          getDepartmentDetails:  PageState.error(exception: exception, message: message),
        ));
    }
  }
  // FutureOr<void> _onToggleProductFavouriteEvent(
  //     ToggleProductFavourite event, Emitter<HomeState> emit) async {
  //   // print(state.getAllHomeData);
  //   if (!state.getHome.isLoaded) return;
  //
  //   final oldState = state.getHome.data;
  //
  //   final newState = oldState.copyWith(
  //     mostOrder: getListAfterRefactorFavouriteItem(
  //         oldState.mostOrder??[], event.product.id!),
  //     offers:
  //     getListAfterRefactorFavouriteItem(oldState.offers??[], event.product.id!),
  //     specials: getListAfterRefactorFavouriteItem(          oldState.specials??[], event.product.id!),
  //   );
  //
  //   // print(newState.mostOrder?.firstWhere((element) => element.id==event.product.id));
  //
  //   state.getDepartmentProduct.data.products =
  //       (state.getDepartmentProduct.data.products ?? []).map((e) {
  //         if (event.product.id == e.id) return e.copyWith(: !e.isFavoite);
  //         return e;
  //       }).toList();
  //   // state.getAllOffersData.itemList =
  //   //     (state.getAllOffersData.itemList ?? []).map((e) {
  //   //       if (event.product.id == e.id) return e.copyWith(isFavoite: !e.isFavoite);
  //   //       return e;
  //   //     }).toList();
  //   // state.getAllSpecialData.itemList =
  //   //     (state.getAllSpecialData.itemList ?? []).map((e) {
  //   //       if (event.product.id == e.id) return e.copyWith(isFavoite: !e.isFavoite);
  //   //       return e;
  //   //     }).toList();
  //   //
  //   // // }
  //   //
  //   // state.getBrandProductByIdData.itemList =
  //   //     (state.getBrandProductByIdData.itemList ?? []).map((e) {
  //   //       if (event.product.id == e.id) return e.copyWith(isFavoite: !e.isFavoite);
  //   //       return e;
  //   //     }).toList();
  //
  //   // if (state.getDepartmentProduct.isLoaded) {
  //   //   final productDetailsState = state.getDepartmentProduct.data;
  //   //   final newProductDetails = productDetailsState.copyWith(
  //   //       isFavorite: productDetailsState.id == event.product.id
  //   //           ? !(productDetailsState.isFavorite)
  //   //           : productDetailsState.isFavorite,
  //   //       productMayBeLike: getListAfterRefactorFavouriteItem(
  //   //           productDetailsState.productMayBeLike??[], event.product.id!));
  //   //
  //   //   emit(state.copyWith(
  //   //       getDepartmentProduct: PageState.loaded(data: newProductDetails)));
  //   // }
  //
  //   emit(state.copyWith(getHome: PageState.loaded(data: newState)));
  //
  //
  //   // print(state.getAllHomeData.data.mostOrder?.firstWhere((element) => element.id==event.product.id));
  //   late final Result<ResponseWrapper<bool>> result;
  //   if(event.isRequest!)return;
  //
  //   if (event.fav == true) {
  //     result = await changeFavUseCase(ChangeFavParams(id: event.product.id.toString(),userId: LoginScreen.userId));
  //     print("000000000000");
  //   } else {
  //     if (event.product.isFavourite ?? false) {
  //       print("------------");
  //       // print(event.product.isFavoite);
  //       result = await changeFavUseCase(ChangeFavParams(id: event.product.id.toString(),userId: LoginScreen.userId));
  //     } else {
  //       print(event.fav);
  //       print("**************");
  //       // print(event.product.isFavoite);
  //       result = await changeFavUseCase(ChangeFavParams(id: event.product.id.toString(),userId: LoginScreen.userId));
  //     }
  //   }
  //
  //
  //
  //   switch (result) {
  //     case Success(value: final data):
  //       event.onSuccess?.call();
  //     case Failure(exception: final exception, message: final message):
  //       emit(state.copyWith(getHome: PageState.loaded(data: oldState)));
  //     default:
  //       print('batoul');
  //   }
  //   // if(emit.isDone){return;}
  // }
FutureOr<void> _onAllDepartmentEvent(
    AllDepartmentEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getAllDepartment: PageState.loading()));
    final result = await getAllDepartmentUseCase(DetailsParams(userId: event.detailsParams.userId, id: event.detailsParams.id,search: event.detailsParams.search));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          getAllDepartment:  PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          getAllDepartment:  PageState.error(exception: exception, message: message),
        ));
    }
  }

FutureOr<void> _onAllMollEvent(
    AllMollEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getAllMoll: PageState.loading()));
    final result = await getAllMollUseCase(MollParams(UserId: event.detailsParams.UserId, name: event.detailsParams.name));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          getAllMoll:  PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          getAllMoll:  PageState.error(exception: exception, message: message),
        ));
    }
  }


FutureOr<void> _onGetHomeEvent(
    GetHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getHome: PageState.loading()));
    final result = await getHomeUseCase(HomeParams(UserId: event.detailsParams.UserId));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          getHome:  PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          getHome:  PageState.error(exception: exception, message: message),
        ));
    }
  }

  FutureOr<void> _onNewRateOrderEvent(
      NewRateOrderEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(newRate: BlocStatus.loading()));
    final result = await newRateOrdersUseCase(NewRateOrderParams(userId: event.newRateOrderParams.userId,
    id: event.newRateOrderParams.id,reason: event.newRateOrderParams.reason,rateDriver: event.newRateOrderParams.rateDriver,rateOrder: event.newRateOrderParams.rateOrder,reasonOrder: event.newRateOrderParams.reasonOrder));
    switch (result) {
      case Success(value: final data):
        event.onSuccess();
        emit(state.copyWith(
          newRate:  BlocStatus.success(),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          newRate:  BlocStatus.fail(error: message),
        ));
    }
  }
FutureOr<void> _onMollDetailsEvent(
    MollDetailsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getMollDetails: PageState.loading()));
    final result = await getMollDetailsUseCase(DetailsParams(userId: event.detailsParams.userId, id: event.detailsParams.id));

    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          getMollDetails:  PageState.loaded(data: data.data),
           ));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          getMollDetails:  PageState.error(exception: exception, message: message),
        ));
    }
  }

  _onSaveBrand(
      SaveProductsToPosEvent event,  emit) {
    bool v=false;
    print("00000000000000000${event.mallId}");
    print("00000000000000000${event.name}");
    // List pr=state.productSave + [event.productItem];
    // state.productSave.add(event.productItem);
    // final Product pr;
    (state.listCart??[]).forEach((element) {
      if(element.id==event.id)
       {
         v=true;
         return;
       }
        ;
    }

    );
    print("v=======${event.max}");
    print("==========${(state.listCart??[]).contains(ProductCart(
        name: event.name,
        id: event.id,
        price: event.price,
        offer: event.offer,
        qun: event.qun,
        image: event.image??"",
      // Lat: event.Lat,
      // Lng: event.Lng
    ))}");
    // (state.listCart??[]).contains(ProductCart(
    //   name: event.name,
    //   id: event.id,
    //   price: event.price,
    //   offer: event.offer,
    //   qun: event.qun
    // ))

    v?Fluttertoast.showToast(
        msg: "تمة إضافته مبسقا",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor:  Colors.red,
        textColor: Colors.white,
        fontSize: 16.0):
    (state.listCart??[]).any((element) => element.mallId!=event.mallId,)?
    Fluttertoast.showToast(
        msg: "لا يمكن إضافة لاكثر من مول",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor:  Colors.red,
        textColor: Colors.white,
        fontSize: 16.0):
    Fluttertoast.showToast(
        msg: "تمة إضافته بنجاح",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor:  Colors.greenAccent,
        textColor: Colors.white,
        fontSize: 16.0);

    emit(state.copyWith(listCart
        :
    // (state.listCart??[]).contains(ProductCart(
    //     name: event.name,
    //     id: event.id,
    //     price: event.price,
    //     offer: event.offer,
    //     qun: event.qun
    // ))
       (v||(state.listCart??[]).any((element) => element.mallId!=event.mallId,)) ?state.listCart:(state.listCart??[]) + [ProductCart(name: event.name,max:event.max,qun: event.qun,id: event.id,offer: event.offer,price: event.price,mallId: event.mallId,image: event.image,Lng: event.Lng,Lat: event.Lat)]));
    print("000000");
    // print(state.productSave);
    (state.listCart??[]).forEach((e) {
      print("in loop");
      if(e.id==event.id){
        e.copyWith(qun: 1);
        print("trueeeeee$e");
      };
    });
    // emit(state.copyWith(productSave: ));


  }
  _onDelete(
      DeleteProductsToPosEvent event,  emit) {
    // List pr=state.productSave + [event.productItem];
    // state.productSave.add(event.productItem);
    emit(state.copyWith(listCart:(state.listCart??[])..removeWhere((element) => element.id==event.productItem.id)));

  }
  _onDeleteAll(
      DeleteAllProductsToPosEvent event,  emit) {
    // List pr=state.productSave + [event.productItem];
    // state.productSave.add(event.productItem);
    emit(state.copyWith(listCart:[]));

  }

  _onupdateProductToOrderInPosEvent(
      updateProductToOrderInPosEvent event,
      emit,
      ) {
    List<ProductCart> l = List.from(state.listCart??[]);
    l[event.index] = l[event.index].copyWith(
      qun: (l[event.index].qun ??0)+ event.count,
    );
    emit(state.copyWith(listCart: l));
  }



}
