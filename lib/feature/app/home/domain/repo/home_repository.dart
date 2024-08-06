

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
import '../../data/model/notifications_model.dart';
import '../../data/model/order_details_model.dart';
import '../../data/model/point_model.dart';
import '../../data/model/product_details_model.dart';
import '../../data/model/search_model.dart';
import '../use_case/driver_usecase.dart';



abstract class HomeRepository {
  Future<Result<ResponseWrapper<GetMollModel>>> getMall(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<bool>>> changeFav(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<List<AllMollNameModel>>>> mollname(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<HomeModel>>> getHome(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<GetProductDetailsModel>>> getProductDetails(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<OrderDetailsModel>>> createOrder(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<OrderDetailsModel>>> updateOrder(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<bool>>> confirmOrder(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<bool>>> driver(DriverParams params);
  Future<Result<ResponseWrapper<bool>>> rateOrder(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<bool>>> newRateOrder(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<bool>>> cancelOrder(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<SearchHomeModel>>> searchHome(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<List<AllOrderModel>>>> getOrders(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<List<MyPointsModel>>>> getMyPoints(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<OrderDetailsModel>>> orderDetails(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<GetAllDepartmentProductModel>>> getAllDepartmentProduct(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<GetAllDepartmentProductModel>>> getAllFavProduct(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<GetMollDetailsModel>>> getMallDetails(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<GetAllDepartmentModel>>> getAllDepartment(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<GetAllDepartmentDetailsModel>>> getDepartmentDetails(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<List<NotificationsModel>>>> notifications(Map<String, dynamic> params);

}
