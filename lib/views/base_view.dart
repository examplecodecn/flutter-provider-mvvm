import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/viewmodels/base_model.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {

  final Widget Function(BuildContext context, T model, Widget child) builder;

  final T model;
  final Widget child;
  final Function(T) onModelReady;

  BaseView({Key key, this.model, this.builder, this.child, this.onModelReady})
      : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model;

  @override
  void initState() {
    model = widget.model;
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
      create: (BuildContext context) {
        return model;
      },
    );
  }
}