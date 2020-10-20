import 'package:ebbio/model/anime_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimeSeasonHeader extends StatelessWidget {
  final List<Season> seasons;
  final String seasonTitle;
  final int currentSelectedIndex;
  final Function(int) onSeasonChange;

  AnimeSeasonHeader(
      {@required this.seasons,
      @required this.seasonTitle,
      @required this.currentSelectedIndex,
      @required this.onSeasonChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: seasons.length,
        itemBuilder: (BuildContext context, int index) {
          return CupertinoButton(
              child: Container(
                decoration: currentSelectedIndex == index
                    ? BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                        color: CupertinoTheme.of(context).primaryColor,
                        width: 4.0,
                      )))
                    : null,
                padding: const EdgeInsets.only(bottom: 3.0),
                child: Text(
                  '${seasons[index].seasonTitle}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              onPressed: () => onSeasonChange(index));
        },
      ),
    );
  }
}
