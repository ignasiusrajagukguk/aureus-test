import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BaseBlocStateBuilder<B, S> = Widget Function(
  BuildContext context,
  B bloc,
  S state,
);

typedef BaseBlocStateListener<B, S> = void Function(
  BuildContext context,
  B bloc,
  S state,
);

typedef BaseBlocStateCondition<S> = bool Function(S previous, S next);

abstract class BaseBlocBuilder<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final BaseBlocStateBuilder<B, S> builder;
  final BaseBlocStateCondition<S>? buildWhen;
  const BaseBlocBuilder({Key? key, required this.builder, this.buildWhen})
      : super(key: key);

  @protected
  B bloc(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      builder: (context, state) => builder(
        context,
        bloc(context),
        state,
      ),
      buildWhen: (prev, next) => buildWhen?.call(prev, next) ?? true,
    );
  }
}

abstract class BaseBlocListener<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final BaseBlocStateListener<B, S> listener;
  final BaseBlocStateCondition<S>? listenWhen;
  final Widget? child;
  const BaseBlocListener({
    Key? key,
    required this.listener,
    this.listenWhen,
    this.child,
  }) : super(key: key);

  @protected
  B bloc(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      listener: (context, state) => listener(
        context,
        bloc(context),
        state,
      ),
      listenWhen: (prev, next) => listenWhen?.call(prev, next) ?? true,
      child: child,
    );
  }
}

abstract class BaseBlocConsumer<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final BaseBlocStateBuilder<B, S> builder;
  final BaseBlocStateListener<B, S> listener;
  final BaseBlocStateCondition<S>? listenWhen;
  final BaseBlocStateCondition<S>? buildWhen;
  const BaseBlocConsumer({
    Key? key,
    required this.builder,
    this.listenWhen,
    required this.listener,
    this.buildWhen,
  }) : super(key: key);

  @protected
  B bloc(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(
      listener: (context, state) => listener(
        context,
        bloc(context),
        state,
      ),
      listenWhen: (prev, next) => listenWhen?.call(prev, next) ?? true,
      builder: (context, state) => builder(context, bloc(context), state),
      buildWhen: (prev, next) => buildWhen?.call(prev, next) ?? true,
    );
  }
}
