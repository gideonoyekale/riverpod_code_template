import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CountDownHook extends Hook<ValueNotifier<int>> {
  final int value;
  const CountDownHook(this.value, {Key? key}) : super(keys: const []);

  @override
  HookState<ValueNotifier<int>, CountDownHook> createState() =>
      _CountDownHookState();
}

class _CountDownHookState extends HookState<ValueNotifier<int>, CountDownHook> {
  late final ValueNotifier<int> _remTime = ValueNotifier<int>(hook.value)
    ..addListener(_listener);
  late Timer _timer;

  @override
  void initHook() {
    super.initHook();
    start();
  }

  _listener() {
    setState(() {});
    start();
  }

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_remTime.value == 0) {
        t.cancel();
      } else {
        _remTime.value = _remTime.value - 1;
        setState(() {});
      }
    });
  }

  @override
  ValueNotifier<int> build(BuildContext context) => _remTime;

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _remTime.dispose();
    // Console.log('CountDownHook', 'CountDownHook disposed');
  }
}

ValueNotifier<int> useCountDown(int value) {
  return use(CountDownHook(value));
}
