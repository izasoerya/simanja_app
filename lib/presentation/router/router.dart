import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simanja_app/presentation/screens/login.dart';
import 'package:simanja_app/presentation/screens/register.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({super.key, required this.child});

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
        return const AuthLayout(child: LoginPage());
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthLayout(child: LoginPage());
          },
        ),
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthLayout(child: RegisterPage());
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
