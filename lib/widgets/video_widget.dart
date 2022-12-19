import 'package:app/model/media_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:collection/collection.dart';

import '../model/video_model.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key}) : super(key: key);
// BBAyRBTfsOU
  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool playerReady = false;
  @override
  Widget build(BuildContext context) {
    if (Provider.of<VideoModel>(context, listen: true).trailerLink.isNotEmpty) {
      print(Provider.of<VideoModel>(context, listen: true).trailerLink);
      if (Provider.of<VideoModel>(context, listen: true)
              .trailerLink
              .where((video) => video.name == "Official Trailer")
              .first
              .key !=
          null) {
        _controller = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(
              "https://www.youtube.com/watch?v=${Provider.of<VideoModel>(context, listen: true).trailerLink.where((video) => video.name == "Official Trailer").first.key}")!,
          flags: const YoutubePlayerFlags(
            showLiveFullscreenButton: false,
            mute: false,
            autoPlay: true,
            disableDragSeek: false,
            loop: false,
            isLive: false,
            forceHD: false,
            enableCaption: true,
          ),
        );
        playerReady = true;
      }
    }
    return playerReady == true
        ? YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
            onReady: () {
              _isPlayerReady = true;
            })
        : Container();
  }
}
