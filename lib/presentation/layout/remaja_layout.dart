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
          router.push('/login-kader/dashboard-remaja');
          break;
        case 1:
          break;
        case 2:
          break;
        case 4:
          router.push('/');
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
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: GlobalTheme().primaryColor,
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
            label: 'Remaja',
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
