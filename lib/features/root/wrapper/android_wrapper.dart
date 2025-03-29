import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AndroidWrapper extends StatefulWidget {
  final Widget child;
  final int currentTabIndex;
  final ValueChanged<int>? onTabSelected;

  const AndroidWrapper({
    super.key,
    required this.child,
    this.currentTabIndex = 0,
    this.onTabSelected,
  });

  @override
  _AndroidWrapperState createState() => _AndroidWrapperState();
}

class _AndroidWrapperState extends State<AndroidWrapper> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Set status bar style.
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(context),
      appBar: _buildAppBar(context),
      // Place the custom bottom navigation in a Stack over the body.
      body: Stack(
        children: [
          Positioned.fill(child: widget.child),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildCustomBottomNav(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomBottomNav(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavIcon(iconData: Icons.home_outlined, index: 0),
            _buildNavIcon(iconData: Icons.search_outlined, index: 1),
            _buildNavIcon(iconData: Icons.add_circle_outline, index: 2),
            _buildNavIcon(iconData: Icons.chat_bubble_outline, index: 3),
            _buildNavIcon(iconData: Icons.workspace_premium_outlined, index: 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavIcon({required IconData iconData, required int index}) {
    final bool isActive = widget.currentTabIndex == index;
    return GestureDetector(
      onTap: () {
        if (widget.onTabSelected != null) {
          widget.onTabSelected!(index);
        }
      },
      child: Icon(
        iconData,
        color: isActive ? Colors.white : Colors.white.withOpacity(0.6),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      // Remove default leading icon by adding this line:
      leading: Container(),

      backgroundColor: Colors.white,
      title: Image.asset(
        'lib/assets/images/logo_black.png', // Replace with your logo path.
        height: 40,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.store_outlined, color: Colors.black),
          onPressed: () {
            // TODO: Implement store action.
          },
        ),
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // You can still open the drawer manually here if needed
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ],
      elevation: 1,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Row(
                children: [
                  Image.asset('lib/assets/images/image.png', height: 40),
                  const SizedBox(width: 8),
                  // const Text(
                  //   'Menu',
                  //   style: TextStyle(color: Colors.white, fontSize: 20),
                  // ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to Home.
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to Settings.
              },
            ),
            // Add more drawer items here.
          ],
        ),
      ),
    );
  }
}
