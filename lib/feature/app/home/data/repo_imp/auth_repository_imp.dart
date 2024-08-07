
import 'package:injectable/injectable.dart';
import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/api_utils.dart';
// import '../../../../../core/api/params.dart';
import '../../../../../core/api/result.dart';
import '../../domain/repo/home_repository.dart';
import '../../domain/use_case/driver_usecase.dart';
import '../data_source/home_remot_data_source.dart';
import '../model/all_department_model.dart';
import '../model/all_order_model.dart';
import '../model/department_details_model.dart';
import '../model/department_product.dart';
import '../model/home_model.dart';
import '../model/moll_details.dart';
import '../model/moll_model.dart';
import '../model/moll_name.dart';
import '../model/notifications_model.dart';
import '../model/order_details_model.dart';
import '../model/point_model.dart';
import '../model/product_details_model.dart';
import '../model/search_model.dart';




@Injectable(as: HomeRepository)
class AuthRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Result<ResponseWrapper<GetMollModel>>> getMall(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.getMall(params);
      return result;
    });
  }
  //Notifications
  @override
  Future<Result<ResponseWrapper<List<NotificationsModel>>>> notifications(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.notifications(params);
      return result;
    });
  }
 @override
  Future<Result<ResponseWrapper<HomeModel>>> getHome(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.getHome(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<GetProductDetailsModel>>> getProductDetails(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.getProductDetails(params);
      return result;
    });
  }
  @override
  Future<Result<ResponseWrapper<List<AllOrderModel>>>> getOrders(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.getOrders(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<List<MyPointsModel>>>> getMyPoints(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.getMyPoints(params);
      return result;
    });
  }
  @override
  Future<Result<ResponseWrapper<OrderDetailsModel>>> orderDetails(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.orderDetails(params);
      return result;
    });
  }
  @override
  Future<Result<ResponseWrapper<OrderDetailsModel>>> createOrder(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.createOrder(params);
      return result;
    });
  }
   @override
  Future<Result<ResponseWrapper<OrderDetailsModel>>> updateOrder(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.updateOrder(params);
      return result;
    });
  }


  @override
  Future<Result<ResponseWrapper<bool>>> confirmOrder(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.confirmOrder(params);
      return result;
    });
  }
  Future<Result<ResponseWrapper<bool>>> rateOrder(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.rateOrder(params);
      return result;
    });
  }
  Future<Result<ResponseWrapper<List<AllMollNameModel>>>> mollname(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.mollname(params);
      return result;
    });
  }

  Future<Result<ResponseWrapper<bool>>> driver(DriverParams params) {
    return toApiResult(() async {
      final result = datasource.driver(params);
      return result;
    });
  }
Future<Result<ResponseWrapper<bool>>> newRateOrder(Map<String, dynamic>  params) {
    return toApiResult(() async {
      final result = datasource.newRateOrder(params);
      return result;
    });
  }

  Future<Result<ResponseWrapper<bool>>> cancelOrder(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.cancelOrder(params);
      return result;
    });
  }
Future<Result<ResponseWrapper<SearchHomeModel>>> searchHome(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.searchHome(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<bool>>> changeFav(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.changeFav(params);
      return result;
    });
  }
 @override
  Future<Result<ResponseWrapper<GetAllDepartmentProductModel>>> getAllDepartmentProduct(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.getAllDepartmentProduct(params);
      return result;
    });
  }
@override
  Future<Result<ResponseWrapper<GetAllDepartmentProductModel>>> getAllFavProduct(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.getAllFavProduct(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<GetMollDetailsModel>>> getMallDetails(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.getMallDetails(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<GetAllDepartmentModel>>> getAllDepartment(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.getAllDepartment(params);
      return result;
    });
  }


 @override
  Future<Result<ResponseWrapper<GetAllDepartmentDetailsModel>>> getDepartmentDetails(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.getDepartmentDetails(params);
      return result;
    });
  }





}
