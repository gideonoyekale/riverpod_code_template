import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/cores.dart';
import 'widgets.dart';

class AppLoadingShimmer extends StatelessWidget {
  const AppLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (c, i) {
        return Shimmer(
          gradient: Palette.shimmerGradient,
          child: AppRectangle(
            radius: 12,
            width: double.maxFinite,
            height: 120.h,
            color: Palette.white,
          ),
        );
      },
      separatorBuilder: (c, i) => const Spacing.mediumHeight(),
      itemCount: 10,
    );
  }
}
