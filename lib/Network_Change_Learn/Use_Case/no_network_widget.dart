import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'network_change_manager.dart';

class NoNetworkWidget extends StatefulWidget {
  const NoNetworkWidget({Key? key}) : super(key: key);

  @override
  State<NoNetworkWidget> createState() => _NoNetworkWidgetState();
}

class _NoNetworkWidgetState extends State<NoNetworkWidget>
    with NetworkStateMixin {
  final String _noNetworkText = "İnternete bağlı değilsiniz";
  late final INetworkChangeManager _networkChangeManager;
  NetworkStation? _networkStation;
  @override
  void initState() {
    super.initState();
    _networkChangeManager = NetworkChangeManager();
    waitForDrawScreen(
      () {
        _networkChangeManager.handleNetworkChange(_updateView);
      },
    );
  }

  void fetchFirstResult() {
    waitForDrawScreen(() async {
      final NetworkStation station =
          await _networkChangeManager.checkNetworkFirstInit();
      _updateView(station);
    });
  }

  void _updateView(NetworkStation station) {
    _networkStation = station;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: context.durationLow,
      crossFadeState: _networkStation == NetworkStation.off
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: Container(
        height: 30,
        color: Colors.grey,
        child: Center(
            child: Text(
          _noNetworkText,
          style: context.textTheme.bodyMedium,
        )),
      ),
      secondChild: const SizedBox.shrink(),
    );
  }
}

mixin NetworkStateMixin<T extends StatefulWidget> on State<T> {
  void waitForDrawScreen(void Function() onComplate) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplate.call();
    });
  }
}
