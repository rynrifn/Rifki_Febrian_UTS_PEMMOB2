import 'package:flutter/material.dart';
import 'map_page.dart';
import 'places_list_page.dart';
import 'about_page.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    const HomeContent(),
    const MapPage(),
    const PlacesListPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Apakah Anda yakin ingin logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'ExploreMap',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: _openDrawer,
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
        ],
      ),
      drawer: CustomDrawer(
        onHomeTap: () {
          setState(() {
            _currentIndex = 0;
          });
          Navigator.pop(context);
        },
        onMapTap: () {
          setState(() {
            _currentIndex = 1;
          });
          Navigator.pop(context);
        },
        onPlacesTap: () {
          setState(() {
            _currentIndex = 2;
          });
          Navigator.pop(context);
        },
        onLogoutTap: _logout,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: _buildCustomBottomNav(),
    );
  }

  Widget _buildCustomBottomNav() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF6366F1),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == 0
                      ? const Color(0xFF6366F1).withOpacity(0.1)
                      : Colors.transparent,
                ),
                child: Icon(
                  _currentIndex == 0 ? Icons.home_rounded : Icons.home_outlined,
                  size: 24,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == 1
                      ? const Color(0xFF6366F1).withOpacity(0.1)
                      : Colors.transparent,
                ),
                child: Icon(
                  _currentIndex == 1 ? Icons.map_rounded : Icons.map_outlined,
                  size: 24,
                ),
              ),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == 2
                      ? const Color(0xFF6366F1).withOpacity(0.1)
                      : Colors.transparent,
                ),
                child: Icon(
                  _currentIndex == 2
                      ? Icons.explore_rounded
                      : Icons.explore_outlined,
                  size: 24,
                ),
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == 3
                      ? const Color(0xFF6366F1).withOpacity(0.1)
                      : Colors.transparent,
                ),
                child: Icon(
                  _currentIndex == 3
                      ? Icons.person_rounded
                      : Icons.person_outlined,
                  size: 24,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // Welcome Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang! 👋',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Jelajahi tempat menarik di sekitar Anda',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.search_rounded, color: Colors.grey[500], size: 24),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari tempat menarik...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.tune_rounded,
                        color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Quick Actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fitur Utama',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                ),
                const SizedBox(height: 20),

                // Simple Grid
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildFeatureCard(
                            Icons.map_rounded,
                            'Peta Interaktif',
                            const Color(0xFF6366F1),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MapPage())),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildFeatureCard(
                            Icons.location_on_rounded,
                            'Lokasi Terdekat',
                            const Color(0xFF10B981),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildFeatureCard(
                            Icons.explore_rounded,
                            'Jelajahi Tempat',
                            const Color(0xFFF59E0B),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PlacesListPage())),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildFeatureCard(
                            Icons.favorite_rounded,
                            'Favorit Saya',
                            const Color(0xFFEF4444),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Popular Places
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tempat Populer',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlacesListPage()),
                        );
                      },
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(
                          color: Color(0xFF6366F1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildPlaceCard(
                          'Monas', 'Jakarta', 4.8, const Color(0xFF6366F1)),
                      const SizedBox(width: 16),
                      _buildPlaceCard('TMII', 'Jakarta Timur', 4.5,
                          const Color(0xFF10B981)),
                      const SizedBox(width: 16),
                      _buildPlaceCard('Kota Tua', 'Jakarta Barat', 4.3,
                          const Color(0xFFF59E0B)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, Color color,
      {VoidCallback? onTap}) {
    return SizedBox(
      height: 120,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceCard(
      String name, String location, double rating, Color color) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: color.withOpacity(0.1),
            ),
            child: Center(
              child: Icon(Icons.location_on_rounded, size: 40, color: color),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star_rounded,
                        color: Colors.amber, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _navigateToAbout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person_rounded,
                    size: 60,
                    color: Color(0xFF6366F1),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'RIFKI FEBRIAN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'NPM: 23552011430',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Premium Member',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('128', 'Tempat Dikunjungi'),
              _buildStatItem('24', 'Favorit'),
              _buildStatItem('12', 'Ulasan'),
            ],
          ),
          const SizedBox(height: 32),
          Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                _buildMenuTile(
                  Icons.person_outline_rounded,
                  'Edit Profil',
                  Colors.blue,
                  onTap: () {},
                ),
                const Divider(height: 1),
                _buildMenuTile(
                  Icons.settings_outlined,
                  'Pengaturan',
                  Colors.grey,
                  onTap: () {},
                ),
                const Divider(height: 1),
                _buildMenuTile(
                  Icons.help_outline_rounded,
                  'Bantuan & Support',
                  Colors.green,
                  onTap: () {},
                ),
                const Divider(height: 1),
                _buildMenuTile(
                  Icons.info_outline_rounded,
                  'Tentang Aplikasi',
                  Colors.orange,
                  onTap: () => _navigateToAbout(context),
                ),
                const Divider(height: 1),
                _buildMenuTile(
                  Icons.logout_rounded,
                  'Logout',
                  Colors.red,
                  isLogout: true,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6366F1),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuTile(
    IconData icon,
    String title,
    Color color, {
    bool isLogout = false,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: isLogout ? Colors.red : Colors.black87,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded,
          size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
