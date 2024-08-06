
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:remy/core/api/params.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import '../../../../../common/constants/route.dart';
import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/api_utils.dart';
import '../../../../../core/api/client.dart';
import '../../../../../core/api/client_config.dart';
import '../../domain/use_case/driver_usecase.dart';
import '../model/all_department_model.dart';
import '../model/all_order_model.dart';
import '../model/department_details_model.dart';
import '../model/department_product.dart';
import '../model/home_model.dart';
import '../model/moll_details.dart';
import '../model/moll_model.dart';
import '../model/moll_name.dart';
import '../model/order_details_model.dart';
import '../model/point_model.dart';
import '../model/product_details_model.dart';
import '../model/search_model.dart';

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

  Future<ResponseWrapper<SearchHomeModel>> searchHome(Map<String, dynamic> params) async => throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Home/Search',
        queryParameters: params,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return SearchHomeModel.fromJson(response.data);
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


  Future<ResponseWrapper<OrderDetailsModel>> updateOrder(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Order/Modify',
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

Future<ResponseWrapper<List<AllMollNameModel>>> mollname(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Mall/GetAllNames',
          queryParameters: params,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          final list = List<dynamic>.of(response.data)
              .map<AllMollNameModel>((e) => AllMollNameModel.fromJson(e))
              .toList();
          return  list;
        },
      );
    });
  }

  Future<ResponseWrapper<bool>> driver(DriverParams params) async {
    return throwAppException(() async {
      FormData formData = FormData.fromMap({
        "Email":params.Email,
        "LastName":params.LastName,
        "FirstName":params.FirstName,
        "MallId":params.MallId,
        "PhoneNumber": params.PhoneNumber,
        "type": "application/pdf"
      });
      // if(params.CV!=null){
        formData.files.add(MapEntry('CV', await MultipartFile.fromFile(params.CV!,
            contentType: MediaType('application', 'pdf'),filename:params.CV!.split('/').last )));
    // }
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Driver/Apply',
        data: formData,
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
        endpoint: 'Product/Evaluate',
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
Future<ResponseWrapper<bool>> newRateOrder(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Order/Evaluate',
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

  Future<ResponseWrapper<bool>> cancelOrder(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Order/Cancel',
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


  Future<ResponseWrapper<List<MyPointsModel>>> getMyPoints(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'Mall/GetMyPoints',
        queryParameters: params,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          final list = List<dynamic>.of(response.data)
              .map<MyPointsModel>((e) => MyPointsModel.fromJson(e))
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
        endpoint: 'Product/ChangeFavouriteStatus',
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
        endpoint:'Product/GetAllFavourites',
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
