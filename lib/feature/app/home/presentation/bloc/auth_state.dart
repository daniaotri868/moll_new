part of 'auth_bloc.dart';

@immutable
class HomeState {

  final PageState<GetMollModel> getAllMoll;
  final PageState<List<AllMollNameModel>> getAllMollName;
  final PageState<HomeModel> getHome;
  final PageState<SearchHomeModel> getSearchHome;
  final PageState<GetMollDetailsModel> getMollDetails;
  final PageState<GetAllDepartmentDetailsModel> getDepartmentDetails;
  final PageState<GetAllDepartmentModel> getAllDepartment;
  final PageState<GetProductDetailsModel> getProductDetails;
  final PageState<List<AllOrderModel>> getOrders;
  final PageState<List<MyPointsModel>> getMyPoints;
  final PageState<OrderDetailsModel> orderDetails;
  final PageState<GetAllDepartmentProductModel> getDepartmentProduct;
   final List<ProductDp>? listDepartmentProduct;
  final PageState<GetAllDepartmentProductModel> getAllFav;
  final BlocStatus changeFav;
  final BlocStatus driver;
  final BlocStatus confirm;
  final BlocStatus rate;
  final BlocStatus newRate;
  final BlocStatus cancel;
  final PageState<OrderDetailsModel> createOrder;
  final PageState<OrderDetailsModel> updateOrder;
   List<ProductCart> ?listCart;

   HomeState(
      {
        this.getAllMoll=const PageState.init(),
        this.getMollDetails=const PageState.init(),
        this.getAllMollName=const PageState.init(),
        this.getSearchHome=const PageState.init(),
        this.getDepartmentDetails=const PageState.init(),
        this.getAllDepartment=const PageState.init(),
        this.getProductDetails=const PageState.init(),
        this.getAllFav=const PageState.init(),
        this.getHome=const PageState.init(),
        this.orderDetails=const PageState.init(),
        this.changeFav=const BlocStatus.initial(),
        this.cancel=const BlocStatus.initial(),
        this.confirm=const BlocStatus.initial(),
        this.rate=const BlocStatus.initial(),
        this.newRate=const BlocStatus.initial(),
        this.driver=const BlocStatus.initial(),
        this.getDepartmentProduct=const PageState.init(),
        this.createOrder=const PageState.init(),
        this.getOrders=const PageState.init(),
        this.getMyPoints=const PageState.init(),
        this.updateOrder=const PageState.init(),
        this.listCart=const [],
        this.listDepartmentProduct,
      });

  HomeState copyWith({
    final PageState<GetMollModel> ?getAllMoll,
    final PageState<HomeModel> ?getHome,
      List<ProductDp> ?listDepartmentProduct,
    final PageState<SearchHomeModel> ?getSearchHome,
    final PageState<GetMollDetailsModel> ?getMollDetails,
    final PageState<List<AllMollNameModel>> ?getAllMollName,
    final PageState<GetAllDepartmentDetailsModel> ?getDepartmentDetails,
    final PageState<GetAllDepartmentModel> ?getAllDepartment,
    final PageState<GetProductDetailsModel> ?getProductDetails,
    final PageState<List<AllOrderModel>> ?getOrders,
    final PageState<List<MyPointsModel>> ?getMyPoints,
    final PageState<OrderDetailsModel> ?orderDetails,
    final PageState<OrderDetailsModel> ?createOrder,
    final PageState<OrderDetailsModel> ?updateOrder,
    final PageState<GetAllDepartmentProductModel> ?getDepartmentProduct,
    final PageState<GetAllDepartmentProductModel> ?getAllFav,
    final BlocStatus ?changeFav,
    final BlocStatus ?confirm,
    final BlocStatus ?newRate,
    final BlocStatus ?driver,
    final BlocStatus ?cancel,
    final BlocStatus ?rate,
    List<ProductCart> ?listCart,



  }) {
    return HomeState(
      getAllDepartment: getAllDepartment??this.getAllDepartment,
      getAllMoll: getAllMoll??this.getAllMoll,
      getDepartmentDetails: getDepartmentDetails??this.getDepartmentDetails,
      getMollDetails: getMollDetails??this.getMollDetails,
      getDepartmentProduct:getDepartmentProduct??this.getDepartmentProduct ,
      getProductDetails: getProductDetails??this.getProductDetails,
      getHome: getHome??this.getHome,
      getAllFav: getAllFav??this.getAllFav,
      changeFav: changeFav??this.changeFav,
      listCart: listCart??this.listCart,
      createOrder: createOrder??this.createOrder,
      getOrders: getOrders??this.getOrders,
      orderDetails: orderDetails??this.orderDetails,
      confirm: confirm??this.confirm,
      rate: rate??this.rate,
        cancel: cancel??this.cancel,
      updateOrder: updateOrder??this.updateOrder,
      getMyPoints: getMyPoints??this.getMyPoints,
      getSearchHome: getSearchHome??this.getSearchHome,
      driver: driver??this.driver,
      getAllMollName: getAllMollName??this.getAllMollName,
      newRate: newRate??this.newRate,
      listDepartmentProduct: listDepartmentProduct??this.listDepartmentProduct

    );
  }
}
