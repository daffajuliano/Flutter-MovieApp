import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PosterShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Container(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
            ),
            Container(
              width: double.infinity,
              height: 20,
              margin: const EdgeInsets.only(bottom: 8),
              color: Colors.grey[400],
            ),
            Container(
              height: 20,
              width: 60,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
