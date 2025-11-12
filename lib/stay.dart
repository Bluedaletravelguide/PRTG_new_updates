import 'package:flutter/material.dart';
import 'package:peraktheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Eat extends StatefulWidget {
  const Eat({super.key});

  @override
  _EatState createState() => _EatState();
}

class _EatState extends State<Eat> {
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
                  Tab(text: 'Malay'),
                  Tab(text: 'Chinese'),
                  Tab(text: 'Indian'),
                  Tab(text: 'Cafe'),
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
            "Places To Eat",
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
                  title: 'Restoran Tasik Raban, Lenggong',
                  imageUrl: 'assets/img/explore/kualakangsar/kualakangsar/Restoran Tasik Raban.jpg',
                  location: 'Location: 33400 Lenggong, Perak',
                  hours: '9.00am - 5.00pm (Daily)',
                  contact: '+6019-521 5657',
                ),
                ItemData(
                  title: 'Warung Nasi Talam, Lenggong',
                  imageUrl: 'assets/img/recommendation/pte/malay/NasiTalam.jpeg',
                  location: 'Kampung Batu Berdinding, 33400 Lenggong, Perak',
                  hours: '11.30am - 3.30pm (Sat-Thurs)/Closed on Friday',
                  contact: '+6017-567 4329',
                ),
                ItemData(
                  title: 'Castella Cafe, Gerik',
                  imageUrl: 'assets/img/recommendation/pte/malay/CastellaCafe.jpeg',
                  location: 'Kampung padang stang, 33310 Gerik, Perak',
                  hours: '10.00am - 5.00pm (Wed-Sun)/Closed on Monday',
                  contact: '+6011-2050 3454',
                ),
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: 'Ayam Garam Aun Kheng Lim',
                  imageUrl: 'assets/img/recommendation/pte/chinese/AyamGaram.jpeg',
                  location: '75, Laluan Tasek Perdana, Medan Tasek Perdana, 30010 Ipoh, Perak',
                  hours: '11.00am - 5.30pm (Daily)',
                  contact: '+6012-533 4993',
                ),
                ItemData(
                  title: 'Restaurant Ayam Taugeh',
                  imageUrl: 'assets/img/recommendation/pte/chinese/AyamTaugeh.jpeg',
                  location: '849, Jalan Guntong, Guntong, 30100 Ipoh, Perak',
                  hours: '5.00pm - 9.00am (Wed-Sun)/Closed on Monday and Tuesday',
                  contact: '+605-255 7469',
                ),
                ItemData(
                  title: 'Tong Sui Kai',
                  imageUrl: 'assets/img/recommendation/pte/chinese/TongSuiKai.jpeg',
                  location: 'Jalan Carey, Taman Jubilee, 30300 Ipoh, Perak',
                  hours: '6.00pm - 2.00am (Daily)',
                  contact: '',
                ),
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: 'Restoran Nasi Ganja (Yon Suan)',
                  imageUrl: 'assets/img/recommendation/pte/indian/YongSuan.jpeg',
                  location: '2, Jalan Yang Kalsom, Taman Jubilee, 30300 Ipoh, Perak',
                  hours: '9.30am - 6.00pm (Daily)',
                  contact: '+605-254 4314',
                ),
                ItemData(
                  title: 'Restoran Samy',
                  imageUrl: 'assets/img/recommendation/pte/indian/Samy.jpeg',
                  location: '70, Jln Besar, 31200 Chemor, Perak',
                  hours: '7.00 am -7.00 pm (Daily)',
                  contact: '+605-201 4066',
                ),
                ItemData(
                  title: 'Sri Ananda Bahwan Restaurant',
                  imageUrl: 'assets/img/recommendation/pte/indian/SriAnandaBahwan.jpeg',
                  location: '7, Persiaran Bandar Timah, 31650 Ipoh, Perak',
                  hours: '7.00 am - 11.30 pm (Daily)',
                  contact: '+605-253 9798',
                ),
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: 'Little Ipoh Cafe',
                  imageUrl: 'assets/img/recommendation/pte/cafe/LittleIpoh.jpeg',
                  location: '21, Jalan PP 1, Bandar Universiti Lakeville, 32610 Seri Iskandar, Perak',
                  hours: '7.00am - 5.00pm (Daily)',
                  contact: '+605-373 1478',
                ),
                ItemData(
                  title: 'Asow Eatery Canteen',
                  imageUrl: 'assets/img/recommendation/pte/cafe/AsowEatery.jpeg',
                  location: '187a, Jalan Sultan Iskandar, Taman Jubilee, 31650 Ipoh, Perakk',
                  hours: '10.00am - 10.00pm (Daily)',
                  contact: '+6016-277 3755',
                ),
                ItemData(
                  title: 'Konda Kondi Cafe & Bistro',
                  imageUrl: 'assets/img/recommendation/pte/cafe/KondaKondi.jpeg',
                  location: '183, Jalan Sultan Idris Shah, Taman Jubilee, 30000 Ipoh, Perak',
                  hours: '5.00pm - 12.00am (Mon, Wed, Thurs)/5.00pm - 12.30am (Fri)/1.00pm - 12.30am (Sat-Sun)/Closed on Tuesday',
                  contact: '+6016-492 9660',
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
                      // Status Badge
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: _isOpenNow(items[index].hours)
                                ? const Color(0xFFFFC107)
                                : Colors.grey[600],
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
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: _isOpenNow(items[index].hours)
                                      ? Colors.black87
                                      : Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                _isOpenNow(items[index].hours) ? 'Open' : 'Closed',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: _isOpenNow(items[index].hours)
                                      ? Colors.black87
                                      : Colors.white,
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

                        const SizedBox(height: 12),

                        // Operating Hours
                        _buildInfoRow(
                          icon: Icons.access_time_outlined,
                          text: items[index].hours,
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
                                  onTap: () => _launchPhone(items[index].contact),
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

  bool _isOpenNow(String hours) {
    // Simple check - you can enhance this with actual time checking
    final lowerHours = hours.toLowerCase();
    if (lowerHours.contains('closed on')) {
      final now = DateTime.now();
      final days = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'];
      final today = days[now.weekday - 1];

      if (lowerHours.contains('closed on $today')) {
        return false;
      }
    }
    return true; // Default to open if we can't determine
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
  final String hours;
  final String contact;

  ItemData({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.hours,
    required this.contact,
  });
}