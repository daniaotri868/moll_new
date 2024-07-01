part of 'auth_bloc.dart';

@immutable
class HomeState {

  final PageState<GetMollModel> getAllMoll;
  final PageState<HomeModel> getHome;
  final PageState<GetMollDetailsModel> getMollDetails;
  final PageState<GetAllDepartmentDetailsModel> getDepartmentDetails;
  final PageState<GetAllDepartmentModel> getAllDepartment;
  final PageState<GetProductDetailsModel> getProductDetails;
  final PageState<GetAllDepartmentProductModel> getDepartmentProduct;
  final PageState<GetAllDepartmentProductModel> getAllFav;
  final BlocStatus changeFav;
   List<ProductCart> ?listCart;
   HomeState(
      {
        this.getAllMoll=const PageState.init(),
        this.getMollDetails=const PageState.init(),
        this.getDepartmentDetails=const PageState.init(),
        this.getAllDepartment=const PageState.init(),
        this.getProductDetails=const PageState.init(),
        this.getAllFav=const PageState.init(),
        this.getHome=const PageState.init(),
        this.changeFav=const BlocStatus.initial(),
        this.getDepartmentProduct=const PageState.init(),
        this.listCart=const [],
      });

  HomeState copyWith({
    final PageState<GetMollModel> ?getAllMoll,
    final PageState<HomeModel> ?getHome,
    final PageState<GetMollDetailsModel> ?getMollDetails,
    final PageState<GetAllDepartmentDetailsModel> ?getDepartmentDetails,
    final PageState<GetAllDepartmentModel> ?getAllDepartment,
    final PageState<GetProductDetailsModel> ?getProductDetails,
    final PageState<GetAllDepartmentProductModel> ?getDepartmentProduct,
    final PageState<GetAllDepartmentProductModel> ?getAllFav,
    final BlocStatus ?changeFav,
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
      listCart: listCart??this.listCart

    );
  }
}
