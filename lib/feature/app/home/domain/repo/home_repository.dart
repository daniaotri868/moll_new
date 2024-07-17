

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../data/model/all_department_model.dart';
import '../../data/model/all_order_model.dart';
import '../../data/model/department_details_model.dart';
import '../../data/model/department_product.dart';
import '../../data/model/home_model.dart';
import '../../data/model/moll_details.dart';
import '../../data/model/moll_model.dart';
import '../../data/model/order_details_model.dart';
import '../../data/model/product_details_model.dart';



abstract class HomeRepository {
  Future<Result<ResponseWrapper<GetMollModel>>> getMall(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<bool>>> changeFav(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<HomeModel>>> getHome(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<GetProductDetailsModel>>> getProductDetails(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<OrderDetailsModel>>> createOrder(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<bool>>> confirmOrder(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<bool>>> rateOrder(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<List<AllOrderModel>>>> getOrders(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<OrderDetailsModel>>> orderDetails(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<GetAllDepartmentProductModel>>> getAllDepartmentProduct(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<GetAllDepartmentProductModel>>> getAllFavProduct(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<GetMollDetailsModel>>> getMallDetails(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<GetAllDepartmentModel>>> getAllDepartment(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<GetAllDepartmentDetailsModel>>> getDepartmentDetails(Map<String, dynamic> params);

}
