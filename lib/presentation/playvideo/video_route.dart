import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/presentation/playvideo/cubit/video_cubit.dart';
import 'package:flutter_architecture/presentation/playvideo/ui/video_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoRoute extends RouteDefine {
  static const id = 'video';
  @override
  List<Path> initRoute(Object arguments) => [
        Path(
            name: id,
            builder: (_) => BlocProvider(
                create: (_) => getIt<VideoCubit>(),
                child: WebViewExample(name: arguments))),
      ];
}
