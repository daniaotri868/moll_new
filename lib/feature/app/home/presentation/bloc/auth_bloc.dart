import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:remy/common/models/page_state/bloc_status.dart';
import 'package:remy/common/models/page_state/page_state.dart';
import '../../../../../core/api/result.dart';
import '../../data/model/all_department_model.dart';
import '../../data/model/department_details_model.dart';
import '../../data/model/department_product.dart';
import '../../data/model/home_model.dart';
import '../../data/model/moll_details.dart';
import '../../data/model/moll_model.dart';
import '../../data/model/product_details_model.dart';

import '../../domain/use_case/change_fav_usecase.dart';
import '../../domain/use_case/department_details_use_case.dart';
import '../../domain/use_case/department_usecase.dart';
import '../../domain/use_case/get_all_fav_usecase.dart';
import '../../domain/use_case/get_department_product.dart';
import '../../domain/use_case/get_home_usecase.dart';
import '../../domain/use_case/get_product_details_usecase.dart';
import '../../domain/use_case/moll_use_case.dart';
import '../../domain/use_case/moll_details_use_case.dart';

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
  final GetFavProductUseCase getFavProductUseCase;
  final ChangeFavUseCase changeFavUseCase;

  HomeBloc(this.getMollDetailsUseCase, this.getAllMollUseCase, this.getAllDepartmentUseCase, this.departmentDetailsUseCase, this.getProductDetailsUseCase, this.getDepartmentProductUseCase, this.getHomeUseCase, this.getFavProductUseCase, this.changeFavUseCase

  ) : super( HomeState()) {
    on<ProductDetailsEvent>(_onProductDetailsEvent);
    on<MollDetailsEvent>(_onMollDetailsEvent);
    on<AllMollEvent>(_onAllMollEvent);
    on<AllDepartmentEvent>(_onAllDepartmentEvent);
    on<DepartmentDetailsEvent>(_onDepartmentDetailsEvent);
    on<DepartmentProductEvent>(_onDepartmentProductEvent);
    on<GetHomeEvent>(_onGetHomeEvent);
    on<GetAllFavEvent>(_onGetAllFavEvent);
    on<ChangeFavEvent>(_onChangeFavEvent);
    on<SaveProductsToPosEvent>(_onSaveBrand);
    on<DeleteProductsToPosEvent>(_onDelete);
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

  FutureOr<void> _onDepartmentProductEvent(
      DepartmentProductEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getDepartmentProduct: PageState.loading()));
    final result = await getDepartmentProductUseCase(DetailsParams(userId: event.detailsParams.userId, id: event.detailsParams.id));
    switch (result) {
      case Success(value: final data):
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
FutureOr<void> _onAllDepartmentEvent(
    AllDepartmentEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getAllDepartment: PageState.loading()));
    final result = await getAllDepartmentUseCase(DetailsParams(userId: event.detailsParams.userId, id: event.detailsParams.id));
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
    print("v=======${v}");
    print("==========${(state.listCart??[]).contains(ProductCart(
        name: event.name,
        id: event.id,
        price: event.price,
        offer: event.offer,
        qun: event.qun
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
        fontSize: 16.0):Fluttertoast.showToast(
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
       v ?state.listCart:(state.listCart??[]) + [ProductCart(name: event.name,max:event.max,qun: event.qun,id: event.id,offer: event.offer,price: event.price)]));
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
