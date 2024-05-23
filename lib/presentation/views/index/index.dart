import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_coding/presentation/views/home/home_view.dart';
import 'package:live_coding/presentation/views/index/app_drawer.dart';
import 'package:live_coding/presentation/widgets/custom_app_bar.dart';
import '../../../core/cores.dart';

class AppIndex extends ConsumerStatefulWidget {
  static const String path = '/home';

  const AppIndex({super.key});

  @override
  ConsumerState<AppIndex> createState() => _AppIndexState();
}

class _AppIndexState extends ConsumerState<AppIndex> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (val) async {},
      canPop: false,
      child: Scaffold(
        backgroundColor: Palette.white,
        appBar: CustomAppBar(
          leading: InkWell(
            onTap: () => _scaffoldKey.currentState?.openDrawer(),
            child: const Icon(Icons.menu),
          ),
        ),
        drawer: AppDrawer(_scaffoldKey),
        key: _scaffoldKey,
        body: const HomeView(),
      ),
    );
  }
}
