import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget getShimmer(Widget shimmerChild) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300],
    highlightColor: Colors.grey[100],
    enabled: true,
    direction: ShimmerDirection.rtl,
    child: shimmerChild,
  );
}
