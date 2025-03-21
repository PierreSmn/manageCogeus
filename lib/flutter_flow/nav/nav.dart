import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';


import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeWidget() : SigninWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : SigninWidget(),
        ),
        FFRoute(
          name: SigninWidget.routeName,
          path: SigninWidget.routePath,
          builder: (context, params) => SigninWidget(),
        ),
        FFRoute(
          name: InfosWidget.routeName,
          path: InfosWidget.routePath,
          requireAuth: true,
          builder: (context, params) => InfosWidget(),
        ),
        FFRoute(
          name: UpdateProfileWidget.routeName,
          path: UpdateProfileWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UpdateProfileWidget(),
        ),
        FFRoute(
          name: SignupWidget.routeName,
          path: SignupWidget.routePath,
          builder: (context, params) => SignupWidget(
            brandId: params.getParam(
              'brandId',
              ParamType.int,
            ),
            clid: params.getParam(
              'clid',
              ParamType.int,
            ),
            np1: params.getParam(
              'np1',
              ParamType.int,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CreateProfileWidget.routeName,
          path: CreateProfileWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CreateProfileWidget(
            clid: params.getParam(
              'clid',
              ParamType.int,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TriageWidget.routeName,
          path: TriageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => TriageWidget(),
        ),
        FFRoute(
          name: AnalyticsWidget.routeName,
          path: AnalyticsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AnalyticsWidget(),
        ),
        FFRoute(
          name: AssetsWidget.routeName,
          path: AssetsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AssetsWidget(),
        ),
        FFRoute(
          name: WidgetsWidget.routeName,
          path: WidgetsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => WidgetsWidget(),
        ),
        FFRoute(
          name: HarvestersWidget.routeName,
          path: HarvestersWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HarvestersWidget(),
        ),
        FFRoute(
          name: ForgotpasswordWidget.routeName,
          path: ForgotpasswordWidget.routePath,
          builder: (context, params) => ForgotpasswordWidget(),
        ),
        FFRoute(
          name: NewpasswordWidget.routeName,
          path: NewpasswordWidget.routePath,
          requireAuth: true,
          builder: (context, params) => NewpasswordWidget(),
        ),
        FFRoute(
          name: InvalidsWidget.routeName,
          path: InvalidsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => InvalidsWidget(),
        ),
        FFRoute(
          name: HostLibraryCopyWidget.routeName,
          path: HostLibraryCopyWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HostLibraryCopyWidget(),
        ),
        FFRoute(
          name: RetoursATrierWidget.routeName,
          path: RetoursATrierWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RetoursATrierWidget(),
        ),
        FFRoute(
          name: RetoursWidget.routeName,
          path: RetoursWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RetoursWidget(),
        ),
        FFRoute(
          name: AssetsCopyWidget.routeName,
          path: AssetsCopyWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AssetsCopyWidget(),
        ),
        FFRoute(
          name: ParamWidget.routeName,
          path: ParamWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ParamWidget(),
        ),
        FFRoute(
          name: CreateProfileClientWidget.routeName,
          path: CreateProfileClientWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CreateProfileClientWidget(),
        ),
        FFRoute(
          name: ExperienceWidget.routeName,
          path: ExperienceWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ExperienceWidget(
            xid: params.getParam(
              'xid',
              ParamType.int,
            ),
            t1: params.getParam(
              't1',
              ParamType.String,
            ),
            t2: params.getParam(
              't2',
              ParamType.String,
            ),
            t3: params.getParam(
              't3',
              ParamType.String,
            ),
            t4: params.getParam(
              't4',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RecontactWidget.routeName,
          path: RecontactWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RecontactWidget(),
        ),
        FFRoute(
          name: TremorTestWidget.routeName,
          path: TremorTestWidget.routePath,
          requireAuth: true,
          builder: (context, params) => TremorTestWidget(),
        ),
        FFRoute(
          name: OnboardWidget.routeName,
          path: OnboardWidget.routePath,
          requireAuth: true,
          builder: (context, params) => OnboardWidget(
            setupmail: params.getParam(
              'setupmail',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: HomeCopy2Widget.routeName,
          path: HomeCopy2Widget.routePath,
          requireAuth: true,
          builder: (context, params) => HomeCopy2Widget(),
        ),
        FFRoute(
          name: FeedbacksWidget.routeName,
          path: FeedbacksWidget.routePath,
          requireAuth: true,
          builder: (context, params) => FeedbacksWidget(),
        ),
        FFRoute(
          name: ExperiencesWidget.routeName,
          path: ExperiencesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ExperiencesWidget(),
        ),
        FFRoute(
          name: IntegrationsWidget.routeName,
          path: IntegrationsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => IntegrationsWidget(),
        ),
        FFRoute(
          name: FeedAnecdotesWidget.routeName,
          path: FeedAnecdotesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => FeedAnecdotesWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/signin';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitRing(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
