import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:peraktheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';

// Color Theme
class AppTheme {
  static const Color primaryYellow = Color(0xFFFDB813);
  static const Color darkBlack = Color(0xFF1A1A1A);
  static const Color softWhite = Color(0xFFFAFAFA);
  static const Color accentGold = Color(0xFFFFD700);
  static const Color textGrey = Color(0xFF666666);
}

class AboutPerak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.softWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            backgroundColor: AppTheme.darkBlack,
            iconTheme: const IconThemeData(color: AppTheme.primaryYellow),
            actions: const <Widget>[AppBarMore()],
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'About Perak',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black45, blurRadius: 10)],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: 'https://www.klangvalley4locals.com.my/assets/img/highlights/about_kv2.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppTheme.darkBlack.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoCard(
                    icon: Icons.history,
                    title: 'Historical Heritage',
                    content: "Perak, before independence, was thriving with tin mines and later rubber plantations. The state was the first to receive a British Resident. Historians say that Perak is a state that has gone through the Metal Age, the Neolithic Age and the Hoabinhian Age as relevant ancient artefacts seem to prove.",
                  ),
                  const SizedBox(height: 20),
                  _buildInfoCard(
                    icon: Icons.location_on,
                    title: 'Geography & Location',
                    content: "Perak is the second-largest state in Peninsular Malaysia in terms of land area. It is bounded to the north by Thai Yala Province and Kedah, to the east by Pahang and Kelantan. Ipoh is the administrative capital with a long history of excellence in tin mining.",
                  ),
                  const SizedBox(height: 20),
                  _buildHighlightBanner(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String title, required String content}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryYellow.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryYellow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: AppTheme.darkBlack, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkBlack,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppTheme.textGrey,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightBanner() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primaryYellow, AppTheme.accentGold],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.stars, color: AppTheme.darkBlack, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'Perak\'s limestone hills set it apart from all other states',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GetAround extends StatefulWidget {
  const GetAround({super.key});

  @override
  State<GetAround> createState() => _GetAroundState();
}

class _GetAroundState extends State<GetAround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.softWhite,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primaryYellow),
        title: const Text(
          "Getting Around Perak",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppTheme.darkBlack,
        actions: const <Widget>[AppBarMore()],
      ),
      body: MyList(),
    );
  }
}

