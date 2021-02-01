import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/dota/repositories/player_profile_repo.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/dota/usecases/player_profile_usecases.dart';
import 'package:flutter_architecture/presentation/profile/bloc/profile_bloc.dart';
import 'package:flutter_architecture/presentation/profile/ui/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileRoute extends RouteDefine {
  static const id = 'profile';

  @override
  List<Path> initRoute(Object arguments) => [
        Path(
            name: id,
            builder: (_) => BlocProvider(
                create: (_) => ProfileBloc(
                    id: arguments,
                    playerProfileUseCases:
                        PlayerProfileUseCases(getIt<PlayerProfileRepo>())),
                child: ProfileScreen(
                  accountId: arguments,
                ))),
      ];
}
