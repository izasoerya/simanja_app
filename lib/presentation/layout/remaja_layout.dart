import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/provider/provider_index_page.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class LayoutRemaja extends ConsumerStatefulWidget {
  final Widget child;
  const LayoutRemaja({super.key, required this.child});

  @override
  ConsumerState<LayoutRemaja> createState() => _LayoutRemajaState();
}

class _LayoutRemajaState extends ConsumerState<LayoutRemaja> {
  void _onItemTapped(int index) {
    setState(() {
      ref.watch(pageIndexProvider.notifier).state = index;
      switch (ref.watch(pageIndexProvider)) {
        case 0:
          router.go('/login-remaja/dashboard-remaja');
          ref.watch(pageIndexProvider.notifier).state = 0;
          break;
        case 1:
          router.push('/login-remaja/result-health-remaja');
          ref.watch(pageIndexProvider.notifier).state = 1;
          break;
        case 2:
          router.push('/login-remaja/account-remaja');
          ref.watch(pageIndexProvider.notifier).state = 2;
          break;
      }
      print(ref.watch(pageIndexProvider));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.child),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const GlobalTheme().primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: ref.watch(pageIndexProvider),
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_saver_on_rounded),
            label: 'Data Kesehatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
