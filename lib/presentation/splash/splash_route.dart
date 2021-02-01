import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/presentation/splash/cubit/splash_cubit.dart';
import 'package:flutter_architecture/presentation/splash/ui/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashRoute extends RouteDefine {
  static const id = 'splash';

  @override
  List<Path> initRoute(Object arguments) {
    return [
      Path(
        name: id,
        builder: (_) => BlocProvider(
            create: (_) => getIt<SplashCubit>(), child: SplashScreens()),
      )
    ];
  }
}
