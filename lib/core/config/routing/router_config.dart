class RouterConfiguration {
  RouterConfiguration.init();
  RouterConfiguration();
  final String kRootRoute = '/';
  final authRoutes = const _AuthRoutes._();
  final homeRoutes = _HomeRoutes();
  final categoryRoutes = _CategoryRoutes();



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

  final String department='department';

}

class _CategoryRoutes{
  final String categoryScreen='/gategory';
  final String detailsStoreScreen='detailsStore';
}


