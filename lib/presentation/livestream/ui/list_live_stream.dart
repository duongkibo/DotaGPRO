import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/livestream//model/live_streams.dart';
import 'package:flutter_architecture/presentation/leadership/ui/component/loading_page_list.dart';
import 'package:flutter_architecture/presentation/livestream/bloc/live_stream_bloc.dart';
import 'package:flutter_architecture/presentation/livestream/ui/component/item_live_stream.dart';
import 'package:flutter_architecture/presentation/playvideo/video_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListLiveStream extends StatefulWidget {
  @override
  _ListLiveStreamState createState() => _ListLiveStreamState();
}

class _ListLiveStreamState extends State<ListLiveStream> {
  LiveStreamBloc _bloc;
  @override
  void initState() {
    _bloc = context.read();
    _bloc.add(LoadLiveStreamEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<LiveStreamBloc, LiveStreamState>(
        listener: (context, state) {
          print(state);
        },
        builder: (context, state) {
          if (state is LiveStreamLoading) {
            return LoadingPageList();
          } else if (state is LiveStreamSuccess) {
            List<LiveStreams> lisLive = state.boxStream.listLiveStream;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.boxStream.listLiveStream.length,
                itemBuilder: (BuildContext context, int index) {
                  LiveStreams liveStreams = lisLive[index];
                  return Container(
                    child: GestureDetector(
                      child: SizedBox(
                          width: size.width * 0.5,
                          child: ItemLiveStream(
                            liveStreams: liveStreams,
                          )),
                      onTap: () {
                        Navigator.pushNamed(context, VideoRoute.id,
                            arguments: liveStreams.userName);
                      },
                    ),
                  );
                });
            ;
          } else {
            return Center(
              child: Text('helo'),
            );
          }
        },
      ),
    );
  }
}
