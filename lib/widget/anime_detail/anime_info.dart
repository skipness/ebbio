import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbio/widget/anime_detail/ebb_chip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnimeInfo extends StatefulWidget {
  final String author;
  final String lastUpdated;
  final String studio;

  AnimeInfo(
      {@required this.author,
      @required this.lastUpdated,
      @required this.studio});

  @override
  _AnimeInfoState createState() => _AnimeInfoState();
}

class _AnimeInfoState extends State<AnimeInfo> {
  AutoSizeGroup autoSizeGroup;

  @override
  void initState() {
    super.initState();
    autoSizeGroup = AutoSizeGroup();
  }

  Padding _buildDot() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: AutoSizeText(
        '·',
        group: autoSizeGroup,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _buildStudioChip(List<String> studios) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: studios
            .map(
              (String studio) => EbbChip(
                autoSizeGroup: autoSizeGroup,
                borderRadius: BorderRadius.circular(15.0),
                color: const Color.fromRGBO(1, 1, 1, 1),
                text: studio,
                textColor: const Color.fromRGBO(255, 255, 255, 0.65),
              ),
            )
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    final formatedLastUpdatedTime =
        DateFormat("yyyy-MM-dd").format(DateTime.parse(widget.lastUpdated));
    final studios = widget.studio.split(',,');
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AutoSizeText(
            '${widget.author}',
            group: autoSizeGroup,
            minFontSize: 14,
            maxFontSize: 16,
            style: TextStyle(fontSize: 14),
          ),
          _buildDot(),
          _buildStudioChip(studios),
          _buildDot(),
          AutoSizeText(
            '$formatedLastUpdatedTime',
            group: autoSizeGroup,
          ),
        ],
      ),
    );
  }
}
