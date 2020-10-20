import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class Player extends StatefulWidget {
  final String url;

  Player({@required this.url});

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  IjkMediaController controller = IjkMediaController();

  @override
  void initState() {
    super.initState();
    initialPlayer();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> initialPlayer() async {
    await controller.setNetworkDataSource(widget.url);
    await controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 0,
      child: IjkPlayer(mediaController: controller),
    );
  }
}
