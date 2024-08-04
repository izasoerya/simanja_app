import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simanja_app/presentation/layout/kader_layout.dart';
import 'package:simanja_app/presentation/layout/remaja_layout.dart';
import 'package:simanja_app/presentation/layout/sub_page_layout.dart';
import 'package:simanja_app/presentation/screens/kader/activity_page.dart';
import 'package:simanja_app/presentation/screens/kader/checkup_summary.dart';
import 'package:simanja_app/presentation/screens/kader/edit_data_health_page.dart';
import 'package:simanja_app/presentation/screens/kader/list_remaja_checkup_page.dart';
import 'package:simanja_app/presentation/screens/kader/member_page.dart';
import 'package:simanja_app/presentation/screens/kader/rekap_checkup_result.dart';
import 'package:simanja_app/presentation/screens/remaja/dashboard_page.dart';
import 'package:simanja_app/presentation/screens/kader/dashboard_page.dart';
import 'package:simanja_app/presentation/screens/kader/login_page.dart';
import 'package:simanja_app/presentation/screens/remaja/login_page.dart';
import 'package:simanja_app/presentation/screens/remaja/register_page.dart';
import 'package:simanja_app/presentation/screens/kader/register_page.dart';
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
          path: 'register-remaja',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthLayout(child: RegisterRemajaPage());
          },
        ),
        GoRoute(
          path: 'register-kader',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthLayout(child: RegisterKaderPage());
          },
        ),
        GoRoute(
          path: 'login-remaja',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthLayout(child: LoginRemajaPage());
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'dashboard-remaja',
              builder: (BuildContext context, GoRouterState state) {
                return const LayoutRemaja(child: DashboardRemaja());
              },
            ),
          ],
        ),
        GoRoute(
          path: 'login-kader',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthLayout(child: LoginKaderPage());
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'dashboard-kader',
              builder: (BuildContext context, GoRouterState state) {
                return const LayoutKader(child: DashboardKader());
              },
            ),
            GoRoute(
              path: 'data-remaja-kader',
              builder: (BuildContext context, GoRouterState state) {
                return const LayoutKader(child: MemberPage());
              },
            ),
            GoRoute(
              path: 'activity-kader',
              builder: (BuildContext context, GoRouterState state) {
                return const LayoutKader(child: ActivityPage());
              },
            ),
            GoRoute(
              path: 'rekap-checkup',
              builder: (BuildContext context, GoRouterState state) {
                return SubPageLayout(
                  appBarTitle: 'REKAP KONDISI KESEHATAN REMAJA',
                  child: CheckupSummaryPage(
                      checkupUID: state.uri.queryParameters['checkupUID']!),
                );
              },
            ),
            GoRoute(
              path: 'rekap-checkup-result',
              builder: (BuildContext context, GoRouterState state) {
                final param = state.uri.queryParameters;
                return SubPageLayout(
                    appBarTitle: 'KONDISI REMAJA',
                    child: RekapCheckupResult(
                        checkupUID: param['checkupUID']!,
                        label: param['label']!));
              },
            ),
            GoRoute(
              path: 'list-remaja-checkup',
              builder: (BuildContext context, GoRouterState state) {
                return SubPageLayout(
                    appBarTitle: 'DAFTAR REMAJA',
                    child: ListRemajaCheckupPage(
                        checkupUID: state.uri.queryParameters['checkupUID']!));
              },
            ),
            GoRoute(
              path: 'account-remaja',
              builder: (BuildContext context, GoRouterState state) {
                return SubPageLayout(
                    appBarTitle: 'DETAIL AKUN', child: Placeholder());
              },
            ),
            GoRoute(
              path: 'edit-health-remaja',
              builder: (BuildContext context, GoRouterState state) {
                return SubPageLayout(
                  appBarTitle: 'INPUT CHECKUP',
                  child: EditDataHealthPage(
                      checkupUID: state.uri.queryParameters['checkupUID']!,
                      remajaUID: state.uri.queryParameters['remajaUID']!),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
