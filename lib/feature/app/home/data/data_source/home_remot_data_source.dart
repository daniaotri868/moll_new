
import 'package:injectable/injectable.dart';
import 'package:remy/core/api/params.dart';

import '../../../../../common/constants/route.dart';
import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/api_utils.dart';
import '../../../../../core/api/client.dart';
import '../../../../../core/api/client_config.dart';
import '../model/all_department_model.dart';
import '../model/all_order_model.dart';
import '../model/department_details_model.dart';
import '../model/department_product.dart';
import '../model/home_model.dart';
import '../model/moll_details.dart';
import '../model/moll_model.dart';
import '../model/order_details_model.dart';
import '../model/product_details_model.dart';

@injectable
class HomeRemoteDataSource {
  final ClientApi clientApi;

  HomeRemoteDataSource(this.clientApi);
  // final PreferencesRepository preference = getIt<PreferencesRepository>();
  Future<ResponseWrapper<GetMollModel>> getMall(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: EndPoints.home.getAllMoll,
        queryParameters: params,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return GetMollModel.fromJson(response.data);
        },
      );
    });
  }


  Future<ResponseWrapper<HomeModel>> getHome(Map<String, dynamic> params) async => throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: EndPoints.home.getHome,
        queryParameters: params,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return HomeModel.fromJson(response.data);
        },
      );
    });

  Future<ResponseWrapper<GetProductDetailsModel>> getProductDetails(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Product/GetById',
        queryParameters: params,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return GetProductDetailsModel.fromJson(response.data);
        },
      );
    });
  }
Future<ResponseWrapper<OrderDetailsModel>> createOrder(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Order/Add',
        data: params,
        clientMethod: ClientMethod.post,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return  OrderDetailsModel.fromJson(response.data);
        },
      );
    });
  }
Future<ResponseWrapper<bool>> confirmOrder(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Order/Confirm',
        data: params,
        clientMethod: ClientMethod.post,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return  true;
        },
      );
    });
  }

Future<ResponseWrapper<bool>> rateOrder(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Order/Confirm',
        data: params,
        clientMethod: ClientMethod.post,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return  true;
        },
      );
    });
  }

  Future<ResponseWrapper<List<AllOrderModel>>> getOrders(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Order/GetAll',
        queryParameters: params,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          final list = List<dynamic>.of(response.data)
              .map<AllOrderModel>((e) => AllOrderModel.fromJson(e))
              .toList();
          return list;
        },
      );
    });
  }
  Future<ResponseWrapper<OrderDetailsModel>> orderDetails(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Order/GetById',
        queryParameters: params,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return OrderDetailsModel.fromJson(response.data);
        },
      );
    });
  }

  Future<ResponseWrapper<bool>> changeFav(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: EndPoints.auth.login,
        data: params,
        clientMethod: ClientMethod.post,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return true;
        },
      );
    });
  }
 Future<ResponseWrapper<GetAllDepartmentProductModel>> getAllDepartmentProduct(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Product/GetAllByDepartmentId',
        queryParameters: params,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return GetAllDepartmentProductModel.fromJson(response.data);
        },
      );
    });
  }


  Future<ResponseWrapper<GetAllDepartmentProductModel>> getAllFavProduct(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: EndPoints.auth.login,
        data: params,
        clientMethod: ClientMethod.post,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return GetAllDepartmentProductModel.fromJson(response.data);
        },
      );
    });
  }

  Future<ResponseWrapper<GetMollDetailsModel>> getMallDetails(
      Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Mall/GetById',
        queryParameters: params,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        response.data,
        (json) {
          // preference.setString(PreferencesKeys.status, response.data['status']);
          // preference.setString(PreferencesKeys.token, response.data['token']);
          // preference.setString(
          //     PreferencesKeys.refreshToken, response.data['refreshToken']);
          return GetMollDetailsModel.fromJson(response.data);
        },
      );
    });
  }

  Future<ResponseWrapper<GetAllDepartmentModel>> getAllDepartment(
      Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Department/GetAllByMallId',
        queryParameters: params,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return GetAllDepartmentModel.fromJson(response.data);
        },
      );
    });
  }

  Future<ResponseWrapper<GetAllDepartmentDetailsModel>> getDepartmentDetails(
      Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: EndPoints.profile.getUserInfo,
        data: params,
        clientMethod: ClientMethod.post,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return GetAllDepartmentDetailsModel.fromJson(response.data);
        },
      );
    });
  }


}