class MyList extends StatelessWidget {
  final List<ItemData> items = [
    ItemData(
      'Mass Rapid Transit (MRT)',
      'assets/img/essentials/getaround/3.-ktm-komuter.png',
      'Just as how it is accessible from other states, travelling between the districts is possible by Malaysia\'s train service, KTM.',
    ),
    ItemData(
      'Taxi',
      'assets/img/essentials/getaround/10.-taxi.png',
      'Taxis are ever available around the public areas such as malls, hotels, shops, and bus stations. Ask for an agreed fare or ensure it is a metered taxi before getting on.',
    ),
    ItemData(
      'E-hailing apps',
      'assets/img/essentials/getaround/e-hailing.png',
      'There is an increase of access to E-hailing transportations now in the major cities as well as the more rural areas. The most common will be Grab.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Stack(
                  children: [
                    Image.asset(
                      items[index].imageUrl,
                      fit: BoxFit.cover,
                      height: 180,
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryYellow,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: AppTheme.darkBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkBlack,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      items[index].content,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: AppTheme.textGrey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ItemData {
  final String text;
  final String imageUrl;
  final String content;
  ItemData(this.text, this.imageUrl, this.content);
}

class ItemData2 {
  final String text;
  final String imageUrl;
  final String content;
  final String goto;
  ItemData2(this.text, this.imageUrl, this.content, this.goto);
}

class TravelTips extends StatefulWidget {
  const TravelTips({super.key});

  @override
  State<TravelTips> createState() => _TravelTipsState();
}

class _TravelTipsState extends State<TravelTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.softWhite,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primaryYellow),
        title: const Text(
          "Travel Tips",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppTheme.darkBlack,
        actions: const <Widget>[AppBarMore()],
      ),
      body: MyList2(),
    );
  }
}

class MyList2 extends StatelessWidget {
  final List<ItemData2> items = [
    ItemData2(
      'Weather',
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/weather.png',
      'The climate in Perak is quite humid all year-round. Best time to visit is from May-July or December-February.',
      'https://www.ventusky.com/',
    ),
    ItemData2(
      'Time Zone',
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/timezone.png',
      'Standard Malaysian time is 8 hours ahead of GMT (GMT +8).',
      'https://www.timeanddate.com/',
    ),
    ItemData2(
      'Currency',
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/currency-code.png',
      'Malaysia\'s currency is Ringgit Malaysia (RM). Denominations include RM1, RM5, RM10, RM20, RM50 and RM100.',
      'https://www.xe.com/',
    ),
    ItemData2(
      'Visa and Passport',
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/visa-and-passports.png',
      'Passports must be valid for at least 6 months at the time of entry. Check with Malaysian embassy for visa requirements.',
      'https://www.imi.gov.my/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _launchURL(items[index].goto),
          child: Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppTheme.primaryYellow.withOpacity(0.3), width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryYellow.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                  child: Image.network(
                    items[index].imageUrl,
                    fit: BoxFit.cover,
                    height: 160,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              items[index].text,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.darkBlack,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, color: AppTheme.primaryYellow, size: 18),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        items[index].content,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: AppTheme.textGrey,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PerakIcon extends StatefulWidget {
  const PerakIcon({super.key});

  @override
  State<PerakIcon> createState() => _PerakIconState();
}

class _PerakIconState extends State<PerakIcon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.softWhite,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primaryYellow),
        title: const Text(
          "11 Icons of Perak",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppTheme.darkBlack,
        actions: const <Widget>[AppBarMore()],
      ),
      body: MyList5(),
    );
  }
}

