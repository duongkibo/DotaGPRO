part of configuration;

void generateRoute(
    Map<String, WidgetBuilder> builders, RouteSettings settings) {
  LoginRoute().build(builders, settings);
  HomeRoute().build(builders, settings);
  SplashRoute().build(builders, settings);
  LeaderBoardRoute().build(builders, settings);
  MatchDetailRoute().build(builders, settings);
  ProfileRoute().build(builders, settings);
  SearchRoute().build(builders, settings);
  VideoRoute().build(builders, settings);
}

MaterialPageRoute manifest(RouteSettings settings) {
  final routeBuilders = <String, WidgetBuilder>{};
  generateRoute(routeBuilders, settings);
  final Widget Function(BuildContext context) routeBuilder =
      routeBuilders[settings.name];
  return MaterialPageRoute(
      builder: (context) => routeBuilder(context),
      settings: RouteSettings(name: settings.name));
}
