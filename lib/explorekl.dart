// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:peraktheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';

// ========================================
// MAIN EXPLORE PERAK SCREEN
// ========================================
class ExploreKL extends StatelessWidget {
  final List<Map<String, dynamic>> dataList = [
    {
      "name": "Greater Ipoh",
      "image": "assets/img/explore/greateripoh/ipoh2.jpg",
      "description": "Explore caves, temples & heritage"
    },
    {
      "name": "Perak Tengah",
      "image": "assets/img/explore/peraktengah/perak_tengah2.jpg",
      "description": "Beaches, islands & conservation"
    },
    {
      "name": "Taiping",
      "image": "assets/img/explore/taiping_2.jpg",
      "description": "Historic town & natural wonders"
    },
    {
      "name": "Kuala Kangsar",
      "image": "assets/img/explore/kualakangsar/kuala_kangsar.jpg",
      "description": "Royal heritage & traditions"
    },
    {
      "name": "Teluk Intan",
      "image": "assets/img/explore/teluk_intan2.jpg",
      "description": "Leaning tower & coastal beauty"
    },
    {
      "name": "Tanjung Malim",
      "image": "assets/img/explore/tanjung_malim.jpg",
      "description": "Hot springs & waterfalls"
    },
  ];

  ExploreKL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Explore Perak",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        backgroundColor: Colors.white,
        actions: const <Widget>[AppBarMore()],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          final item = dataList[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CardItem(
              name: item["name"],
              image: item["image"],
              description: item["description"],
              index: index,
            ),
          );
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final int index;

  const CardItem({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/explorekl-$index',
          arguments: {'index': index},
        );
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC107),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'EXPLORE',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.9),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Text(
                            'Discover More',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFC107),
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Color(0xFFFFC107),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================================
// DETAIL PAGE
// ========================================
class DetailPage extends StatelessWidget {
  final String title;
  final String content;
  final String content2;
  final String image;
  final String location;
  final String locationurl;
  final String hours;
  final String phone;
  final String website;

