import 'package:flutter/material.dart';
import 'package:peraktheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Stay extends StatefulWidget {
  const Stay({super.key});

  @override
  _StayState createState() => _StayState();
}

class _StayState extends State<Stay> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const TabBar(
                tabs: [
                  Tab(text: 'Hotels'),
                  Tab(text: 'Budget Hotels'),
                ],
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                indicatorColor: Color(0xFFFFC107),
                indicatorWeight: 3,
              ),
            ),
          ),
          title: const Text(
            "Places To Stay",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          backgroundColor: Colors.white,
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(
          children: [
            MyList2(
              items: [
                ItemData(
                  title: 'Kampung Air (Water Chalet)',
                  imageUrl:
                  'assets/img/recommendation/accommodation/Kampung Air (Water Chalet).jpg',
                  location: 'Jalan Bukit Merah, Semanggol, 30000 Taiping',
                  contact: '+605-890 8888',
                  type: 'Resort',
                ),
                ItemData(
                  title: 'The Haven Resort Hotel',
                  imageUrl:
                  'assets/img/recommendation/accommodation/The Haven Resort Hotel.jpg',
                  location:
                  'Jalan Haven Persiaran Lembah Perpaduan Tambun, 31150 Ipoh, Perak',
                  contact: '+605-540 0000',
                  type: 'Hotel',
                ),
                ItemData(
                  title: 'The Banjaran Hotspring Retreat',
                  imageUrl:
                  'assets/img/recommendation/accommodation/The Banjaran Hotspring Retreat.jpg',
                  location: '1, Persiaran Lagoon, Sunway 3, 31150 Ipoh, Perak',
                  contact: '+605-210 7777',
                  type: 'Retreat',
                ),
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: 'Homestay Bukit Merah Laketown',
                  imageUrl:
                  'assets/img/recommendation/accommodation/Homestay Bukit Merah Laketown.jpg',
                  location:
                  '1-0-3A Lakefront Villa, Jalan LakeTown, Bukit Merah Laketown Resort, 34400 Simpang Empat Semanggol, Perak',
                  contact: '+6019-327 8398',
                  type: 'Homestay',
                ),
                ItemData(
                  title: 'DRumah Bonda River View',
                  imageUrl:
                  'assets/img/recommendation/accommodation/DRumah Bonda River View.jpg',
                  location:
                  'Lot 1217, Jalan Sementa, Kampung Kuala Kenas, 33800 Kuala Kangsar, Perak',
                  contact: '+6019-222 3060',
                  type: 'Homestay',
                ),
                ItemData(
                  title: 'Homestay Gerik Banding',
                  imageUrl:
                  'assets/img/recommendation/accommodation/Homestay Gerik Banding.jpg',
                  location:
                  'No. 415, Jalan Baiduri 12, Taman Desa Baiduri, 33300 Gerik, Perak',
                  contact: '+6013-537 8990',
                  type: 'Homestay',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyList2 extends StatelessWidget {
  final List<ItemData> items;

  const MyList2({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Section with Gradient Overlay
                  Stack(
                    children: [
                      Image.asset(
                        items[index].imageUrl,
                        fit: BoxFit.cover,
                        height: 220,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Type Badge (Top Left)
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _getTypeIcon(items[index].type),
                                size: 14,
                                color: const Color(0xFFFFC107),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                items[index].type,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Star Rating Badge (Top Right)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFC107),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 16,
                                color: Colors.black87,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                _getRandomRating(),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Content Section
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          items[index].title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                            letterSpacing: 0.2,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Divider
                        Container(
                          height: 2,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFC107),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Amenities Row
                        _buildAmenitiesRow(),

                        const SizedBox(height: 16),

                        // Location
                        _buildInfoRow(
                          icon: Icons.location_on_outlined,
                          text: items[index].location,
                          onTap: () => _launchMaps(items[index].location),
                        ),

                        const SizedBox(height: 12),

                        // Contact
                        _buildInfoRow(
                          icon: Icons.phone_outlined,
                          text: items[index].contact,
                          onTap: () => _launchPhone(items[index].contact),
                        ),

                        // Action Buttons
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: _buildActionButton(
                                icon: Icons.directions_outlined,
                                label: 'Directions',
                                onTap: () => _launchMaps(items[index].location),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildActionButton(
                                icon: Icons.call_outlined,
                                label: 'Call Now',
                                onTap: () => _launchPhone(items[index].contact),
                                isPrimary: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  IconData _getTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'hotel':
        return Icons.hotel_rounded;
      case 'resort':
        return Icons.villa_outlined;
      case 'retreat':
        return Icons.spa_outlined;
      case 'homestay':
        return Icons.home_rounded;
      default:
        return Icons.bed_outlined;
    }
  }

  String _getRandomRating() {
    // You can replace this with actual ratings from your data
    final ratings = ['4.5', '4.6', '4.7', '4.8', '4.9'];
    return ratings[DateTime.now().millisecond % ratings.length];
  }

  Widget _buildAmenitiesRow() {
    return Row(
      children: [
        _buildAmenityChip(Icons.wifi, 'WiFi'),
        const SizedBox(width: 8),
        _buildAmenityChip(Icons.local_parking, 'Parking'),
        const SizedBox(width: 8),
        _buildAmenityChip(Icons.restaurant, 'Dining'),
      ],
    );
  }

  Widget _buildAmenityChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9E6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFFFC107).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: const Color(0xFFFFC107),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF9E6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 18,
                color: const Color(0xFFFFC107),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) {
    return Material(
      color: isPrimary ? const Color(0xFFFFC107) : Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: isPrimary ? const Color(0xFFFFC107) : Colors.grey[300]!,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: isPrimary ? Colors.black87 : Colors.black54,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isPrimary ? Colors.black87 : Colors.black54,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchPhone(String phone) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  void _launchMaps(String location) async {
    final Uri mapsUri = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: '/maps/search/',
      queryParameters: {'api': '1', 'query': location},
    );
    if (await canLaunchUrl(mapsUri)) {
      await launchUrl(mapsUri, mode: LaunchMode.externalApplication);
    }
  }
}

class ItemData {
  final String title;
  final String imageUrl;
  final String location;
  final String contact;
  final String type;

  ItemData({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.contact,
    required this.type,
  });
}
