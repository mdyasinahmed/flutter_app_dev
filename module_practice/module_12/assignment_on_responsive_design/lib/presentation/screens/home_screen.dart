import 'package:flutter/material.dart';
import '../utils/text_styles.dart';
import '../widgets/app_bar_title.dart';
import '../widgets/drawer_content.dart';
import '../widgets/responsive_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _navigateToScheduleScreen() {
      Navigator.pushNamed(context, '/schedule_screen');
    }

    void _navigateToMessageScreen() {
      Navigator.pushNamed(context, '/message_screen');
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: AppBar(
            title: MediaQuery.of(context).size.width <= 640
                ? Align(
              alignment: Alignment.centerRight,
              child: const AppBarTitle(title: 'Flutter\nWorld'),
            )
                : const AppBarTitle(title: 'Flutter\nWorld'),
            backgroundColor: Colors.transparent,
            centerTitle: false,
            actions: MediaQuery.of(context).size.width > 640
                ? [
              TextButton(
                onPressed: _navigateToScheduleScreen,
                child: const Text(
                  'Schedule',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: _navigateToMessageScreen,
                child: const Text(
                  'Message',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 16),
            ]
                : null,
            elevation: 0,
          ),
        ),
      ),
      drawer: MediaQuery.of(context).size.width <= 640
          ? const Drawer(
        child: SafeArea(
          child: DrawerContent(),
        ),
      )
          : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: ResponsiveBuilder(
            mobile: _buildMobileContent(context),
            tablet: _buildTabletContent(context),
            desktop: _buildDesktopContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'FLUTTER WEB.\n THE BASICS',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod turpis rhoncus felis rhoncus sollicitudin. Mauris quam turpis, faucibus in libero nec, tristique suscipit lorem. Sed et lacinia libero, at placerat nisi. Sed et lacinia libero, at placerat nisi.',
          style: TextStyles.getParagraph(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF11CF83),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: const Text(
            'Let\'s Explore',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildTabletContent(BuildContext context) {
    return _buildMobileContent(context);
  }

  Widget _buildDesktopContent(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FLUTTER WEB.\nTHE BASICS',
                style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod turpis rhoncus felis rhoncus sollicitudin. Mauris quam turpis, faucibus in libero nec, tristique suscipit lorem. Sed et lacinia libero, at placerat nisi. Sed et lacinia libero, at placerat nisi.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1BE28D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: const Text(
                  'Let\'s Explore',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
