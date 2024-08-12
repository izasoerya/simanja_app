import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/provider/provider_index_page.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class LayoutKader extends ConsumerStatefulWidget {
  final Widget child;
  const LayoutKader({super.key, required this.child});

  @override
  ConsumerState<LayoutKader> createState() => _LayoutKaderState();
}

class _LayoutKaderState extends ConsumerState<LayoutKader> {
  void _onItemTapped(int index) {
    setState(() {
      ref.watch(pageIndexProvider.notifier).state = index;
      switch (ref.watch(pageIndexProvider)) {
        case 0:
          router.push('/login-kader/dashboard-kader');
          break;
        case 1:
          router.push('/login-kader/data-remaja-kader');
          break;
        case 2:
          router.push('/login-kader/activity-kader');
          break;
        case 3:
          router.push('/login-kader/management-kader');
          break;
        case 4:
          router.push('/login-kader/account-kader');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.child),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
            icon: Icon(Icons.people_sharp),
            label: 'Anggota',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Kegiatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            label: 'Kelola',
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