class MyList5 extends StatelessWidget {
  final List<ItemData5> items = [
    ItemData5('Pangkor Island', 'assets/img/essentials/iconsofperak/pulau pangkor.jpg', 'A thriving small island in Perak, Pangkor Island is ever ready to welcome you with her crystal clear beaches.'),
    ItemData5('Royal Belum', 'assets/img/essentials/iconsofperak/royal belum.jpg', 'The Belum Temengor forest is one of the oldest rainforests in the world, estimated to be 130 million years old.'),
    ItemData5('Ipoh', 'assets/img/essentials/iconsofperak/ipoh.jpg', 'Beautiful limestone hills welcome you on both sides. Find many cave temples and enjoy extreme sports.'),
    ItemData5('Kuala Kangsar', 'assets/img/essentials/iconsofperak/kuala kangsar.jpg', 'The Royal Town nestled at the crook of Perak River with well-preserved heritage sites.'),
    ItemData5('Tempurung Cave', 'assets/img/essentials/iconsofperak/tempurung cave.jpg', '400 million-year-old cave with magnificent stalactites and stalagmites formations.'),
    ItemData5('Lenggong Valley', 'assets/img/essentials/iconsofperak/Lenggong Valley.jpg', 'UNESCO World Heritage Site where the oldest human "Perak Man" was discovered.'),
    ItemData5('Taiping Zoo', 'assets/img/essentials/iconsofperak/taiping zoo.jpg', 'Malaysia\'s oldest zoo with 180 animal species and the first Night Safari.'),
    ItemData5('Orang Utan Island', 'assets/img/essentials/iconsofperak/orang utan island.jpg', 'Research institution dedicated to Orang Utan preservation with 11-acre water park.'),
    ItemData5('Matang Mangrove', 'assets/img/essentials/iconsofperak/matang mangrove forest.jpg', 'World\'s most sustainable mangrove ecosystem covering over 40,000 hectares.'),
    ItemData5('Sungai Klah Hot Springs', 'assets/img/essentials/iconsofperak/Sungai Klah Hot Springs.jpg', 'Natural hot springs 200m above sea level with healing properties.'),
    ItemData5('7 Lata', 'assets/img/essentials/iconsofperak/7lata.jpg', 'Seven beautiful waterfalls across different districts of Perak.'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.asset(
                        items[index].imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryYellow,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: AppTheme.darkBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index].text,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.darkBlack,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4.0),
                      Expanded(
                        child: Text(
                          items[index].content,
                          style: TextStyle(
                            fontSize: 11.0,
                            color: AppTheme.textGrey,
                            height: 1.3,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ItemData5 {
  final String text;
  final String imageUrl;
  final String content;
  ItemData5(this.text, this.imageUrl, this.content);
}

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.softWhite,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primaryYellow),
        title: const Text(
          "Must Try Foods in Perak",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppTheme.darkBlack,
        actions: const <Widget>[AppBarMore()],
      ),
      body: MyList6(),
    );
  }
}

class MyList6 extends StatelessWidget {
  final List<ItemData6> items = [
    ItemData6('Chicken Rice & Bean Sprouts', 'assets/img/essentials/food/chicken rice.jpg', 'Perak produces the best bean sprouts in Malaysia - thick and crunchy, stealing the show from chicken rice.'),
    ItemData6('Dim Sum', 'assets/img/essentials/food/dim sum.jpg', 'Traditional Chinese meal with small plates of dumplings steamed on bamboo baskets, served with tea.'),
    ItemData6('Kaya Puffs', 'assets/img/essentials/food/puff.jpg', 'Traditional Chinese pastry made with lard or shortening, achieving flakiness through laminated doughs.'),
    ItemData6('Chee Cheong Fun', 'assets/img/essentials/food/chee cheong fun.jpg', 'Hong Kong style with sweet sauce, onion oil, fried shallots, and silky smooth thin texture.'),
    ItemData6('Nasi Kandar Ayam Merah', 'assets/img/essentials/food/nasi kandar.jpg', 'Famous stall with variety of dishes. Try "kuah campur banjir" for the addictive mixed gravy.'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          height: 140,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
                child: Image.asset(
                  items[index].imageUrl,
                  fit: BoxFit.cover,
                  width: 140,
                  height: 140,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryYellow.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: AppTheme.darkBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        items[index].text,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.darkBlack,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6.0),
                      Expanded(
                        child: Text(
                          items[index].content,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: AppTheme.textGrey,
                            height: 1.3,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ItemData6 {
  final String text;
  final String imageUrl;
  final String content;
  ItemData6(this.text, this.imageUrl, this.content);
}

class ApiData {
  final String title;
  final String content;
  final String image;
  final String location;

  ApiData({
    required this.location,
    required this.title,
    required this.content,
    required this.image,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      image: json['image'] ?? '',
      location: json['location'] ?? '',
    );
  }
}

class CardListWidget extends StatelessWidget {
  final List<ApiData> data;

  const CardListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];

        return GestureDetector(
          onTap: () {
            if (item.location != '') {
              _launchURL(item.location);
            }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryYellow.withOpacity(0.15),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl: item.image,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.darkBlack,
                              ),
                            ),
                          ),
                          if (item.location != '')
                            Icon(Icons.link, color: AppTheme.primaryYellow, size: 20),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        item.content.replaceAll('\\n', '\n'),
                        style: TextStyle(
                          fontSize: 15,
                          color: AppTheme.textGrey,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CardItem extends StatelessWidget {
  final String name;
  final String image;
  final int index;

  const CardItem({
    super.key,
    required this.name,
    required this.image,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppTheme.darkBlack.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryYellow,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '#${index + 1}',
                          style: const TextStyle(
                            color: AppTheme.darkBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _launchURL(url) async {
  var url2 = Uri.parse(url);
  if (await canLaunchUrl(url2)) {
    await launchUrl(url2, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}