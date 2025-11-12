// ignore_for_file: camel_case_types

//import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:peraktheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreKL extends StatelessWidget {
  final List<Map<String, dynamic>> dataList = [
    {
      "name": "Greater Ipoh", // Greater Ipoh
      "image": "assets/img/explore/greateripoh/ipoh2.jpg"
    },
    {
      "name": "Perak Tengah", // Perak Tengah
      "image": "assets/img/explore/peraktengah/perak_tengah2.jpg"
    },
    {
      "name": "Taiping", // Taiping
      "image": "assets/img/explore/taiping_2.jpg" // ada
    },
    {
      "name": "Kuala Kangsar", // Kuala Kangsar
      "image": "assets/img/explore/kualakangsar/kuala_kangsar.jpg" // ada
    },
    {
      "name": "Teluk Intan", // Teluk Intan
      "image": "assets/img/explore/teluk_intan2.jpg" // ada
    },
    {
      "name": "Tanjung Malim", // Tanjung Malim
      "image": "assets/img/explore/tanjung_malim.jpg" // ada
    },
    // Add more items as needed
  ];

  ExploreKL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title:
            const Text("Explore Perak", style: TextStyle(color: Colors.white)),
        // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          final item = dataList[index];
          return CardItem(
              name: item["name"], image: item["image"], index: index);
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String name;
  final String image;
  final int index;

  const CardItem({
    Key? key,
    required this.name,
    required this.image,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/explorekl-$index',
            arguments: {'index': index});
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(10),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity, // Ensures the image covers the card
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.5),
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("Details", style: TextStyle(color: Colors.white)),
        // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display article title
            CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(height: 16),

            Text(
              title, // Replace with the actual title key
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (content != '') const SizedBox(height: 16.0),

            // Display article content
            if (content != '')
              Text(
                content != ''
                    ? content
                    : '', // Replace with the actual content key
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),

            if (content2 != '')
              Text(
                content2, // Replace with the actual content key
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            if (location != '')
              ListTile(
                leading: const Icon(Icons.location_pin),
                title: Text('Location: $location'),
                onTap: () {
                  // Add functionality to open the email app with the recipient's email address pre-filled
                  _launchURL(locationurl);
                },
              ),
            if (phone != '')
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text('Phone: $phone'),
                onTap: () {
                  // Add functionality to open the email app with the recipient's email address pre-filled
                  _launchURL('tel:$phone');
                },
              ),
            if (hours != '')
              ListTile(
                leading: const Icon(Icons.watch_later),
                title: Text('Hours:\n $hours'),
              ),
            if (website != '')
              ListTile(
                leading: const Icon(Icons.public),
                title: Text('Website: $website'),
                onTap: () {
                  // Add functionality to open the email app with the recipient's email address pre-filled
                  _launchURL(website);
                },
              ),
            // Add other widgets to display additional details as needed
          ],
        ),
      ),
    );
  }
}

class ExploreKL_Gperak extends StatefulWidget {
  const ExploreKL_Gperak({super.key});

  @override
  _ExploreKL_GperakState createState() => _ExploreKL_GperakState();
}

