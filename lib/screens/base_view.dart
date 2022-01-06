import 'package:flutter/material.dart';
import 'package:instalment/locator.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child)? builder;
  final Function(T, Function(int), List<AnimationController>)? initController;
  final Function(T)? onModelReady;
  final Function(T)? onFinish;

  BaseView(
      {this.builder, this.onModelReady, this.onFinish, this.initController});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>>
    with TickerProviderStateMixin {
  T model = locator<T>();
  final List<AnimationController> _controllers = [];

  @override
  void initState() {
    if (widget.initController != null) {
      widget.initController!(model, newController, _controllers);
    }
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (widget.onModelReady != null) {
        widget.onModelReady!(model);
      }
    });
  }

  AnimationController newController(int duration) {
    var cont = AnimationController(
      vsync: this,
      duration: Duration(seconds: duration), // <-- Set your duration here.
    );
    _controllers.add(cont);

    return cont;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (context) => model,
        child: Consumer<T>(builder: widget.builder!));
  }

  @override
  void dispose() {
    widget.onFinish?.call(model);
    super.dispose();
  }
}