  const DetailPage({
    super.key,
    required this.location,
    required this.locationurl,
    required this.hours,
    required this.phone,
    required this.title,
    required this.content,
    required this.content2,
    required this.image,
    required this.website,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        backgroundColor: Colors.white,
        actions: const <Widget>[AppBarMore()],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 3,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC107),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  if (content.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    Text(
                      content,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                    ),
                  ],
                  if (content2.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Text(
                      content2,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                    ),
                  ],
                  if (location.isNotEmpty ||
                      phone.isNotEmpty ||
                      hours.isNotEmpty ||
                      website.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          if (location.isNotEmpty)
                            _buildDetailRow(
                              icon: Icons.location_on_outlined,
                              label: 'Location',
                              value: location,
                              onTap: () => _launchURL(locationurl),
                            ),
                          if (phone.isNotEmpty) ...[
                            if (location.isNotEmpty)
                              const Divider(height: 24),
                            _buildDetailRow(
                              icon: Icons.phone_outlined,
                              label: 'Phone',
                              value: phone,
                              onTap: () => _launchURL('tel:$phone'),
                            ),
                          ],
                          if (hours.isNotEmpty) ...[
                            if (location.isNotEmpty || phone.isNotEmpty)
                              const Divider(height: 24),
                            _buildDetailRow(
                              icon: Icons.access_time_outlined,
                              label: 'Hours',
                              value: hours,
                            ),
                          ],
                          if (website.isNotEmpty) ...[
                            if (location.isNotEmpty ||
                                phone.isNotEmpty ||
                                hours.isNotEmpty)
                              const Divider(height: 24),
                            _buildDetailRow(
                              icon: Icons.language_outlined,
                              label: 'Website',
                              value: website,
                              onTap: () => _launchURL(website),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF9E6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFFFFC107),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

// ========================================
// GREATER IPOH
// ========================================
class ExploreKL_Gperak extends StatefulWidget {
  const ExploreKL_Gperak({super.key});

  @override
  _ExploreKL_GperakState createState() => _ExploreKL_GperakState();
}

class _ExploreKL_GperakState extends State<ExploreKL_Gperak> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
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
                  Tab(text: 'Ipoh'),
                  Tab(text: 'Batu Gajah'),
                  Tab(text: 'Kampar'),
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
            "Greater Ipoh",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          backgroundColor: Colors.white,
          actions: const <Widget>[AppBarMore()],
        ),
        body: TabBarView(
          children: [
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Lost World of Tambun',
                  'assets/img/explore/greateripoh/ipoh/lost world of tambun.jpg',
                  'The only theme park in Southeast Asia with natural hot springs coupled with an array of attractions and rides. The self-contained wonderland is cocooned by lush tropical jungle, natural hot springs, and breathtaking limestone features.',
                  '1, Persiaran Lagun Sunway, Sunway City, 31150 Ipoh, Perak',
                  '+605-540 8888',
                ),
                EnhancedItemData(
                  'Kek Long Tong Cave Temple',
                  'assets/img/explore/greateripoh/ipoh/Kek Long Tong Cave.jpg',
                  'Also known as Cave of Supreme Bliss, it seems to offer a feeling of well-being to the many local travellers who regard it as their favourite among the many splendid cave temples of Ipoh.',
                  'Pesiaran Sepakat 3, Taman Endah Jaya, 31350 Ipoh, Perak',
                  '+605-312 8112',
                ),
                EnhancedItemData(
                  'Concubine Lane',
                  'assets/img/explore/greateripoh/ipoh/Concubine Lane.jpg',
                  'Locals say the lane was founded by mining tycoon Yao Tet Shin for his three wives. Today, Concubine Lane is the most famous lane, with a variety of pop-up stalls selling delicious treats.',
                  '30000 Ipoh, Perak',
                  '',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Kellie\'s Castle',
                  'assets/img/explore/greateripoh/ipoh/Kellie_s_Castle_Sideview.jpg',
                  'An unfinished ruined mansion built by a Scottish planter named William Kellie-Smith. Apart from being haunted, it is believed that the castle has hidden rooms and secret underground tunnels.',
                  'Kellie\'s Castle, Batu 5, Jalan Gopeng, 31000 Batu Gajah, Perak',
                  '+605-365 3381',
                ),
                EnhancedItemData(
                  'Tanjung Tualang Tin Dredge',
                  'assets/img/explore/greateripoh/ipoh/TT5_Tin_Dredge_-_panoramio_(4).jpg',
                  'A rare remnant of Malaysia\'s tin mining industry. It weighs 4,500 tons and is backed by a pontoon 75 metre long. The tin mine is still open and has been turned into a tourist attraction.',
                  '9th KM, Jln Tanjung Tualang, 31000 Batu Gajah',
                  '+6014-904 3255',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Kinta Tin Mining Museum',
                  'assets/img/explore/greateripoh/ipoh/kinta tin mine.jpg',
                  'This museum provides a glimpse of the scale of the tin mining industry in Kampar. It acts as a memorial to the local tin miners who took up the backbreaking work.',
                  'Lot 126026, Jalan Batu Karang, Taman Bandar Baru, 31900 Kampar, Perak',
                  '+6012-288 8530',
                ),
                EnhancedItemData(
                  'Japanese Carbide Chimney',
                  'assets/img/explore/greateripoh/ipoh/japanese chimney.jpg',
                  'A WW2 brick chimney designed by the Japanese as part of a carbide manufacturing plant. It is about 18 meters high, with a diameter of 6 meters at the base.',
                  'Japanese Carbide Chimney, 31700 Malim Nawar, Perak',
                  '',
                ),
                EnhancedItemData(
                  'Tempurung Cave',
                  'assets/img/essentials/iconsofperak/tempurung cave.jpg',
                  'The largest limestone cave in Peninsular Malaysia. This cave is believed to be 400 million years old and consists of five large domes with different formations.',
                  'Pusat Pelancongan Gua Tempurung, 31600 Gopeng, Perak',
                  '+6012-529 2426',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ========================================
// PERAK TENGAH
// ========================================
class ExploreKL_PerakTengah extends StatefulWidget {
  const ExploreKL_PerakTengah({super.key});

  @override
  _ExploreKL_PerakTengahState createState() => _ExploreKL_PerakTengahState();
}

class _ExploreKL_PerakTengahState extends State<ExploreKL_PerakTengah> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
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
                  Tab(text: 'Perak Tengah'),
                  Tab(text: 'Manjung'),
                  Tab(text: 'Lumut'),
                  Tab(text: 'Pangkor Island'),
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
            "Perak Tengah",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          backgroundColor: Colors.white,
          actions: const <Widget>[AppBarMore()],
        ),
        body: TabBarView(
          children: [
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Pasir Salak Historical Complex',
                  'assets/img/explore/peraktengah/peraktengah/Pasir_Salak.jpg',
                  'A charming museum of Malay traditional buildings situated 50 km south of Ipoh along the Perak River. Officially opened in 2004 as the Pasir Salak Historical Complex.',
                  'Kompleks Sejarah, 36800 Kampung Gajah, Perak',
                  '05-631 1462',
                ),
                EnhancedItemData(
                  'River Terrapin Conservation Centre',
                  'assets/img/explore/peraktengah/peraktengah/River Terrapin Conservation Centre.jpg',
                  'Drop by this centre to see the conservation efforts on the endangered river terrapin species.',
                  'Bota Kanan, 32600 Bota, Perak',
                  '+605-376 2726',
                ),
                EnhancedItemData(
                  'Pangkor Island',
                  'assets/img/explore/peraktengah/pangkor_island.jpg',
                  'Famed for its stunning white sands and crystal blue water, appears like paradise island for many travellers.',
                  'Strait of Malacca',
                  '',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Teluk Senangin',
                  'assets/img/explore/peraktengah/peraktengah/teluk senangin.jpg',
                  'About 30 km from Sitiawan. This beach has white sand and blue seawater with breathtaking scenery of the Straits of Melaka and Pangkor.',
                  'Jalan Teluk Senangin, 32200 Lumut, Perak',
                  '',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Segari Turtle Sanctuary',
                  'assets/img/explore/peraktengah/peraktengah/Segari Turtle Sanctuary.jpg',
                  'Home to Malaysia\'s green sea turtles. This sanctuary provides a natural habitat for turtle species that are slowly extincting.',
                  '34900 Lumut, Perak',
                  '',
                ),
                EnhancedItemData(
                  'Teluk Batik',
                  'assets/img/explore/peraktengah/peraktengah/Teluk_Batik.jpg',
                  'Located near Lumut and Sitiawan with views of Pangkor Island. Clear blue waters and soft sandy beaches make this spot ideal for getting away from crowds.',
                  '32200, Perak',
                  '',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Jetty',
                  'assets/img/explore/peraktengah/peraktengah/jetty.jpg',
                  'With the new construction of Marina Island Pangkor, take a 7-minute ferry ride to Pulau Pangkor from Marina Island Jetty.',
                  '34900 Lumut, Perak',
                  '',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ========================================
// TAIPING
// ========================================
class ExploreKL_Taiping extends StatefulWidget {
  const ExploreKL_Taiping({super.key});

  @override
  _ExploreKL_TaipingState createState() => _ExploreKL_TaipingState();
}

class _ExploreKL_TaipingState extends State<ExploreKL_Taiping> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
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
                  Tab(text: 'Taiping'),
                  Tab(text: 'Kuala Sepetang'),
                  Tab(text: 'Selama'),
                  Tab(text: 'Kerian'),
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
            "Taiping",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          backgroundColor: Colors.white,
          actions: const <Widget>[AppBarMore()],
        ),
        body: TabBarView(
          children: [
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Hike up Maxwell Hill',
                  'assets/img/explore/taiping/taiping/Maxwell Hill.jpg',
                  'Bukit Larut overlooks Taiping\'s scenic Lake Gardens. Take a government-owned Land Rover or hike 10 kilometres to the summit.',
                  'Bukit Larut, 34000 Taiping, Perak',
                  '',
                ),
                EnhancedItemData(
                  'Perak Museum',
                  'assets/img/explore/taiping/taiping/Perak Museum.jpg',
                  'The first museum in Malaysia set up in 1883. The 8,474 exhibits cover Malaysia\'s civilization, zoology and geology.',
                  'Jalan Taming Sari, 34000 Taiping, Perak',
                  '+605-807 2057',
                ),
                EnhancedItemData(
                  'Taiping Zoo & Night Safari',
                  'assets/img/explore/taiping/taiping/Taiping Zoo.jpg',
                  'Spread over 36 acres with new "Open Concept" animal enclosures that take into account the natural environment of the animals.',
                  'Jalan Taman Tasik Taiping, 34000 Taiping, Perak',
                  '+605-808 6577',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Charcoal Factory',
                  'assets/img/explore/taiping/kualasepetang/Charcoal Factory Kuala Sepetang.jpg',
                  'An eighty-year-old coal factory open to the public. Learn about the method of producing charcoal with guided tours available.',
                  'Jalan Taiping - Kuala Sepetang, 34650 Kuala Sepetang, Perak',
                  '+6012-428 6098',
                ),
                EnhancedItemData(
                  'Matang Mangrove Forest',
                  'assets/img/explore/taiping/kualasepetang/Matang Mangrove Forest Reserve.jpg',
                  'A boardwalk enables you to walk among the mangroves and enjoy the swamp life without getting muddy!',
                  'Kampung Kuala Sepetang, 34650 Kuala Sepetang, Perak',
                  '+6012-514 5023',
                ),
                EnhancedItemData(
                  'Fireflies Kuala Sepetang',
                  'assets/img/explore/taiping/kualasepetang/Fireflies Kuala Sepetang.jpg',
                  'Take a magical river cruise in Kampung Dew and witness how the fireflies light up like tiny fairy lights.',
                  '1, Kampung Dew, 34400 Simpang Empat Semanggol, Perak',
                  '+6019-578 6456',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Lata Tebing Tinggi',
                  'assets/img/explore/taiping/selama/Lata Tebing Tinggi.jpg',
                  'One of the seven waterfalls in Perak opened to the public. Easily accessible without 4-wheel drive and suitable even for children.',
                  'Lata Tebing Tinggi, 34140 Rantau Panjang, Perak',
                  '',
                ),
                EnhancedItemData(
                  'Sungai Atas Sungai',
                  'assets/img/explore/taiping/selama/Sungai Atas Sungai.jpg',
                  'A water canal that flows from Sungai Ijok for 3.5 kilometres before passing Sungai Redang Panjang, which flows underneath it.',
                  'Sungai Atas Sungai, Selama, 34510 Redang Panjang, Perak',
                  '',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Orang Utan Island',
                  'assets/img/explore/taiping/kerian/Orang Utan Island (Bukit Merah).jpg',
                  'One of the best rehabilitation and conservation centres in the world. A reference centre for the endangered Bornean orang utan.',
                  'A197, 34400 Simpang Empat Semanggol, Perak',
                  '+605-890 8110',
                ),
                EnhancedItemData(
                  'Kuala Gula Bird Sanctuary',
                  'assets/img/explore/taiping/kerian/Kuala Gula Bird Sanctuary.jpg',
                  'A valuable breeding area for waterbirds and nesting ground for resident birds within the Matang Forest Reserve.',
                  'Perhilitan Kuala Gula Birds Sanctuary, 34350 Kuala Kurau, Perak',
                  '+605-890 2207',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ========================================
// KUALA KANGSAR
// ========================================
class ExploreKL_Kangsar extends StatefulWidget {
  const ExploreKL_Kangsar({super.key});

  @override
  _ExploreKL_KangsarState createState() => _ExploreKL_KangsarState();
}

class _ExploreKL_KangsarState extends State<ExploreKL_Kangsar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
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
                  Tab(text: 'Kuala Kangsar'),
                  Tab(text: 'Lenggong Valley'),
                  Tab(text: 'Gerik'),
                  Tab(text: 'Pangkalan Hulu'),
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
            "Kuala Kangsar",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          backgroundColor: Colors.white,
          actions: const <Widget>[AppBarMore()],
        ),
        body: TabBarView(
          children: [
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Try Making Labu Sayong',
                  'assets/img/explore/kualakangsar/kualakangsar/Labu Sayong.jpg',
                  'Experience the art of using a wheel throwing machine to make the iconic gourd-shaped black pitcher. Some workshops let you make your own!',
                  'Labu Sayong Craft Centre, 33040 Kuala Kangsar, Perak',
                  '+6017-549 9942',
                ),
                EnhancedItemData(
                  'Laksa Sarang',
                  'assets/img/explore/kualakangsar/kualakangsar/Laksa Sarang Kuala Kangsar.jpg',
                  'Northern style Malay Laksa with a twist - an omelette fried to look like a bird\'s nest put on top!',
                  'Kampung Kuala Chempias, 33000 Kuala Kangsar, Perak',
                  '+6012-593 4771',
                ),
                EnhancedItemData(
                  'Masjid Ihsaniah Iskandariah',
                  'assets/img/explore/kualakangsar/kualakangsar/Masjid Ihsaniah Iskandariah.jpg',
                  'Built in 1936 by Sultan Iskandar Shah. The design incorporated architectural features found in his palace, Istana Kenangan.',
                  'Kampung Kuala Dal, 33700 Padang Rengas, Perak',
                  '',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Lenggong Archaeological Museum',
                  'assets/img/explore/kualakangsar/kualakangsar/Lenggong Archaeological Gallery.JPG',
                  'A prehistoric site dating back to 74,000 years ago. It displays Perak Man, the oldest human skeleton found in Peninsular Malaysia.',
                  'Jabatan Warisan Negara Zon Tengah, Kota Tampan, 33400 Lenggong, Perak',
                  '+605-767 9700',
                ),
                EnhancedItemData(
                  'Restoran Tasik Raban',
                  'assets/img/explore/kualakangsar/kualakangsar/Restoran Tasik Raban.jpg',
                  'Located next to the East-West Highway near Tasek Raban, serving some of the best grilled fish in the area.',
                  'Restoran Tasek Raban, 33400 Lenggong, Perak',
                  '+6019-521 5657',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Royal Belum Rainforest',
                  'assets/img/explore/kualakangsar/kualakangsar/Royal Belum State Park.jpg',
                  'One of the oldest rainforests in the world, dating back to over 130 million years. Houses 14 of the world\'s most threatened mammals.',
                  'Royal Belum Perak State Park, 33300 Gerik, Perak',
                  '+6013-400 5468',
                ),
                EnhancedItemData(
                  'Rafflesia Park',
                  'assets/img/explore/kualakangsar/kualakangsar/Rafflesia Park.jpg',
                  'Three species of Rafflesia can be found in Royal Belum: Rafflesia cantleyi, Rafflesia kerrii and Rafflesia azlanii.',
                  '',
                  '',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Tasek Takong',
                  'assets/img/explore/kualakangsar/kualakangsar/tasekTakong.png',
                  'A reservoir built over 100 years ago to provide amenities for hundreds of elephants to graze and bathe.',
                  'Tasek Takong, 33100 Pengakalan Hulu, Perak',
                  '',
                ),
                EnhancedItemData(
                  'Gua Gendang',
                  'assets/img/explore/kualakangsar/kualakangsar/GuaGendang.jpg',
                  'Named for the splashing of water against cave walls that creates sound like drums being beaten. A unique natural attraction.',
                  'Kem Rekreasi Gua Gendang, 33100 Pengkalan Hulu, Perak',
                  '+6019-455 9519',
                ),
                EnhancedItemData(
                  'Rahman Hydraulic Tin Mine',
                  'assets/img/explore/kualakangsar/kualakangsar/RahmanHydraulicTinMine.jpg',
                  'Operating since 1907, responsible for the majority of Malaysia\'s hard rock tin mining operations. Now a tourist attraction.',
                  '2007, Jalan Baling - Kuala Kangsar, 33100 Pengkalan Hulu, Perak',
                  '+604-477 0698',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ========================================
// TELUK INTAN
// ========================================
class ExploreKL_TelukIntan extends StatefulWidget {
  const ExploreKL_TelukIntan({super.key});

  @override
  _ExploreKL_TelukIntanState createState() => _ExploreKL_TelukIntanState();
}

class _ExploreKL_TelukIntanState extends State<ExploreKL_TelukIntan> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
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
                  Tab(text: 'Teluk Intan'),
                  Tab(text: 'Bagan Datuk'),
                  Tab(text: 'Pulau Sembilan'),
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
            "Teluk Intan",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          backgroundColor: Colors.white,
          actions: const <Widget>[AppBarMore()],
        ),
        body: TabBarView(
          children: [
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Leaning Tower of Teluk Intan',
                  'assets/img/explore/telukintan/telukintan/Leaning Tower of Teluk Intan.jpg',
                  'Built in 1885 for storing water during drought season. The tower was designed under the direction of contractor Leong Choon Chong.',
                  'Lot 1&2, Komplex Menara Condong, Jalan Bandar, 36000 Teluk Intan, Perak',
                  '+605-623 7040',
                ),
                EnhancedItemData(
                  'Pulau Bangau',
                  'assets/img/explore/telukintan/telukintan/Pulau Bangau.jpg',
                  'Home to 16 species of cranes and tens of thousands of migratory birds. Witness cranes return to the island after feeding.',
                  'Jalan Wah Keng Jooi, Pekan Teluk Intan, 36000 Teluk Intan, Perak',
                  '+605-623 7040',
                ),
                EnhancedItemData(
                  'Ladang Moccis',
                  'assets/img/explore/telukintan/telukintan/moccis.jpg',
                  'Ideal for family days with activities including ATV, fishing, kayaking, barbecue and cycling. Petting zoo and chalets available.',
                  'Ladang MOCCIS, KM 14, Jln Chkt Jong, Teluk Intan, Perak',
                  '+605-622 1300',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Sunflower Garden',
                  'assets/img/explore/telukintan/telukintan/Sunflower Garden, Bagan Datuk.jpg',
                  'The perfect place for sunflower lovers! An ideal spot for photography enthusiasts.',
                  'A128, 36100 Bagan Datuk, Perak',
                  '+6019-207 4608',
                ),
                EnhancedItemData(
                  'Bagan Sungai Burung',
                  'assets/img/explore/telukintan/telukintan/bagan sungai burung.jpg',
                  'A small fishing village about 50 kilometres west from Teluk Intan with a myriad of seafood restaurants.',
                  '36100 Bagan Datuk, Perak',
                  '',
                ),
                EnhancedItemData(
                  'Sky Mirror Bagan Datuk',
                  'assets/img/explore/telukintan/telukintan/Sky Mirror Bagan Datuk.jpg',
                  'Perak\'s own Sky Mirror. The water levels can get so thin that you could see your reflection on the surface.',
                  '64, Kampung Sungai Burung, 36100 Bagan Datuk',
                  '',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Blue Tears Phenomenon',
                  'assets/img/explore/telukintan/telukintan/Pulau Sembilan.jpg',
                  'Witness the Blue Tears phenomenon caused by plankton that emit light. Any wave that falls on the shore lights up with an electric blue glow.',
                  '6B, Bagan Ikan, 36100 Bagan Datuk, Perak',
                  '+605-646 6999',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ========================================
// TANJUNG MALIM
// ========================================
class ExploreKL_TMalim extends StatefulWidget {
  const ExploreKL_TMalim({super.key});

  @override
  _ExploreKL_TMalimState createState() => _ExploreKL_TMalimState();
}

class _ExploreKL_TMalimState extends State<ExploreKL_TMalim> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
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
                  Tab(text: 'Tanjung Malim'),
                  Tab(text: 'Sungkai'),
                  Tab(text: 'Tapah'),
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
            "Tanjung Malim",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          backgroundColor: Colors.white,
          actions: const <Widget>[AppBarMore()],
        ),
        body: TabBarView(
          children: [
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Ujana Muallim',
                  'assets/img/explore/tanjungmalim/tanjungmalim/Ujana Muallim.jpg',
                  'An Urban Forest Park within Proton City area of 38.16 acres, located about 2km from UPSI.',
                  'Jalan Pc10, 35900 Tanjong Malim, Perak',
                  '',
                ),
                EnhancedItemData(
                  'National Education Museum',
                  'assets/img/explore/tanjungmalim/tanjungmalim/National Education Museum.jpg',
                  'Located in UPSI, this museum boasts 21 permanent galleries exhibiting significant history of education in Malaysia. Built in 1919.',
                  'Jalan Utama Upsi, 35900 Tanjong Malim, Perak',
                  '+605-450 6680',
                ),
                EnhancedItemData(
                  'Sarang Art Hub',
                  'assets/img/explore/tanjungmalim/tanjungmalim/Sarang Art Hub.jpg',
                  'Owned by film director Mamat Khalid, featuring sculpture, design, fine art, music, and food art.',
                  'Hot Springs Ulu Slim, 35800 Slim River, Perak',
                  '+6012-525 8798',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Sungai Klah Hot Springs',
                  'assets/img/explore/tanjungmalim/tanjungmalim/Sungai Klah Hot Springs.jpg',
                  'Well known for its hot springs with water theme park, therapeutic pools, family baths and egg boiling area.',
                  '35600 Sungkai, Perak',
                  '+6019-279 0022',
                ),
                EnhancedItemData(
                  'Nasi Bamboo Sungai Klah',
                  'assets/img/explore/tanjungmalim/tanjungmalim/nasi bamboo.jpg',
                  'Famous for rice wrapped in Calathea Leaves and cooked in bamboo sticks. Popular dishes include Rendang Tok and Ayam Bunian.',
                  'Kampung Buloh Telor, 35600 Sungkai, Perak',
                  '+6017-516 7592',
                ),
              ],
            ),
            EnhancedListView(
              items: [
                EnhancedItemData(
                  'Lata Kinjang',
                  'assets/img/explore/tanjungmalim/tanjungmalim/Lata Kinjang.jpg',
                  'One of the most famous waterfall spots in Malaysia with accessible waterfalls, pathways, and a suspension bridge.',
                  '35300 Chenderiang, Perak',
                  '+605-528 8100',
                ),
                EnhancedItemData(
                  'Lata Iskandar',
                  'assets/img/explore/tanjungmalim/tanjungmalim/Lata Iskandar.jpg',
                  'A waterfall about 25 kilometres before Ringlet on the trunk road from Tapah to Cameron Highlands. 25 metres high drop.',
                  'Exit 59, 35000 Tapah, Perak',
                  '+605-401 1402',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ========================================
// SIGHTSEEING & OTHER SCREENS
// ========================================
class ExploreKL_SS2 extends StatefulWidget {
  const ExploreKL_SS2({super.key});

  @override
  _ExploreKL_SS2State createState() => _ExploreKL_SS2State();
}

class _ExploreKL_SS2State extends State<ExploreKL_SS2> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
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
                  Tab(text: 'Historical Places'),
                  Tab(text: 'Museums'),
                  Tab(text: 'Parks'),
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
            "Sightseeing",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          backgroundColor: Colors.white,
          actions: const <Widget>[AppBarMore()],
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Historical Places')),
            Center(child: Text('Museums')),
            Center(child: Text('Parks')),
          ],
        ),
      ),
    );
  }
}

class ExploreKL_P2 extends StatefulWidget {
  const ExploreKL_P2({super.key});

  @override
  _ExploreKL_P2State createState() => _ExploreKL_P2State();
}

class _ExploreKL_P2State extends State<ExploreKL_P2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Instagrammable Cafes",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        backgroundColor: Colors.white,
        actions: const <Widget>[AppBarMore()],
      ),
      body: const Center(child: Text('Cafes List')),
    );
  }
}