class _ExploreKL_GperakState extends State<ExploreKL_Gperak> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Ipoh'),
              Tab(text: 'Batu Gajah'),
              Tab(text: 'Kampar'),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title:
              const Text("Greater Ipoh", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(
          children: [
            MyList8(
              items: [
                ItemData8(
                  'Lost World of Tambun',
                  'assets/img/explore/greateripoh/ipoh/lost world of tambun.jpg',
                  'The only theme park in Southeast Asia with natural hot springs coupled with an array of attractions and rides. The self-contained wonderland is cocooned by lush tropical jungle, natural hot springs, and breathtaking limestone features. Just a stone’s throw away is the Lost World Hotel, a perfect snooze chamber after a long day of adventure.',
                  '1, Persiaran Lagun Sunway, Sunway City, 31150 Ipoh, Perak',
                  '+605-540 8888',
                ),
                ItemData8(
                  'Kek Long Tong Cave Temple',
                  'assets/img/explore/greateripoh/ipoh/Kek Long Tong Cave.jpg',
                  'Also known as Cave of Supreme Bliss (or Great Happiness) (sometimes spelt as Kek Look Tong) and actually, it seems to offer a feeling of well-being to the many local travellers who regard it as their favourite among the many splendid cave temples of Ipoh. Since the 1920s, the cave has been used as a place of worship, but the area was involved in iron ore mining during the 1960s and parts of the cave were excavated for this practice. It was devoted again to religious purposes when mining ceased and opened up to tourists in the 1970s. The cave floor has been levelled and paved, and many of the lower walls are lined with tiles of marble.',
                  'Pesiaran Sepakat 3, Taman Endah Jaya, 31350 Ipoh, Perak',
                  '+605-312 8112',
                ),
                ItemData8(
                  'Concubine Lane',
                  'assets/img/explore/greateripoh/ipoh/Concubine Lane.jpg',
                  'Locals say the lane was founded by mining tycoon Yao Tet Shin for his three wives. Wife Lane, Concubine Lane, and First Concubine Lane were fittingly named for each lane. Whereas another interpretation of the local tale is that it was also the location where their mistresses were concealed by rich men. Today, Concubine Lane is the most famous lane, with a variety of pop-up stalls selling delicious ice balls, flower-shaped cotton candy and more, having been turned into a popular hangout spot.',
                  '30000 Ipoh, Perak',
                  '',
                ),

                // Add more Muslim places of worship here
              ],
            ),
            MyList8(
              items: [
                ItemData8(
                  'Kellie’s Castle',
                  'assets/img/explore/greateripoh/ipoh/Kellie_s_Castle_Sideview.jpg',
                  'Kellie’s Castle also known as Kellie’s Follie is an unfinished ruined mansion built by a Scottish planter named William Kellie-Smith. According to different stories, it was either a gift to his wife or home to his son. Kellie’s Castle is located beside the Raya River (Sungai Raya), which is a small creek on the Kinta River. Apart from being haunted, it is believed that the castle has hidden rooms and secret underground tunnels. The road leading to the castle follows the contours of the land in a dizzying, maze-like fashion, adding to the mystery and romance of the place.',
                  'Kellie\'s Castle, Batu 5, Jalan Gopeng, 31000 Batu Gajah, Perak',
                  '+605-365 3381',
                ),
                ItemData8(
                  'Tanjung Tualang Tin Dredge',
                  'assets/img/explore/greateripoh/ipoh/TT5_Tin_Dredge_-_panoramio_(4).jpg',
                  'Tanjung Tualang Tin Dredge No.5 or TT5 is a rare remnant of Malaysia’s tin mining industry. It weighs 4,500 tons and is backed by a pontoon 75 metre long, 35 metres wide and 3 metres deep. The dredge was designed in England in 1938 by F.W.Payne & Son and was built for Southern Malayan Tin Dredging Ltd. a company established in 1926 that worked another 5 dredges in the Batu Gajah and Tanjung Tualang regions.',
                  '9th KM, Jln Tanjung Tualang, 31000 Batu Gajah',
                  '+6014-904 3255',
                ),

                // Add more Buddhist/Tao places of worship here
              ],
            ),
            MyList8(
              items: [
                ItemData8(
                  'Kinta Tin Mining (Gravel Pump) Museum',
                  'assets/img/explore/greateripoh/ipoh/kinta tin mine.jpg',
                  'This museum provides a glimpse of the scale of the tin mining industry in Kampar. It also acts as a memorial to the local tin miners who took up the backbreaking work to earn a decent living. The enthralling figurines well portray the gruesome challenges both men and women of Kampar had to face as they cleared new lands to find precious minerals.',
                  'Lot 126026, Jalan Batu Karang, Taman Bandar Baru, 31900 Kampar, Perak',
                  '+6012-288 8530',
                ),
                ItemData8(
                  'Japanese Carbide Chimney, Malim Nawar',
                  'assets/img/explore/greateripoh/ipoh/japanese chimney.jpg',
                  'If you didn’t know this already, the Malim Nawar Chimney is a WW2 brick chimney designed by the Japanese as part of a carbide manufacturing plant for weapons purposes. It is said that the facility has never been completed. The chimney is about 18 meters high, with a diameter of 6 meters at the base and about 3 metres at the apex.',
                  'Japanese Carbide Chimney, 31700 Malim Nawar, Perak',
                  '',
                ),
                ItemData8(
                  'Tempurung Cave (Gua Tempurung)',
                  'assets/img/essentials/iconsofperak/tempurung cave.jpg',
                  'This is the largest limestone cave in Peninsular Malaysia. This cave is believed to be 400 million years old and consists of five large domes and each has a different formations of stalagmite and stalactite. The ceiling of the cave is shaped like a coconut shell hence its name. It is also notable that the 3 kilometres cave was used as a hiding place by communist terrorists from 1950 to 1960.',
                  'Pusat Pelancongan Gua Tempurung,, 31600 Gopeng, Perak',
                  '+6012-529 2426',
                ),
                // Add more Hindu places of worship here
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyList8 extends StatelessWidget {
  final List<ItemData8> items;

  MyList8({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  items[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Description: ${items[index].description}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const SizedBox(height: 8.0),
                    Text(
                      'Contact: ${items[index].contact}',
                      style: const TextStyle(
                        fontSize: 16.0,
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

  void _launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ItemData8 {
  final String text;
  final String imageUrl;
  final String description;
  final String location;
  final String contact;

  ItemData8(
      this.text, this.imageUrl, this.description, this.location, this.contact);
}

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
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Perak Tengah'),
              Tab(text: 'Manjung'),
              Tab(text: 'Lumut'),
              Tab(text: 'Pangkor Island'),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title:
              const Text("Perak Tengah", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(
          children: [
            MyList(
              items: [
                ItemData(
                  'Pasir Salak Historical Complex',
                  'assets/img/explore/peraktengah/peraktengah/Pasir_Salak.jpg',
                  'Pasir Salak Historical Complex is a charming museum of Malay traditional buildings, which are situated 50 km south of Ipoh along the Perak River. In 2004 it was officially opened to the public as the Pasir Salak Historical Complex. Now all seems calm, but this was not always the case because Mr J.W.W. Birch, the first British resident of Perak was assassinated in 1875.',
                  'Kompleks Sejarah, 36800 Kampung Gajah, Perak',
                  '05-631 1462',
                ),
                ItemData(
                  'River Terrapin Conservation Centre',
                  'assets/img/explore/peraktengah/peraktengah/River Terrapin Conservation Centre.jpg',
                  'Travellers can also drop by the River Terrapin Conservation Centre to see the conservation efforts on this endangered species.',
                  'Bota Kanan, 32600 Bota, Perak',
                  '+605-376 2726',
                ),
                ItemData(
                  'Pangkor Island',
                  'assets/img/explore/peraktengah/pangkor_island.jpg',
                  'Pangkor Island, ("Pang Koh" which translates to “beautiful island” in Thai ), is famed for its stunning white sands, and crystal blue water, appears like paradise island for many travellers.',
                  'Strait of Malacca',
                  '',
                ),

                // Add more Muslim places of worship here
              ],
            ),
            MyList(
              items: [
                ItemData(
                  'Teluk Senangin',
                  'assets/img/explore/peraktengah/peraktengah/teluk senangin.jpg',
                  'Teluk Senangin is about 30 km from Sitiawan. Teluk Senangin Beach has white sand and blue seawater. Here, tourists have the chance to see the breathtaking scenery of the Straits of Melaka and Pangkor, particularly in the evening. In addition, this beach is frequently visited by anglers and is popular with the organisation of fishing competition programs.',
                  'Jalan Teluk Senangin, 32200 Lumut, Perak',
                  '',
                ),

                // Add more Buddhist/Tao places of worship here
              ],
            ),
            MyList(
              items: [
                ItemData(
                  'Segari Turtle Sanctuary, Lumut',
                  'assets/img/explore/peraktengah/peraktengah/Segari Turtle Sanctuary.jpg',
                  'This is where you\'ll find Malaysia\'s green sea turtles. If you happen to be in Perak, you can\'t afford to miss this incredible place. This site is the result of measures taken by the Malaysian Government to provide a natural habitat for green sea turtles, as only 7 species remain. This sanctuary is home to these turtle species that are slowly extincting. These include the Leatherback, Gray, Hawksbill, and Olive Ridley Turtles. There are also turtle displays in the sanctuary that provide a lot of knowledge about the turtles.',
                  '34900 Lumut, Perak',
                  '',
                ),
                ItemData(
                  'Teluk Batik',
                  'assets/img/explore/peraktengah/peraktengah/Teluk_Batik.jpg',
                  'Teluk Batik Beach is located near the towns of Lumut and Sitiawan and offers views of Pangkor Island. With clear blue waters and soft sandy beaches, this spot is ideal for getting away from crowds. The beach is located in a beautiful bay with headlands rising at either end and topped by a jungle. It is also lined with coconut palms and other trees, providing some shade and creating a tropical atmosphere.',
                  '32200, Perak',
                  '',
                ),

                // Add more Hindu places of worship here
              ],
            ),
            MyList(
              items: [
                ItemData(
                  'Jetty',
                  'assets/img/explore/peraktengah/peraktengah/jetty.jpg',
                  'With the new construction of the private resort island of Marina Island Pangkor, you will now need to take a 7-minute ferry ride to Pulau Pangkor, saving you hours of waiting compared to the current ferry service from Lumut Jetty. You can get to Marina Island Jetty from the mainland by car via a 400m bridge to Marina Island.',
                  '34900 Lumut, Perak',
                  '',
                ),

                // Add more Hindu places of worship here
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  final List<ItemData> items;

  MyList({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  items[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Description: ${items[index].description}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const SizedBox(height: 8.0),
                    Text(
                      'Contact: ${items[index].contact}',
                      style: const TextStyle(
                        fontSize: 16.0,
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

  void _launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ItemData {
  final String text;
  final String imageUrl;
  final String description;
  final String location;
  final String contact;

  ItemData(
      this.text, this.imageUrl, this.description, this.location, this.contact);
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
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("Instagrammable Cafes",
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: MyList7(
        items: [
          ItemData7(
            'Botanica Co Cafe',
            'https://www.klangvalley4locals.com.my/assets/img/wtd/ig/1.jpg',
            'G5, 8, Jalan Kerinchi, Bangsar South, 59200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
            '11.30 am - 10.00 pm (Monday - Wednesday), 11.30 am - 12.00 am (Friday), 9.30 am - 12.00 am (Saturday), 9.30 am - 10.00 pm (Sunday)',
            '+6016-965 6422',
          ),
          ItemData7(
            'Wildflowers KL',
            'https://www.klangvalley4locals.com.my/assets/img/wtd/ig/2.jpg',
            '153, Jalan Petaling, City Centre, 50000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
            '12.00 pm - 12.00 am (Friday - Sunday), 12.00 pm - 10.30 pm (Monday - Thursday), Closed on Tuesday',
            '+603-2856 3369',
          ),
          ItemData7(
            'A Pie Thing',
            'https://www.klangvalley4locals.com.my/assets/img/wtd/ig/3.jpg',
            '128 G, Jalan SS 21/35, Damansara Utama, 47400 Petaling Jaya, Selangor',
            '10.00 am - 9.00 pm (Tuesday - Sunday), Closed on Monday',
            '+6012-951 5233',
          ),
          // Add more parks here
        ],
      ),
    );
  }
}

class ItemData7 {
  final String text;
  final String imageUrl;
  final String location;
  final String hours;
  final String contact;

  ItemData7(this.text, this.imageUrl, this.location, this.hours, this.contact);
}

class MyList7 extends StatelessWidget {
  final List<ItemData7> items;

  MyList7({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  items[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Operating Hours: ${items[index].hours}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    if (items[index].contact.isNotEmpty) ...[
                      const SizedBox(height: 8.0),
                      Text(
                        'Contact: ${items[index].contact}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ExploreKL_TMalim extends StatefulWidget {
  const ExploreKL_TMalim({super.key});

  @override
  _ExploreKL_TMalimState createState() => _ExploreKL_TMalimState();
}

class _ExploreKL_TMalimState extends State<ExploreKL_TMalim> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tanjung Malim'),
              Tab(text: 'Sungkai'),
              Tab(text: 'Tapah'),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title: const Text("Tanjung Malim",
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(
          children: [
            MyList6(
              items: [
                ItemData6(
                  'Ujana Muallim',
                  'assets/img/explore/tanjungmalim/tanjungmalim/Ujana Muallim.jpg',
                  'Ujana Muallim is an Urban Forest Park within the Proton City area of ​​38.16 acres, located about 2km from Sultan Idris University of Education (UPSI).',
                  'Jalan Pc10, 35900 Tanjong Malim, Perak',
                  '',
                ),
                ItemData6(
                  'National Education Museum',
                  'assets/img/explore/tanjungmalim/tanjungmalim/National Education Museum.jpg',
                  'Conveniently situated in the historical Sultan Idris University of Education (UPSI), this museum boasts 21 permanent galleries and a theme gallery exhibiting significant history, revolution and prominent figures in education in Malaysia. Constructed in 1919, the building is also known as the Suluh Budiman Building. The architecture is influenced by the Church of Notre Dame in France and the Church of Salisbury in England. Thus, Dutch-Gothic architecture can be seen both internally and externally. In 2009, the building was declared a Cultural Heritage Building in recognition of its significance as a national heritage. The museum is also surrounded by other heritage buildings that tourists can visit for free.',
                  'Jalan Utama Upsi, 35900 Tanjong Malim, Perak',
                  '+605-450 6680',
                ),
                ItemData6(
                  'Sarang Art Hub',
                  'assets/img/explore/tanjungmalim/tanjungmalim/Sarang Art Hub.jpg',
                  'Sarang Art Hub is located near KFC and Pizza Hut Tg.Malim at Rest House or Rumah Rehat Tg.Malim. This cafe first opened its doors in 2015. Aside from that, this cafe is the outcome of Tanjung Malim District Council’s (MDTM) efforts to enliven the place. Sarang Art Hub is owned by film director Mamat Khalid that features a unique idea of sculpture, design, fine art, music, and food art.',
                  'Hot Springs Ulu Slim, 35800 Slim River, Perak',
                  '+6012-525 8798',
                ),

                // Add more Muslim places of worship here
              ],
            ),
            MyList6(
              items: [
                ItemData6(
                  'Sungai Klah',
                  'assets/img/explore/tanjungmalim/tanjungmalim/Sungai Klah Hot Springs.jpg',
                  'Sungai Klah is well known among travellers for its hot springs. The spring has been developed to have separated areas, to highlight their special features. Some of which are the water theme park, hot springs swimming pool, therapeutic pools, family baths and egg boiling area. With added facilities, it helps to ease all visiting experiences. For those looking for more privacy, they can opt for the private jacuzzis or take up the reflexology packages.',
                  '35600 Sungkai, Perak',
                  '+6019-279 0022',
                ),
                ItemData6(
                  'Nasi Bamboo Sungai Klah',
                  'assets/img/explore/tanjungmalim/tanjungmalim/nasi bamboo.jpg',
                  'Nearby the Sungai Klah Hot Springs is the famous Bamboo Rice Restaurant. True to its name, their speciality is the rice wrapped with the ‘Daun Lirik’ (known as Calathea Leaves) and cooked in Bamboo sticks. With a vast variety of authentic local dishes to pair up with the rice, customers are sure to have an enjoyable experience. Some of the favourite choices to eat with the rice is the popular Perak dish, Rendang Tok, and the store’s speciality, Ayam Bunian.',
                  'Kampung Buloh Telor, 35600 Sungkai, Perak',
                  '+6017-516 7592',
                ),

                // Add more Buddhist/Tao places of worship here
              ],
            ),
            MyList6(
              items: [
                ItemData6(
                  'Lata Kinjang',
                  'assets/img/explore/tanjungmalim/tanjungmalim/Lata Kinjang.jpg',
                  'This is one of the most famous waterfall spots in Malaysia, having a few accessible waterfalls for visitors to enjoy. There are pathways to get to four of the waterfalls before you need to hike up the trails and reach the rest of the higher locations. Public facilities such as picnic huts, bathrooms, and nearby shops are available on site. The surrounding environment has been placed with informative descriptions on the plants and animals in the area. A fun activity to do is walking on the suspension bridge seen above the waters',
                  '35300 Chenderiang, Perak',
                  '+605-528 8100',
                ),
                ItemData6(
                  'Lata Iskandar',
                  'assets/img/explore/tanjungmalim/tanjungmalim/Lata Iskandar.jpg',
                  'Lata Iskandar is a waterfall located about 25 kilometres before Ringlet on the trunk road from Tapah to Cameron Highlands. The waterfall cascades down many stages of granite slopes, with the last drop at 25 metres high falling into a little pool below before rejoining the stream.',
                  'Exit 59, 35000 Tapah, Perak',
                  '+605-401 1402',
                ),

                // Add more Hindu places of worship here
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyList6 extends StatelessWidget {
  final List<ItemData6> items;

  MyList6({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  items[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Description: ${items[index].description}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const SizedBox(height: 8.0),
                    Text(
                      'Contact: ${items[index].contact}',
                      style: const TextStyle(
                        fontSize: 16.0,
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

  void _launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ItemData6 {
  final String text;
  final String imageUrl;
  final String description;
  final String location;
  final String contact;

  ItemData6(
      this.text, this.imageUrl, this.description, this.location, this.contact);
}

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
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Taiping'),
              Tab(text: 'Kuala Sepetang'),
              Tab(text: 'Selama'),
              Tab(text: 'Kerian'),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title: const Text("Taiping", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(
          children: [
            MyList2(
              items: [
                ItemData2(
                  'Hike up Maxwell Hill',
                  'assets/img/explore/taiping/taiping/Maxwell Hill.jpg',
                  'Bukit Larut overlooks Taiping\'s scenic Lake Gardens and the old town of Taiping. There are only two ways to get to Maxwell Hill\'s summit. Take a government-owned Land Rover or take a 10-kilometre hike to the summit. Walking is also a possibility, as we have done it ourselves.',
                  'Bukit Larut, 34000 Taiping, Perak',
                  '',
                ),
                ItemData2(
                  'Go Back In Time At Perak Museum',
                  'assets/img/explore/taiping/taiping/Perak Museum.jpg',
                  'The Perak Museum was the first museum to be set up in Malaysia in 1883. Located at the junction of Jalan Muzium and Jalan Taming Sari, it stands directly opposite the Taiping Prison. The 8,474 exhibits Malaysia\'s civilization, zoology and geology, among many other bits of ancient history that have been overlooked for a long time. Some of the exhibits display the culture and the products of the native tribes of Perak, including the Senoi and Negrito tribes.',
                  'Jalan Taming Sari, 34000 Taiping, Perak',
                  '++605-807 2057',
                ),
                ItemData2(
                  'Taiping Zoo & Night Safari',
                  'assets/img/explore/taiping/taiping/Taiping Zoo.jpg',
                  'Spread over an area of 36 acres, the Taiping Zoo has embarked on an expansion program involving the construction of new "Open Concept" animal enclosures. These enclosures, which take into account the natural environment of the animal concerned, have been favourably received by the public, both for their inner beauty and their thoughtful nature.',
                  'Jalan Taman Tasik Taiping, Taman Tasik Taiping, 34000 Taiping, Perak',
                  '+605-808 6577',
                ),

                // Add more Muslim places of worship here
              ],
            ),
            MyList2(
              items: [
                ItemData2(
                  'Charcoal Factory Kuala Sepetang',
                  'assets/img/explore/taiping/kualasepetang/Charcoal Factory Kuala Sepetang.jpg',
                  'This big, eighty-year-old coal factory is open to the public. When you visit the factory, you\'ll hear about the method of producing charcoal. Guiding tours are available. But you can visit the factory on your own, too. Workers are going to tell you with excitement about the operation. You will hear a lot more from them about the factory. Take your children to this factory and let them be astounded by the whole operation. Don\'t forget to wear face masks, as they appear to get smoky occasionally.',
                  'Jalan Taiping - Kuala Sepetang, Kuala Sepetang, 34650 Kuala Sepetang, Perak',
                  '+6012-428 6098',
                ),
                ItemData2(
                  'Matang Mangrove Forest Reserve',
                  'assets/img/explore/taiping/kualasepetang/Matang Mangrove Forest Reserve.jpg',
                  'The Matang Mangrove Forest Reserve is further up the road from the charcoal factory. The main attraction here is a boardwalk that enables you to walk among the mangroves and enjoy the swamp life (birds and small aquatic creatures) without getting your shoes in the dirt!',
                  'Kampung Kuala Sepetang, 34650 Kuala Sepetang, Perak',
                  '+6012-514 5023',
                ),
                ItemData2(
                  'Fireflies Kuala Sepetang',
                  'assets/img/explore/taiping/kualasepetang/Fireflies Kuala Sepetang.jpg',
                  'It takes a special species of mangrove trees to attract the almost vanishing fireflies. The Avicennia ssp does not only provide a home for these fireflies, but it is also a breeding ground for birds. Take a magical river cruise in Kampung Dew and witness how the fireflies light up like tiny fairy lights.',
                  '1, Kampung Dew, 34400 Simpang Empat Semanggol, Perak',
                  '+6019-578 6456',
                ),

                // Add more Buddhist/Tao places of worship here
              ],
            ),
            MyList2(
              items: [
                ItemData2(
                  'Lata Tebing Tinggi / Lata Mengkuang',
                  'assets/img/explore/taiping/selama/Lata Tebing Tinggi.jpg',
                  'Lata Tebing Tinggi (Lata Mengkuang), is one of the seven waterfalls in Perak that is opened to the public. Tucked away 300 metres from the main road, this waterfall is easily accessible without the need for a 4-wheel drive vehicle. This waterfall is one of the mildest waterfalls in this state, which makes it suitable even for children. The icing on the cake is the fact that the entrance to this waterfall is free.',
                  'Lata Tebing Tinggi, 34140 Rantau Panjang, Perak',
                  '',
                ),
                ItemData2(
                  'Sungai Atas Sungai (River Atop A River)',
                  'assets/img/explore/taiping/selama/Sungai Atas Sungai.jpg',
                  'The name of this place is pretty self-explanatory, but how is that even possible? It is a water canal that flows from Sungai Ijok for 3.5 kilometres to Sungai Atas Sungai before passing Sungai Redang Panjang, which flows underneath it.',
                  'Sungai Atas Sungai, Selama, 34510 Redang Panjang, Perak',
                  '',
                ),

                // Add more Hindu places of worship here
              ],
            ),
            MyList2(
              items: [
                ItemData2(
                  'Orang Utan Island (Bukit Merah)',
                  'assets/img/explore/taiping/kerian/Orang Utan Island (Bukit Merah).jpg',
                  'Nestled in the idyllic setting of Bukit Merah Laketown Resort, Orang Utan Island is one of the best rehabilitation and conservation centres in the world. The island is a reference centre for the endangered Bornean orang utan. The Orang Utan Island is one of Malaysia’s most popular tourist attractions. After its development in 2000, orang utan Island transitioned from a sanctuary where visitors experienced first-hand orang utan knowledge and education, to a recognised conservation facility and a referral centre for endangered Bornean orang utan.',
                  'A197, 34400 Simpang Empat Semanggol, Perak',
                  '+605-890 8110',
                ),
                ItemData2(
                  'Kuala Gula Bird Sanctuary',
                  'assets/img/explore/taiping/kerian/Kuala Gula Bird Sanctuary.jpg',
                  'Bird watchers, get your binoculars ready! Nestled within the Matang Forest Reserve is the Kuala Gula Bird Sanctuary. Kelumpang Island is a valuable breeding area for waterbirds and nesting ground for resident birds. This humble fishing village is only 50 kilometres away from Taiping covers both the intertidal and mangrove habitat.',
                  'Perhilitan Kuala Gula Birds Sanctuary, 34350 Kuala Kurau, Perak',
                  '+605-890 2207',
                ),

                // Add more Hindu places of worship here
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyList2 extends StatelessWidget {
  final List<ItemData2> items;

  MyList2({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  items[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Description: ${items[index].description}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const SizedBox(height: 8.0),
                    Text(
                      'Contact: ${items[index].contact}',
                      style: const TextStyle(
                        fontSize: 16.0,
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

  void _launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ItemData2 {
  final String text;
  final String imageUrl;
  final String description;
  final String location;
  final String contact;

  ItemData2(
      this.text, this.imageUrl, this.description, this.location, this.contact);
}

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
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Kuala Kangsar'),
              Tab(text: 'Lenggong Valley'),
              Tab(text: 'Gerik'),
              Tab(text: 'Pangkalan Hulu'),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title: const Text("Kuala Kangsar",
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(
          children: [
            MyList5(
              items: [
                ItemData5(
                  'Try a Hand at Making Labu Sayong',
                  'assets/img/explore/kualakangsar/kualakangsar/Labu Sayong.jpg',
                  'Nothing screams Kuala Kangsar the way this humble gourd-shaped black pitcher does. Though people claim that the water stored in a Labu Sayong may have healing properties, the locals store liquids in it to keep it cool. One of the fascinating things you will encounter in Kuala Kangsar is the art of using a wheel throwing machine to make Labu Sayong. In some workshops, you can see how it’s made traditionally, or you can get your hands dirty by making your own.',
                  'Labu Sayong Craft Centre, 33040 Kuala Kangsar, Perak',
                  '+6017-549 9942',
                ),
                ItemData5(
                  'Laksa Sarang Kuala Kangsar',
                  'assets/img/explore/kualakangsar/kualakangsar/Laksa Sarang Kuala Kangsar.jpg',
                  'Laksa lovers rejoice. If you’re someone who loves a good bowl of mouth-watering laksa, head over to Warung Telaga Kota Lama Kiri to satisfy your laksa cravings. What makes this laksa stand out? Well, it’s a Northern style Malay Laksa with a twist; an omelette fried to look like a bird’s nest put on top!',
                  'Kampung Kuala Chempias, 33000 Kuala Kangsar, Perak',
                  '+6012-593 4771',
                ),
                ItemData5(
                  'Masjid Ihsaniah Iskandariah',
                  'assets/img/explore/kualakangsar/kualakangsar/Masjid Ihsaniah Iskandariah.jpg',
                  'The mosque was built in 1936 and funded by the then Sultan of Perak, Sultan Iskandar Shah. He was fulfilling a promise to build a mosque following the recovery of one of his children. The design incorporated some of the architectural features found in his palace, Istana Kenangan. The mosque was in use until 1976 then abandoned and fell into disrepair until the Department of National Heritage restored it in 2008.',
                  'Kampung Kuala Dal, 33700 Padang Rengas, Perak',
                  '',
                ),

                // Add more Muslim places of worship here
              ],
            ),
            MyList5(
              items: [
                ItemData5(
                  'Lenggong Archaeological Museum',
                  'assets/img/explore/kualakangsar/kualakangsar/Lenggong Archaeological Gallery.JPG',
                  'Lenggong Archaeological Museum is a prehistoric site dating back to 74,000 years ago. It is recognised as one of the oldest sites of human activity in West Malaysia. It also displays Perak Man, the oldest human skeleton found in Peninsular Malaysia in the caves nearby. The museum is situated near the Lipur Lata Kekabu Rainforest.',
                  'Jabatan Warisan Negara Zon Tengah, Kota Tampan, 33400 Lenggong, Perak',
                  '+605-767 9700',
                ),
                ItemData5(
                  'Restoran Tasik Raban',
                  'assets/img/explore/kualakangsar/kualakangsar/Restoran Tasik Raban.jpg',
                  'Located exactly next to the East-West Highway near Tasek Raban, this restaurant has been serving up some of the best grilled fish in the area.',
                  'Restoran Tasek Raban, 33400 Lenggong, Perak',
                  '+6019-521 5657',
                ),

                // Add more Buddhist/Tao places of worship here
              ],
            ),
            MyList5(
              items: [
                ItemData5(
                  'Royal Belum Rainforest',
                  'assets/img/explore/kualakangsar/kualakangsar/Royal Belum State Park.jpg',
                  'Royal Belum Rainforest is one of the oldest rainforests in the world, dating back to over 130 million years. The park houses 14 of the world’s most threatened mammals including the iconic and threatened Malayan tiger. Ten species of hornbills, the highest number in the country, in the region and in the World in one single locality. The rainforest also contains 18 species of frogs and toads, 67 species of snakes, and more than 132 species of beetles.',
                  'Royal Belum Perak State Park, 33300 Gerik, Perak',
                  '+6013-400 5468',
                ),
                ItemData5(
                  'Rafflesia Park, Kampung Bongor',
                  'assets/img/explore/kualakangsar/kualakangsar/Rafflesia Park.jpg',
                  'Rafflesia Park is located in Bersia, Gerik, at Bongor Village. Bongor Village is only a 25-minute drive away. A gravel road takes 30 minutes to go from the settlement to the foothill. It takes another hour and a half to walk from the foothill to the rafflesia region. One of the floral attractions is that three species of Rafflesia can be found in Royal Belum which are Rafflesia cantleyi, Rafflesia kerrii and Rafflesia azlanii.',
                  '',
                  '',
                ),

                // Add more Hindu places of worship here
              ],
            ),
            MyList5(
              items: [
                ItemData5(
                  'Tasek Takong',
                  'assets/img/explore/kualakangsar/kualakangsar/tasekTakong.png',
                  'Tasek Takong was named after Raja Reman, who governed Pattani, Thailand, to his colonies in Pengkalan Hulu (previously known as Kroh), Lenggong, and Kedah over 100 years ago and terminated when the district was given over to the Perak government on 16 July 1909. Previously, the lake was a flat land region, but Raja Reman rallied the locals to build a reservoir to offer amenities for hundreds of his elephants to graze and bathe.',
                  'Tasek Takong, 33100 Pengakalan Hulu, Perak',
                  '',
                ),
                ItemData5(
                  'Gua Gendang',
                  'assets/img/explore/kualakangsar/kualakangsar/GuaGendang.jpg',
                  'Located 6 kilometres from Pengakalan Hulu town, this cave has dubbed the name Gua Gendang due to the splashing of water against the walls of the cave that creates sound like drums being beaten. Historically, this cave also served as a hiding spot for the communist 50 years ago. Gua Gendang is a new discovery and is a unique attraction located in a very attractive natural area and surrounded by greenery and the originality of tropical forests.',
                  'Kem Rekreasi Gua Gendang, 33100 Pengkalan Hulu, Perak',
                  '+6019-455 9519',
                ),
                ItemData5(
                  'Rahman Hydraulic Tin Mine',
                  'assets/img/explore/kualakangsar/kualakangsar/RahmanHydraulicTinMine.jpg',
                  'Rahman Hydraulic Tin Ore Mine has been in operation in Klian Intan, Hulu Perak, since 1907. This mining firm is responsible for the majority of Malaysia’s hard rock tin mining operations. What distinguishes Rahman Hydraulic mining from other tin mining is the employment of a hydraulic pump to draw the tin into the trough. The tin mine is still open for business today. Surprisingly, it has been turned into a tourist attraction as well as a place of education for current and future generations.',
                  '2007, Jalan Baling - Kuala Kangsar, Kampung Bukit Buloh, 33100 Pengkalan Hulu, Perak',
                  '+604-477 0698',
                ),

                // Add more Hindu places of worship here
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyList5 extends StatelessWidget {
  final List<ItemData5> items;

  MyList5({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  items[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Description: ${items[index].description}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const SizedBox(height: 8.0),
                    Text(
                      'Contact: ${items[index].contact}',
                      style: const TextStyle(
                        fontSize: 16.0,
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

  void _launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ItemData5 {
  final String text;
  final String imageUrl;
  final String description;
  final String location;
  final String contact;

  ItemData5(
      this.text, this.imageUrl, this.description, this.location, this.contact);
}

class ExploreKL_TelukIntan extends StatefulWidget {
  const ExploreKL_TelukIntan({super.key});

  @override
  _ExploreKL_TelukIntanState createState() => _ExploreKL_TelukIntanState();
}

class _ExploreKL_TelukIntanState extends State<ExploreKL_TelukIntan> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Teluk Intan'),
              Tab(text: 'Bagan Datuk'),
              Tab(text: 'Pulau Sembilan'),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title:
              const Text("Teluk Intan", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(
          children: [
            MyList3(
              items: [
                ItemData3(
                  'Take Creative Photos At The Leaning Tower of Teluk Intan',
                  'assets/img/explore/telukintan/telukintan/Leaning Tower of Teluk Intan.jpg',
                  'The leaning tower is synonymous with Teluk Intan’s name. It was actually built for the purpose of storing water during the drought season in case there was a fire. The tower was designed in 1885, late in the 19th century, under the direction of contractor Leong Choon Chong.',
                  'Lot 1&2, Komplex Menara Condong, Jalan Bandar, Pekan Teluk Intan, 36000 Teluk Intan, Perak',
                  '+605-623 7040',
                ),
                ItemData3(
                  'Get To Know Your Cranes At Pulau Bangau',
                  'assets/img/explore/telukintan/telukintan/Pulau Bangau.jpg',
                  'Pulau Bangau is home to 16 species of cranes and also tens of thousands of migratory birds. Cranes and other birds such as hawks and eagles return to the island after a late afternoon meal. The island is also home to swamp storks, Little Egret, Cattle Egret and Egret Maigret.',
                  'Jalan Wah Keng Jooi, Pekan Teluk Intan, 36000 Teluk Intan, Perak',
                  '+605-623 7040',
                ),
                ItemData3(
                  'Ladang Moccis',
                  'assets/img/explore/telukintan/telukintan/moccis.jpg',
                  'This location is ideal for family and friends, with activities throughout the complex perfect for family days, teambuilding, and gatherings of friends for a BBQ session. Among activities that you can take part in would be ATV, fishing, kayaking, barbecue and cycling. Apart from this, there’s also a petting zoo within the premis. There are also chalets available for those who wish to spend the night.',
                  'Ladang MOCCIS, KM 14, Jln Chkt Jong, Teluk Intan, Perak',
                  '+605-622 1300',
                ),

                // Add more Muslim places of worship here
              ],
            ),
            MyList3(
              items: [
                ItemData3(
                  'Shine Bright Like The Sunshine At Sunflower Garden, Bagan Datuk',
                  'assets/img/explore/telukintan/telukintan/Sunflower Garden, Bagan Datuk.jpg',
                  'The perfect place for those who love sunflowers! The sunflower farm in Bagan Datuk is getting more and more tourist coverage. For those who want to take photos of interesting places to visit, this will be the ideal spot for you.',
                  'A128, 36100 Bagan Datuk, Perak',
                  '+6019-207 4608',
                ),
                ItemData3(
                  'Bagan Sungai Burung',
                  'assets/img/explore/telukintan/telukintan/bagan sungai burung.jpg',
                  'Bagan Sungai Burong is a small fishing village about 50 kilometres west from Teluk Intan. You can find a myriad seafood restaurants in the area. Some of them are Makanan Laut Kang Kao, Restaurant Tepi Sungai, Bintang Sungai Burung Seafood Restaurant, and many more. Do pay this place a visit on your way back from the sunflower garden.',
                  '36100 Bagan Datuk, Perak',
                  '',
                ),
                ItemData3(
                  'Sky Mirror Bagan Datuk',
                  'assets/img/explore/telukintan/telukintan/Sky Mirror Bagan Datuk.jpg',
                  'You probably heard of Sasaran, Selangor\'s Sky Mirror, but did you know that Perak also has its own Sky Mirror? The water levels can get so thin that you could have your reflection of the surface.',
                  '64, Kampung Sungai Burung, 36100 Bagan Datuk',
                  '',
                ),

                // Add more Buddhist/Tao places of worship here
              ],
            ),
            MyList3(
              items: [
                ItemData3(
                  'Watch Waters Transform Into Blue Lights',
                  'assets/img/explore/telukintan/telukintan/Pulau Sembilan.jpg',
                  'The Blue Tears phenomenon that is caused by plankton that allows light when in contact with oxygen has put Pulau Sembilan on the map. This phenomenon can only be witnessed at night, and any wave that falls on the shore lights up with an electric blue glow.',
                  '6B, Bagan Ikan, 36100 Bagan Datuk, Perak',
                  '+605-646 6999',
                ),

                // Add more Hindu places of worship here
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyList3 extends StatelessWidget {
  final List<ItemData3> items;

  MyList3({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  items[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Description: ${items[index].description}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const SizedBox(height: 8.0),
                    Text(
                      'Contact: ${items[index].contact}',
                      style: const TextStyle(
                        fontSize: 16.0,
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

  void _launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ItemData3 {
  final String text;
  final String imageUrl;
  final String description;
  final String location;
  final String contact;

  ItemData3(
      this.text, this.imageUrl, this.description, this.location, this.contact);
}

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
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Historical Places'),
              Tab(text: 'Museums'),
              Tab(text: 'Parks'),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title:
              const Text("Sightseeing", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(children: [
          // Must Visit Tab
          MyList4(
            items: [
              ItemData4(
                'Orang Asli Crafts Museum',
                'https://www.klangvalley4locals.com.my/assets/img/explorekv/ss/hs/1.jpg',
                'Jalan Ampang, Golden Triangle, Kuala Lumpur City Centre, 50088',
                '10:00 am to 10:00 pm',
                '+603 2382 2828',
              ),
              ItemData4(
                'Istana Negara',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/1024px-ISTANA_NEGARA_MALAYSIA.jpg',
                'Jalan Tuanku Abdul Halim, Bukit Damansara, 50480 Kuala Lumpur',
                '24 hours',
                '03-6200 1000',
              ),
              ItemData4(
                'Tunku Abdul Rahman Putra Memorial',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/tarmemo.webp',
                'Jalan Dato Onn, 50480 Kuala Lumpur',
                '10.00am - 5.30pm (Tuesday to Sunday) , 12.00pm - 3.00pm (Temporary closed on Friday)',
                '+603-2694 7277',
              ),
              ItemData4(
                'Menara Kuala Lumpur/ KL Tower',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/kuala-lumpur-2720830_1280.jpg',
                'No. 2 Jalan Punchak Off Jalan P.Ramlee 50250 Kuala Lumpur',
                '11.00 am - 7.00 pm (Monday - Friday), 10.00 am - 10.00 pm (Saturday - Sunday)',
                '+603 2693 7905',
              ),
              // Add more Must Visit places here
            ],
          ),
          // Museums Tab
          MyList4(
            items: [
              ItemData4(
                'Ethnology of the Malay World Museum',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/1.jpg',
                'Jalan Damansara, Tasik Perdana, 50480 Kuala Lumpur',
                '9.00 am - 5.00 pm (Tuesday - Sunday), Closed on Monday',
                '+603-2267 1000',
              ),
              ItemData4(
                'National Textiles Museum',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/2.webp',
                '26, Jalan Sultan Hishamuddin, City Centre, 50000 Kuala Lumpur',
                '9.00 am - 6.00 pm (Daily)',
                '',
              ),
              ItemData4(
                'Museum of Asian Arts',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/3.webp',
                'Jalan Ilmu, 50603 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                '8.30 am - 5.00 pm (Monday - Thursday), 8.30am - 5.00pm (Friday)',
                '+603-796 7380',
              ),
              // Add more Museums here
            ],
          ),
          // KL Art Scene Tab
          MyList4(
            items: [
              ItemData4(
                'Urban Museum',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/urmu.jpg',
                '3, Jalan Bedara, Bukit Bintang, 50200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                '10.00 am - 8.30 pm (Tuesday - Sunday), Closed on Monday',
                '+603-2110 3004',
              ),
              ItemData4(
                'National Art Gallery',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/1art.jpg',
                'No. 2, Jalan Temerloh, Titiwangsa, 53200 Kuala Lumpur',
                'Operation Hours :10.00 am - 4.00 pm (Tuesday - Sunday), Closed on Monday',
                '+603-4026 7000',
              ),
              ItemData4(
                'OUR ArtProjects (The Zhongshan Building)',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/2.jpg',
                '80A, Jalan Rotan, Kampung Attap, 50460 Kuala Lumpur',
                '11.00 am - 7.00 pm (Tuesday - Saturday), Closed on Sunday & Monday',
                '+6016-660 2585',
              ),

              // Add more KL Art Scene places here
            ],
          ),
        ]),
      ),
    );
  }
}

class ItemData4 {
  final String text;
  final String imageUrl;
  final String location;
  final String hours;
  final String contact;

  ItemData4(this.text, this.imageUrl, this.location, this.hours, this.contact);
}

class MyList4 extends StatelessWidget {
  final List<ItemData4> items;

  MyList4({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  items[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Operating Hours: ${items[index].hours}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Contact: ${items[index].contact}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
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

void _launchURL(url) async {
  var url2 = Uri.parse(url);
  if (await canLaunchUrl(url2)) {
    await launchUrl(url2, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
