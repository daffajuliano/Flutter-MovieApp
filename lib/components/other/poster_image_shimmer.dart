import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PosterImageShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Container(
        width: 140,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
