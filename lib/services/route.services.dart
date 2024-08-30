import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

abstract class RouteService {
  Future push(PageRouteInfo<dynamic> route, BuildContext context);
  Future<void> pop(BuildContext context);
  Future<void> popWithResult(BuildContext context, Object val);
  Future<void> replace(PageRouteInfo<dynamic> route, BuildContext context);
  Future<void> pushAndPopUntil(
    PageRouteInfo<dynamic> route,
    BuildContext context,
  );
}

class RouteServiceImpl implements RouteService {
  @override
  Future push(PageRouteInfo<dynamic> route, BuildContext context) async {
    return await context.router.push(
      route,
      onFailure: (NavigationFailure failure) {},
    );
  }

  @override
  Future<void> pop(BuildContext context) async => await context.router.pop();

  @override
  Future<void> popWithResult(BuildContext context, Object val) async {
    await context.router.pop(val);
  }

  @override
  Future<void> replace(PageRouteInfo<dynamic> route, context) async {
    await context.router.replace(
      route,
      onFailure: (NavigationFailure failure) {},
    );
  }

  @override
  Future<void> pushAndPopUntil(
    PageRouteInfo<dynamic> route,
    BuildContext context,
  ) async {
    await context.router.pushAndPopUntil(
      route,
      predicate: (p) => false,
      onFailure: (NavigationFailure failure) {},
    );
  }
}
