abstract class EndPoints {
  EndPoints._();

  // static const baseUrl = "http://192.168.1.250:86";
  static const baseUrl = "https://e8da-188-160-152-51.ngrok-free.app/api/Mobile/";
  static const address = "https://e8da-188-160-152-51.ngrok-free.app";
  static double latitude = 0;
  static double longitude = 0;
  // static const baseUrl = "http://192.168.1.250:86/api/";
  static const auth = _Auth();
  static const category = _Category();
  static const store = _Store();
  static const home = _Home();
  static const profile = _Profile();

  static const search=_Search();
  static const favorait=_Favorait();
  static const cart=_Cart();
  static const payment=_Payment();
}

class _Auth {
  const _Auth();

  final login = 'Customer/LogIn';
  final sign = 'Customer/SignUp';
  final updateUserInfo='Customer/Modify';
  final refreshToken='Customer/RefreshToken';
  final area='Location/GetAllAreas';
}

class _Search{
  const _Search();
  final search='Customer/GetCustomerSearch';
  final GetsearchWord='SearchWord/SearchWordGetAll';
  final setSearchWord='SearchWord/SearchWordSet';
  final deleteSearchWord='SearchWord/SearchWordDelete';
  final deleteAllSearchWord='SearchWord/SearchWordDeleteAll';
  final getVariant='Variant/VariantGetAll';
}

class _Category {
  const _Category();

  final getAllCategory = 'Category/CategoryGetAll';
  final getProductStore = 'Store/GetStoreProducts';
  final getStoreDetails = 'Store/GetStoreDetails';
}

class _Store {
  const _Store();

  final getAllStore = 'Store/GetAllStoresCp';
}

class _Home {
  const _Home();

  final getAllBanner = 'Banner/BannerGetAll';
  final getAllMoll = 'Mall/GetAll';
  final getHome = 'Home/Get';
  final getProductDetails = 'Product/GetProductDetails';
  final getProductByCategory = 'Product/GetProductByCategory';
  final getAllNotification = 'Notification/NotificationGetForUser';
}

class _Favorait{
  const _Favorait();
  final getFavoraitProduct='Customer/GetCustomerFavoriteProducts';
  final setFavoraitProduct='Customer/SetCustomerFavoriteProducts';
  final removeFavoraitProduct='Customer/RemoveProductFromFavorite';
}

class _Profile{
  const _Profile();
  final  confirm = 'Customer/ConfirmCode';

  final getUserInfo='Customer/GetMyProfile';
  final updateUserInfo='Customer/UpdateUserInfo';
  final MyOrderInfo='Order/GetCustomerOrders';
  final feedbackInfo='Feedback';
}

class _Cart{
  const _Cart();
  final postAddProductToCart='Order/AddProductToCart';
  final updateCartProductQty='Order/UpdateCartProductQty';
  final getCustomerOrder='Order/GetCustomerOrders';
  final postRemoveProductCart='Order/RemoveCartProduct';
  final getCustomerCart='Order/GetCustomerCart';
}

class _Payment{
  const _Payment();
  final actionOrderByAddress='Order/ActionOrderByAddress';
  final orderDetails='Order/GetOrderDetails';
  final cancelOrder='Order/CustomerCancelOrder';
  final shippingCompanyGetAll='ShippingCompany/ShippingCompanyGetAll';
  final actionOrderByShippingCompany='Order/ActionOrderByShippingCompany';
}

