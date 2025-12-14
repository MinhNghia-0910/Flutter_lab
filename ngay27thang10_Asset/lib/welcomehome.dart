import 'package:flutter/material.dart';

class WelcomeHome extends StatelessWidget {
  const WelcomeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: myBody()));
  }

  Widget myBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            topBar(),
            const SizedBox(height: 20),
            welcomeText(),
            const SizedBox(height: 16),
            searchField(),
            const SizedBox(height: 24),
            sectionTitle('Saved Places'),
            const SizedBox(height: 12),
            gridSavedPlaces(),
          ],
        ),
      ),
    );
  }


  Widget topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
          tooltip: 'Notifications',
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.extension), 
          tooltip: 'Extensions',
        ),
      ],
    );
  }

  Widget welcomeText() {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Welcome,\n',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: Colors.black,
              height: 1.1,
            ),
          ),
          TextSpan(
            text: 'Charlie',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w100,
              color: Colors.black,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget searchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 12,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1.2, color: Color(0xFF9AC7F2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1.8, color: Color(0xFF4A90E2)),
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    );
  }

  Widget gridSavedPlaces() {
    final paths = const [
      'assets/placepng/france.png',
      'assets/placepng/hochiminh.png',
      'assets/placepng/japan-PNG.png',
      'assets/placepng/rome.png',
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.6, 
      children: paths.map(_placeCard).toList(),
    );
  }

  Widget _placeCard(String assetPath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        errorBuilder: (context, _, __) {
          return Container(
            color: const Color(0xFFEFEFEF),
            alignment: Alignment.center,
            child: const Icon(Icons.image_not_supported),
          );
        },
      ),
    );
  }
}
