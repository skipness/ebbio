import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebbio/model/hp.dart';
import 'package:ebbio/widget/carousel/carousel_cell.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<Featured> featured;

  Carousel({@required this.featured});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      sliver: SliverToBoxAdapter(
        child: CarouselSlider(
            height: 230,
            autoPlay: false,
            viewportFraction: 0.9,
            initialPage: 0,
            enableInfiniteScroll: false,
            items: featured
                .map(
                  (featured) => CarouselCell(featured: featured),
                )
                .toList()),
      ),
    );
  }
}
