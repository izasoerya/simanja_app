import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simanja_app/presentation/screens/kader/home.dart';
import 'package:simanja_app/presentation/screens/kader/login_kader.dart';
import 'package:simanja_app/presentation/screens/remaja/login_remaja.dart';
import 'package:simanja_app/presentation/screens/remaja/register_remaja.dart';
import 'package:simanja_app/presentation/screens/kader/register_kader.dart';
import 'package:simanja_app/presentation/screens/welcome.dart';
import 'package:simanja_app/presentation/layout/auth_layout.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const AuthLayout(child: WelcomePage());
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login-remaja',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthLayout(child: LoginRemajaPage());
          },
        ),
        GoRoute(
          path: 'register-remaja',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthLayout(child: RegisterRemajaPage());
          },
        ),
        GoRoute(
          path: 'login-kader',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthLayout(child: LoginKaderPage());
          },
        ),
        GoRoute(
          path: 'register-kader',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthLayout(child: RegisterKaderPage());
          },
        ),
        GoRoute(
          path: 'dashboard-kader',
          builder: (BuildContext context, GoRouterState state) {
            return const DashboardKader();
          },
        ),
      ],
    ),
  ],
);
