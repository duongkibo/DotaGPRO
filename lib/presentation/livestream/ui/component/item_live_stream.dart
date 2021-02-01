import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/livestream//model/live_streams.dart';

class ItemLiveStream extends StatelessWidget {
  LiveStreams liveStreams;

  ItemLiveStream({this.liveStreams});

  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    String thumnailUrl = liveStreams.thumbnailUrl.replaceAll('{width}', '600');
    String urlImage = thumnailUrl.replaceAll('{height}', '800');
    print(urlImage);
    return Container(
      margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 11,
              child: Stack(children: [
                SizedBox(
                  width: size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      '$urlImage',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    top: -140,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.videocam,
                          color: Colors.red,
                        ),
                        Text(
                          'Live: ${liveStreams.viewerCount}',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )
                      ],
                    )),
                Positioned(
                  top: 20,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.blueGrey,
                    size: 64,
                  ),
                )
              ]),
            ),
            Expanded(
              child: SizedBox(
                height: size.height,
              ),
            ),
            // size.width * 0.18 means it use 18% of total width
            Expanded(
                child: Text(
              '${liveStreams.userName}',
              style: TextStyle(color: Colors.white),
            )),
            Expanded(
              child: Text(
                '${liveStreams.title}',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
