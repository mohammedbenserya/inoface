import 'package:inoface/core/util/generateMaterialColor.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class PlayVideoFit extends StatefulWidget {
  final String url;
  const PlayVideoFit({Key? key, required this.url}) : super(key: key);

  @override
  _PlayVideoFitState createState() => _PlayVideoFitState();
}

class _PlayVideoFitState extends State<PlayVideoFit> {

  YoutubePlayerController? _youtubePlayer;

  String? convertUrlToId(String url) {
    final regex = RegExp(r'.*\?v=(.+?)($|[\&])', caseSensitive: false);
    try {
      if (regex.hasMatch(url)) {
        return regex.firstMatch(url)!.group(1);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    if (widget.url.contains('//youtu.')) {
      String? videoId = YoutubePlayer.convertUrlToId(widget.url);
      _youtubePlayer = YoutubePlayerController(
        initialVideoId: '$videoId',
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    } else if (widget.url.contains('youtube.com/')) {
      final result = convertUrlToId(widget.url);
      if (result != null) {
        final url = 'https://www.youtube.com/embed/$result';
        String? videoId = YoutubePlayer.convertUrlToId(url);
        _youtubePlayer = YoutubePlayerController(
          initialVideoId: videoId ?? result,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
          ),
        );
      }
    }
  }


  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]
    );
    _youtubePlayer?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.clear,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
      ),
      body: (_youtubePlayer != null) ?
      Center(
        child: Container(
          height: Get.height,
          width: Get.width,
          color: backgroundColor,
          // color: Colors.black45,
          child: Center(
            child: YoutubePlayer(
              controller: _youtubePlayer!,
              showVideoProgressIndicator: true,
              progressColors: const ProgressBarColors(
                playedColor: Colors.pink,
                handleColor: Colors.pink,
              ),
            ),
          ),
        ),
      ) : Center(
        child: Text('no_results_found'.tr),
      )
    );
  }
}
