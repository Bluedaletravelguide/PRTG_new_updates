import 'package:flutter/material.dart';
import 'package:peraktheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Worship extends StatefulWidget {
  const Worship({super.key});

  @override
  _WorshipState createState() => _WorshipState();
}

class _WorshipState extends State<Worship> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                  Tab(text: 'Mosque'),
                  Tab(text: 'Buddhist'),
                  Tab(text: 'Hindu'),
                  Tab(text: 'Others'),
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
            "Places of Worship",
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
                  title: 'Ubudiah Mosque Kuala Kangsar',
                  imageUrl: 'assets/img/recommendation/pts/mosque/Ubudiah.jpg',
                  location: 'Jalan Istana, 33000 Kuala Kangsar, Perak',
                  contact: '+6011-1769 6364',
                ),
                ItemData(
                  title: 'Panglima Kinta Mosque',
                  imageUrl:
                  'assets/img/recommendation/pts/mosque/Panglima.jpeg',
                  location:
                  'Masjid Panglima Kinta 15, 3, Jalan Masjid, Taman Jubilee, 30300 Ipoh, Perak',
                  contact: '',
                ),
                ItemData(
                  title: 'Muhammadiah Mosque',
                  imageUrl:
                  'assets/img/recommendation/pts/mosque/Muhammadiah_Mosque.jpg',
                  location:
                  'Tingkat Tasek Jaya 2, Taman Tasek Jaya, 31400 Ipoh, Perak',
                  contact: '+6011-1236 4188',
                ),
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: 'Sam Poh Tong Temple',
                  imageUrl:
                  'assets/img/recommendation/pts/buddhist/Sam_Poh_Tong.jpeg',
                  location: 'Kampung Gunung Rapat, 31350 Ipoh, Perak',
                  contact: '+6012-533 4993',
                ),
                ItemData(
                  title: 'Kek Lok Tong Temple',
                  imageUrl:
                  'assets/img/recommendation/pts/buddhist/Kek_Lok_Tong.jpeg',
                  location:
                  'Persiaran Sepakat 3, Tmn Endah Jaya, 31350 Ipoh, Perak',
                  contact: '+605-312 8112',
                ),
                ItemData(
                  title: 'Perak Cave Temple',
                  imageUrl:
                  'assets/img/recommendation/pts/buddhist/Perak_Cave_Temple.jpg',
                  location:
                  'Jln. Kuala Kangsar, Kawasan Perindustrian Tasek, 31400 Ipoh, Perak',
                  contact: '+6011-2358 4126',
                ),
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: 'Sri Maha Mariamman Temple, Buntong',
                  imageUrl:
                  'assets/img/recommendation/pts/hindu/SriMahaMariammam.jpg',
                  location: 'Buntong, 30100 Ipoh, Perak',
                  contact: '+605-254 0291',
                ),
                ItemData(
                  title: 'Arulmegu Maha Mariamman Kovil Devastanam',
                  imageUrl:
                  'assets/img/recommendation/pts/hindu/ArulmeguMaha.jpg',
                  location:
                  'Jalan Lumut, Taman Sitiawan Maju 2, 32000 Sitiawan, Perak',
                  contact: '+6016-513 7832',
                ),
                ItemData(
                  title: 'Kallumalai Arulmigu Subramaniyar Temple',
                  imageUrl:
                  'assets/img/recommendation/pts/hindu/KallumalaiArulmigu.jpg',
                  location: '140, Jalan Raja Musa Aziz, 30300 Ipoh, Perak',
                  contact: '',
                ),
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: 'St. Michaels Church',
                  imageUrl: 'assets/img/recommendation/pts/other/StMichael.jpg',
                  location: '24, Jalan Gereja, 31650 Ipoh, Perak',
                  contact: '+605-242 8077',
                ),
                ItemData(
                  title: 'Church of Our Lady of Lourdes',
                  imageUrl:
                  'assets/img/recommendation/pts/other/ChurchOfOurLady.jpg',
                  location: '45, Jalan Silibin, Taman Lim, 30100 Ipoh, Perak',
                  contact: '+605-527 9349',
                ),
                ItemData(
                  title: 'Catholic Church of Our Mother of Perpetual Help',
                  imageUrl:
                  'assets/img/recommendation/pts/other/CatholicChurch.jpg',
                  location:
                  'Church of Our Mother of Perpetual Help 1, Jalan Serindik, Taman Ipoh, 31400 Ipoh, Perak',
                  contact: '',
                ),
              ],
            )
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
                        height: 200,
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
                      // Yellow accent corner
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
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
                              Icon(
                                Icons.place,
                                size: 14,
                                color: Colors.black87,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Perak',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
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

                        // Location
                        _buildInfoRow(
                          icon: Icons.location_on_outlined,
                          text: items[index].location,
                          onTap: () => _launchMaps(items[index].location),
                        ),

                        // Contact (only if available)
                        if (items[index].contact.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          _buildInfoRow(
                            icon: Icons.phone_outlined,
                            text: items[index].contact,
                            onTap: () => _launchPhone(items[index].contact),
                          ),
                        ],

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
                            if (items[index].contact.isNotEmpty) ...[
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildActionButton(
                                  icon: Icons.call_outlined,
                                  label: 'Call',
                                  onTap: () =>
                                      _launchPhone(items[index].contact),
                                  isPrimary: true,
                                ),
                              ),
                            ],
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

  ItemData({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.contact,
  });
}
