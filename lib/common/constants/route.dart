abstract class EndPoints {
  EndPoints._();

  // static const baseUrl = "http://192.168.1.250:86";
  static const baseUrl = "http://3.214.164.25:92/api/";
  static const address = "http://3.214.164.25:92/";
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

  final register = 'Account/CustomerRegister';
  final  confirm = 'Account/ConfirmCode';
  final updateUserInfo='Customer/UpdateUserAddressInfo';
  final refreshToken='Customer/RefreshToken';
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
  final getAllHome = 'Customer/GetCustomerHomeData';
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

  final getUserInfo='Customer/GetCustomerInfo';
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

