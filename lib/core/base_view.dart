import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_vm.dart';

class AppViewBuilder<T extends AppViewModel> extends StatefulWidget {
  const AppViewBuilder({
    Key? key,
    required this.model,
    required this.builder,
    this.child,
    this.initState,
  }) : super(key: key);

  final T model;
  final Widget? child;
  final Function(T model)? initState;
  final Widget Function(T model, Widget? child) builder;

  @override
  _AppViewBuilderState createState() => _AppViewBuilderState<T>();
}

class _AppViewBuilderState<E extends AppViewModel>
    extends State<AppViewBuilder<E>> {
  late E model;
  @override
  void initState() {
    model = widget.model;
    if (widget.initState != null) {
      widget.initState!(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<E>.value(
      value: model,
      child: Consumer<E>(
        builder: (BuildContext contxt, value, Widget? child) {
          return widget.builder(value, child);
        },
        child: widget.child,
      ),
    );
  }
}
