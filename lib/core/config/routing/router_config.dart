class RouterConfiguration {
  RouterConfiguration.init();
  RouterConfiguration();
  final String kRootRoute = '/';
  final authRoutes = const _AuthRoutes._();
  final homeRoutes = _HomeRoutes();
  final categoryRoutes = _CategoryRoutes();
  final favoraitRoutes = _FavoraitRoutes();
  final profileRoutes = _ProfileRoutes();
 final cartRoutes=_CartRoutes();
 final paymentRoutes=_PaymentRoutes();
 final searchRoutes=_SearchRoutes();


}

class _AuthRoutes{
  const _AuthRoutes._();

  final String login = '/login';
  final String signUp = 'signUp';
  final String welcome = '/welcome';
  final String location = '/location';
  final String verification  = 'verification';
  final String currentLocation='currentLocation';
  final String currentLocationCart='currentLocationCart';
}

class _HomeRoutes{

  final String homeScreen='/home';
  final String homeDetails='homeDetails';
  final String homeFullViewProduct='homeFullViewProduct';
  final String natificationScreen='notification';
  final String showMore='showMore';
  final String showMoreCategory='showMoreCategory';
  final String pageView='pageViewScreen';
}

class _CategoryRoutes{
  final String categoryScreen='/gategory';
  final String detailsStoreScreen='detailsStore';
}

class _FavoraitRoutes{
  final String favoraitScreen='/favorait';
}

class _ProfileRoutes {
  final String profileScreen = '/profile';
  final String myProfile='myProfile';
  final String suggestion='suggestion';
  final String myOrder='myOrder';
  final String Language='langauge';
  final String myOrderDetails='myOrderDetails';
  final String editProfile='editProfile';
  final String verificationProfile='verificationProfile';
}

class _CartRoutes{
  final String cartScreen='cart';
}

class _SearchRoutes{
  final String searchScreen='search';
  final String filterScreen='filter';
  final String openFilterScreen='openFilterScreen';
}

class _PaymentRoutes{
  final String RecevingScreen='reciving';
  final String locationReceving='locationReceving';
  final String paymentMethod='paymentMethod';
}