// ========================================
// ENHANCED REUSABLE LIST VIEW WIDGET
// ========================================
class EnhancedListView extends StatelessWidget {
  final List<EnhancedItemData> items;

  const EnhancedListView({super.key, required this.items});

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
                            children: const [
                              Icon(
                                Icons.star_rounded,
                                size: 14,
                                color: Colors.black87,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Top Pick',
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
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[index].text,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                            letterSpacing: 0.2,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 2,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFC107),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          items[index].description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.6,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 16),
                        _buildInfoRow(
                          icon: Icons.location_on_outlined,
                          text: items[index].location,
                          onTap: () => _launchMaps(items[index].location),
                        ),
                        if (items[index].contact.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          _buildInfoRow(
                            icon: Icons.phone_outlined,
                            text: items[index].contact,
                            onTap: () => _launchPhone(items[index].contact),
                          ),
                        ],
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

// ========================================
// ENHANCED ITEM DATA CLASS
// ========================================
class EnhancedItemData {
  final String text;
  final String imageUrl;
  final String description;
  final String location;
  final String contact;

  EnhancedItemData(
      this.text,
      this.imageUrl,
      this.description,
      this.location,
      this.contact,
      );
}

// ========================================
// HELPER FUNCTION FOR URL LAUNCHING
// ========================================
void _launchURL(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}