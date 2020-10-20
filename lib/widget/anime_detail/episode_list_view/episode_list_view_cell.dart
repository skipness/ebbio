import 'package:ebbio/model/anime_detail.dart';
import 'package:ebbio/network/api_provider.dart';
import 'package:ebbio/page/player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EpisodeListViewCell extends StatelessWidget {
  final Episode episode;

  EpisodeListViewCell({@required this.episode});

  _onTap(BuildContext context) async {
    final url = episode.sl;
    final isVideoPlayable = await ApiProvider().checkVideoPlayable(url);
    print(isVideoPlayable);
    if (isVideoPlayable) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => Player(
            url: url,
          ),
        ),
      );
    } else {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: const Text('未能播放影片'),
                content: const Text(
                    '由於目前正值高峰時段，ebb正實施人流限制措施，影片播放只開放予已登入用戸。\n\n請暫時使用網頁版ebb播放任何影片'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text('確定'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final createdAt =
        DateFormat("h:mm a MMM d").format(DateTime.parse(episode.createdAt));
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${episode.title}',
            style: TextStyle(
                color: const Color.fromRGBO(255, 255, 255, 0.9),
                fontSize: textTheme.headline6.fontSize),
          ),
          Text(createdAt,
              style: TextStyle(fontSize: textTheme.subtitle2.fontSize))
        ],
      ),
      onTap: () => _onTap(context),
    );
  }
}
