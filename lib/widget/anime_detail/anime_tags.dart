import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbio/model/anime_detail.dart';
import 'package:ebbio/widget/anime_detail/ebb_chip.dart';
import 'package:flutter/material.dart';

class AnimeTags extends StatelessWidget {
  final List<Tag> tags;
  final AutoSizeGroup autoSizeGroup = AutoSizeGroup();

  AnimeTags({Key key, this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: tags
            .map((tag) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: EbbChip(
                      autoSizeGroup: autoSizeGroup,
                      borderRadius: BorderRadius.circular(15.0),
                      color:
                          Color(0xFF000000 + int.parse(tag.color, radix: 16)),
                      text: tag.name),
                ))
            .toList(),
      ),
    );
  }
}
