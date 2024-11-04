import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:luxe/screens/home/new_product_screen.dart';
import 'package:luxe/screens/home/product_screen.dart';
import 'package:luxe/utils/app_colors.dart';
import 'package:luxe/utils/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ProductScreen(),
    NewProductScreen(),
    const Center(child: Text('Coming Soon')),
    const Center(child: Text('Coming Soon')),
    const Center(child: Text('Coming Soon')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shadowColor: Colors.black.withOpacity(0.6),
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari produk...',
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_basket),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_sharp),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () async {
                final authService =
                    Provider.of<AuthService>(context, listen: false);
                await authService.deleteToken();
              },
              icon: const Icon(Icons.logout_rounded),
              color: Colors.white,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_label),
            label: 'Produk Baru',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call_sharp),
            label: 'Live & Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Saya',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
      body: _screens[_currentIndex],
    );
  }
}
