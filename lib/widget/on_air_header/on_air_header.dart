import 'package:ebbio/page/anime_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnAirHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '近期更新',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Theme.of(context).textTheme.headline.fontSize,
                  fontWeight: FontWeight.bold),
            ),
            CupertinoButton(
              child: const Text(
                '全部動畫',
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AnimeListPage(),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
