import 'package:demo_app_architecture/core/domain/model/displayable_failure.dart';
import 'package:demo_app_architecture/features/widgets/error_widget.dart';
import 'package:demo_app_architecture/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:demo_app_architecture/features/widgets/error_widget.dart'
    as error_widget;

class AppNavigator {
  final AppRouter appRouter;
  static final notifier = error_widget.ErrorNotifier();
  static final key = GlobalKey<State>();

  AppNavigator(this.appRouter);

  BuildContext? get context =>
      appRouter.routerDelegate.navigatorKey.currentContext;

  void push(
    String path, {
    bool useRoot = false,
    Object? arguments,
  }) {
    if (context == null) {
      throw Exception('AppNavigator: context is null');
    }
    appRouter.push(path, extra: arguments);
  }

  void go(String path, {bool useRoot = false, Object? arguments}) {
    if (context == null) {
      throw Exception('AppNavigator: context is null');
    }
    appRouter.go(path, extra: arguments);
  }

  void pushReplacement(
    String path, {
    Object? arguments,
  }) {
    if (context == null) {
      throw Exception('AppNavigator: context is null');
    }
    appRouter.pushReplacement(path, extra: arguments);
  }

  void close({
    BuildContext? context,
  }) =>
      closeWithResult(null, context: context);

  void closeWithResult<T>(
    T result, {
    BuildContext? context,
  }) {
    if (appRouter.canPop()) {
      appRouter.pop(result);
    }
  }

  Future<void> showSnackbar(
      {required String message, BuildContext? context}) async {
    final snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );

    ScaffoldMessenger.of(context ?? this.context!).showSnackBar(snackbar);
  }

  Future<void> showError(
    DisplayableFailure failure, {
    BuildContext? context,
    error_widget.ErrorDialogShowMode showMode =
        error_widget.ErrorDialogShowMode.ignoreIfAlreadyVisible,
    VoidCallback? onDismiss,
  }) {
    if (key.currentState != null) {
      switch (showMode) {
        case ErrorDialogShowMode.ignoreIfAlreadyVisible:
          return Future.value();
        case ErrorDialogShowMode.overrideCurrent:
          notifier.addFailure(failure);
          return Future.value();
        case ErrorDialogShowMode.showAfterCurrent:
          context?.pop();
          notifier.addFailure(failure);
          return showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
            ),
            context: context ?? this.context!,
            builder: (BuildContext context) {
              return error_widget.ErrorWidget(
                key: key,
                notifier: notifier,
                onTapAction: () => close(context: context),
              );
            },
          );
      }
    } else {
      notifier.addFailure(failure);
      return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        context: context ?? this.context!,
        builder: (BuildContext context) {
          return error_widget.ErrorWidget(
            key: key,
            notifier: notifier,
            onTapAction: () => close(context: context),
          );
        },
      );
    }
  }
}
