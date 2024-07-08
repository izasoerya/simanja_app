import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simanja_app/presentation/screens/register.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalTheme().primaryColor,
      body: child,
    );
  }
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainLayout(child: RegisterPage());
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const Placeholder();
          },
        ),
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const Placeholder();
          },
        ),
      ],
    ),
  ],
);
